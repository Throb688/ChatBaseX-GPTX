package dao

import (
	"ChatBaseX-GPTX0113/global"
	"ChatBaseX-GPTX0113/model"
	"fmt"
	"github.com/jinzhu/gorm"
	"sort"
	"strconv"
	"time"
)

var location *time.Location

var MarketAmounts = make(map[int]float64)

func init() {
	location, _ = time.LoadLocation("Asia/Shanghai")
}

var MarketLevels = []model.Level{
	{1, 5000, 15},
	{2, 20000, 25},
	{3, 60000, 35},
	{4, 200000, 45},
	{5, 500000, 55},
	{6, 2000000, 60},
	{7, 5000000, 65},
}

func GetCommunityEarnings() {
	MarketAmounts = make(map[int]float64)
	var distinctParentIDs []int64

	//测试
	if err := global.DBLink.Table("team_tree").
		Select("DISTINCT user_id").
		Where("parent_id = ? ", 0).
		Pluck("parent_id", &distinctParentIDs).
		Error; err != nil {
		fmt.Println(" global.DBLink.Table GetCommunityEarnings err:", err.Error())
	}
	uniqueParentIDs := make(map[int64]struct{})
	var finalDistinctParentIDs []int64
	for _, parentID := range distinctParentIDs {
		if _, exists := uniqueParentIDs[parentID]; !exists {
			uniqueParentIDs[parentID] = struct{}{}
			finalDistinctParentIDs = append(finalDistinctParentIDs, parentID)
		}
	}

	for _, i := range finalDistinctParentIDs {
		var root model.TeamTree
		if err := global.DBLink.Where("user_id = ?", i).First(&root).Error; err != nil {
		}
		root.Achievements = TotalAmount(root.UserId)
		buildTreeRecursive(&root)
		root.CalculateSubPerformance()
		calculateBigMarket(&root)

		SetMarketLevel(&root)
		addNewUserAmountRecordTest(&root)
		DirectReferralEarnings(&root)

		CalculateCommunityEarnings(&root)

		//平级收益
		CalculateUserProfit(&root)
	}

}

// 递归构建树形结构的辅助函数
func buildTreeRecursive(node *model.TeamTree) error {
	var children []model.TeamTree
	if err := global.DBLink.Where("parent_id = ?", node.UserId).Find(&children).Error; err != nil {
		return err
	}
	for i := range children {
		children[i].Achievements = TotalAmount(children[i].UserId)
		if err := buildTreeRecursive(&children[i]); err != nil {
			return err
		}
	}

	node.Children = children
	return nil
}

// 获取用户的BigMarket
func calculateBigMarket(node *model.TeamTree) {
	if len(node.Children) == 0 {
		node.BigMarket = 0
	}

	var maxBigMarket []float64
	for i := range node.Children {
		calculateBigMarket(&node.Children[i])
		maxBigMarket = append(maxBigMarket, node.Children[i].Achievements+node.Children[i].SubPerformance)
	}

	node.BigMarket = MaxFloat64(maxBigMarket)

}

// 获取float64最大的值
func MaxFloat64(slice []float64) float64 {
	if len(slice) == 0 {
		return 0
	}

	// 使用 sort 包对切片进行排序
	sort.Float64s(slice)

	// 去除最大值
	return slice[len(slice)-1]
}

// 获取用户总消费
func TotalAmount(userId int64) float64 {
	var totalAmount float64
	row := global.DBLink.Table("user_sku_record").
		Select("COALESCE(SUM(amount), 0) as total_amount").
		Where("user_id = ? AND type = ?", userId, "AI_COLLECT").
		Row()

	if err := row.Scan(&totalAmount); err != nil {
		fmt.Println("TotalAmount row.Scan(&totalAmount) err:", err.Error())
	}

	return totalAmount
}

// 用于获取用户社区等级
func GetMarketLevel(amount float64) model.Level {
	if amount >= MarketLevels[0].Threshold && amount < MarketLevels[1].Threshold {
		return MarketLevels[0]
	}

	if amount >= MarketLevels[1].Threshold && amount < MarketLevels[2].Threshold {
		return MarketLevels[1]
	}

	if amount >= MarketLevels[2].Threshold && amount < MarketLevels[3].Threshold {
		return MarketLevels[2]
	}

	if amount >= MarketLevels[3].Threshold && amount < MarketLevels[4].Threshold {
		return MarketLevels[3]
	}

	if amount >= MarketLevels[4].Threshold && amount < MarketLevels[5].Threshold {
		return MarketLevels[4]
	}

	if amount >= MarketLevels[5].Threshold && amount < MarketLevels[6].Threshold {
		return MarketLevels[5]
	}
	if amount >= MarketLevels[6].Threshold {
		return MarketLevels[6]
	}

	// 如果金额超过最高阈值，则返回最后一个级别
	return model.Level{}
}

// 设置用户的社区等级和计算的总金额
func SetMarketLevel(node *model.TeamTree) {
	for i := range node.Children {
		SetMarketLevel(&node.Children[i])
		node.Children[i].MarketLevel = GetMarketLevel(node.Children[i].SubPerformance - node.Children[i].BigMarket)
		UpdateCommunityEarnings(node.Children[i].UserId, node.Children[i].MarketLevel.Name, (node.Children[i].SubPerformance - node.Children[i].BigMarket))
		node.Children[i].SumAmount = CalculateReturns(&node.Children[i])
		node.Children[i].CommunityAmount = CommunityProfitCalc(node.Children[i].SumAmount, node.Children[i].MarketLevel.Percentage)
		node.Children[i].CommunityAmount02 = node.Children[i].CommunityAmount - CalculateReturns1(&node.Children[i])
		if node.Children[i].CommunityAmount02 < 0 {
			node.Children[i].CommunityAmount02 = node.Children[i].CommunityAmount
		}
		//addNewUserAmountRecord(node.Children[i].UserId, node.Children[i].CommunityAmount02)
	}
	node.MarketLevel = GetMarketLevel(node.SubPerformance - node.BigMarket)
	UpdateCommunityEarnings(node.UserId, node.MarketLevel.Name, (node.SubPerformance - node.BigMarket))
	node.SumAmount = CalculateReturns(node)
	node.CommunityAmount = CommunityProfitCalc(node.SumAmount, node.MarketLevel.Percentage)
	node.CommunityAmount02 = node.CommunityAmount - CalculateReturns1(node)
	if node.CommunityAmount02 < 0 {
		node.CommunityAmount02 = node.CommunityAmount
	}
	//addNewUserAmountRecord(node.UserId, node.CommunityAmount02)
}

// 计算社区收益工具
func CommunityProfitCalc(amount float64, percentage float64) float64 {
	return amount * 0.01 / 0.6 * 0.4 * percentage / 100
}

// 计算社区收益的总数量
func CalculateReturns(node *model.TeamTree) float64 {
	var amount float64
	for _, i := range node.Children {
		amount += CalculateReturnsRecursive(i, node.MarketLevel.Name)
	}
	return amount
}

// 计算社区收益的总数量的工具
func CalculateReturnsRecursive(node model.TeamTree, parentMarketLevel int) float64 {
	var amount float64
	amount += node.Achievements
	if node.MarketLevel.Name >= parentMarketLevel {
	} else {
		for _, i := range node.Children {
			if i.MarketLevel.Name >= parentMarketLevel {
				amount += i.Achievements
			} else {
				amount += CalculateReturnsRecursive(i, parentMarketLevel)
			}
		}
	}

	return amount
}

// 计算社区收益的总数量
func CalculateReturns1(node *model.TeamTree) float64 {
	var amount float64
	for _, i := range node.Children {
		amount += CalculateReturnsRecursive1(i, node.MarketLevel.Name)
	}
	return amount
}

// 计算社区收益的总数量的工具
func CalculateReturnsRecursive1(node model.TeamTree, parentMarketLevel int) float64 {
	var amount float64
	amount += node.CommunityAmount
	if node.MarketLevel.Name >= parentMarketLevel {
	} else {
		for _, i := range node.Children {
			if i.MarketLevel.Name >= parentMarketLevel {
				//amount += i.CommunityAmount
			} else {
				amount += CalculateReturns1(&i)
			}
		}
	}
	return amount
}

// 插入正式的社区收益
func addNewUserAmountRecord(userid int64, amount float64) {
	if TotalAmount(userid) >= 100 {
		if amount > 0 {
			newUserAmountRecord3 := &model.UserAmountRecord{
				UserID:     userid,
				Type:       10,
				Amount:     amount,
				ExtInfo:    "社区收益",
				CreateTime: time.Now().In(location),
				UpdateTime: time.Now().In(location),
				IsDeleted:  0,
			}
			updateCBUByUserId(userid, amount)
			if err := global.DBLink.Create(&newUserAmountRecord3).Error; err != nil {
				fmt.Println("插入社区收益失败", err)
			}
		}
	}

}

// 更新cbu
func updateCBUByUserId(userId int64, amount float64) {
	result := global.DBLink.Table("user").
		Where("id = ?", userId).
		Updates(map[string]interface{}{"withdraw_cbu": gorm.Expr("withdraw_cbu + ?", amount)})
	if result.Error != nil {
		fmt.Println("UpdateCBUByUserId err：", result.Error.Error())
	}

}

// 更新社区等级
func UpdateCommunityEarnings(userId int64, levelName int, smallMarket float64) {

	result := global.DBLink.Table("user").
		Where("id = ?", userId).
		Updates(map[string]interface{}{"market": "A" + strconv.Itoa(levelName)})
	if result.Error != nil {
		fmt.Println("UpdateCBUByUserId err：", result.Error.Error())
	}

}

// 获取在线消费总金额
func TotalOnlineConsumption() float64 {
	var totalAmount float64
	row := global.DBLink.Table("user_sku_record").
		Select("COALESCE(SUM(amount), 0) as total_amount").
		Where("type = ?", "AI_COLLECT").
		Row()

	if err := row.Scan(&totalAmount); err != nil {
		fmt.Println("TotalAmount row.Scan(&totalAmount) err:", err.Error())
	}

	return totalAmount
}

// 计算加权分红收益工具
func CalculateCommunityEarningsRecursive(levelName int, smallMarket float64) float64 {
	amount := TotalOnlineConsumption() * 0.01 / 0.6 * 0.4 * 0.1 / 4
	return amount * smallMarket / MarketAmounts[levelName]
}

// 插入正式的加权分红收益
func addNewUserCalculateCommunityEarnings(userid int64, amount float64) {
	if TotalAmount(userid) >= 100 {
		if amount > 0 {
			newUserAmountRecord3 := &model.UserAmountRecord{
				UserID:     userid,
				Type:       21,
				Amount:     amount,
				ExtInfo:    "加权分红收益",
				CreateTime: time.Now().In(location),
				UpdateTime: time.Now().In(location),
				IsDeleted:  0,
			}
			updateCBUByUserId(userid, amount)
			if err := global.DBLink.Create(&newUserAmountRecord3).Error; err != nil {
				fmt.Println("加权分红收益", err)
			}
		}
	}
}

// 计算社区收益
func CalculateCommunityEarnings(node *model.TeamTree) {
	if node.MarketLevel.Name >= 4 {
		addNewUserCalculateCommunityEarnings(node.UserId, CalculateCommunityEarningsRecursive(node.MarketLevel.Name, node.SubPerformance-node.BigMarket))
	}
	for _, i := range node.Children {
		CalculateCommunityEarnings(&i)
	}
}

// 获取用户的收益
func GetUserEarnings(userId int64) float64 {
	var totalAmount float64
	now := time.Now().In(location)
	startOfDay := time.Date(now.Year(), now.Month(), now.Day(), 0, 0, 0, 0, now.Location())
	endOfDay := startOfDay.Add(24 * time.Hour)

	// 使用 GORM 进行查询
	query := global.DBLink.Table("user_amount_record").
		Select("COALESCE(SUM(amount), 0) as total_amount").
		Where("user_id = ? AND type IN (?, ?) AND create_time BETWEEN ? AND ?", userId, 2, 7, startOfDay, endOfDay).
		Row()

	if err := query.Scan(&totalAmount); err != nil {
		fmt.Println("GetUserEarnings row.Scan(&totalAmount) err:", err.Error())
		return 0
	}
	return totalAmount
}

// 获取用户的一代二代社区收益
func GetUserEarningsRecursive(userId int64) float64 {
	var sumResult float64

	// 使用 GORM 进行查询
	if err := global.DBLink.Table("user_amount_record").
		Where("user_id = ? AND type IN (8,9,10)", userId).
		Select("COALESCE(SUM(amount), 0)").Row().
		Scan(&sumResult); err != nil {
		fmt.Println("Error querying user amount sum:", err.Error())
	}
	return sumResult
}

// 计算平级奖励
func CalculateUserProfit(node *model.TeamTree) {
	if node.MarketLevel.Name > 0 && node.MarketLevel.Name < 4 {
		for _, i := range node.Children {
			CalculateUserProfitReturnsRecursive1(&i, node.MarketLevel.Name, node.UserId)
		}
	}
}

// 遍历平级奖励收益
func CalculateUserProfitReturnsRecursive1(node *model.TeamTree, levenName int, userId int64) {
	if node.MarketLevel.Name >= levenName && node.MarketLevel.Name < 4 {
		addNewUserAmountRecord2(userId, GetUserEarningsRecursive(node.UserId))
		return
	}
	for _, i := range node.Children {
		CalculateUserProfitReturnsRecursive1(&i, levenName, userId)
	}
}

// 插入平级收益
func addNewUserAmountRecord2(userid int64, amount float64) {
	if amount > 0 {
		newUserAmountRecord3 := &model.UserAmountRecord{
			UserID:     userid,
			Type:       20,
			Amount:     amount * 0.3,
			ExtInfo:    "平级收益",
			CreateTime: time.Now().In(location),
			UpdateTime: time.Now().In(location),
			IsDeleted:  0,
		}
		updateCBUByUserId(userid, amount*0.3)
		if err := global.DBLink.Create(&newUserAmountRecord3).Error; err != nil {
			fmt.Println("插入平级收益失败", err)
		}
	}
}

func DirectReferralEarnings(node *model.TeamTree) {
	var totalAmount float64
	var RevenueNum2 float64
	var childrenId []int64
	for index, i := range node.Children {
		childrenId = append(childrenId, i.UserId)
		totalAmount += GetUserEarnings(i.UserId)
		DirectReferralEarnings(&i)
		if len(node.Children) >= 2 {
			for _, j := range node.Children[index].Children {
				RevenueNum2 += GetUserEarnings(j.UserId)
			}
		}
	}
	if node.Achievements >= 100 {
		if totalAmount*0.1 > 0 {
			newUserAmountRecord1 := &model.UserAmountRecord{
				UserID:     node.UserId,
				Type:       8,
				Amount:     totalAmount * 0.1,
				ExtInfo:    "直推收益",
				CreateTime: time.Now().In(location),
				UpdateTime: time.Now().In(location),
				IsDeleted:  0,
			}
			if err := global.DBLink.Create(&newUserAmountRecord1).Error; err != nil {
				fmt.Println("插入直推奖励失败", err)
			}
			updateCBUByUserId(node.UserId, totalAmount*0.1)
		}
		if GetChildrenUserIDs(childrenId) {
			if RevenueNum2*0.05 > 0 {
				newUserAmountRecord2 := &model.UserAmountRecord{
					UserID:     node.UserId,
					Type:       9,
					Amount:     RevenueNum2 * 0.05,
					ExtInfo:    "间推收益",
					CreateTime: time.Now().In(location),
					UpdateTime: time.Now().In(location),
					IsDeleted:  0,
				}
				if err := global.DBLink.Create(&newUserAmountRecord2).Error; err != nil {
					fmt.Println("插入间推奖励失败", err)
				}
				updateCBUByUserId(node.UserId, RevenueNum2*0.05)
			}
		}
	}
}

func GetChildrenUserIDs(userId []int64) bool {
	var amount int
	for _, i := range userId {
		if TotalAmount(i) > 100 {
			amount++
		}
	}
	if amount > 2 {
		return true
	}
	return false
}

// 插入社区收益
func addNewUserAmountRecordTest(node *model.TeamTree) {
	addNewUserAmountRecord(node.UserId, node.CommunityAmount02)
	for _, i := range node.Children {
		addNewUserAmountRecordTest(&i)
	}
	if node.MarketLevel.Name >= 4 {
		MarketAmounts[node.MarketLevel.Name] += node.SubPerformance - node.BigMarket
	}
}

func GetAdminContext(userId int64) (float64, float64) {
	var root model.TeamTree
	if err := global.DBLink.Where("user_id = ?", userId).First(&root).Error; err != nil {
		fmt.Println("GetAdminContext global.DBLink.Where(\"user_id = ?\", userId).First(&root).Error :", err)
		return 0, 0
	}
	var amountTest []float64
	buildTreeRecursive1(&root)
	for _, k := range root.Children {
		var resultTest []int64
		extractChildrenUserIDs(k, &resultTest)
		var amountTest1 float64
		amountTest1 += TotalAmount(k.UserId)
		for _, j := range resultTest {
			amountTest1 += TotalAmount(j)
		}
		amountTest = append(amountTest, amountTest1)
	}
	maxValue := RemoveAndMax(amountTest)
	amountTest = RemoveMax(amountTest)
	var hjamount float64
	for _, h := range amountTest {
		hjamount += h
	}
	return maxValue, hjamount

}

func extractChildrenUserIDs(node model.TeamTree, result *[]int64) {
	for _, child := range node.Children {
		*result = append(*result, child.UserId)
		extractChildrenUserIDs(child, result)
	}
}

func buildTreeRecursive1(node *model.TeamTree) error {
	var children []model.TeamTree
	if err := global.DBLink.Where("parent_id = ?", node.UserId).Find(&children).Error; err != nil {
		return err
	}

	for i := range children {
		if err := buildTreeRecursive(&children[i]); err != nil {
			return err
		}
	}

	node.Children = children
	return nil
}

func RemoveMax(slice []float64) []float64 {
	if len(slice) == 0 {
		return slice
	}

	// 使用 sort 包对切片进行排序
	sort.Float64s(slice)

	// 去除最大值
	return slice[:len(slice)-1]
}

func RemoveAndMax(slice []float64) float64 {
	if len(slice) == 0 {
		return 0.0
	}

	// 使用 sort 包对切片进行排序
	sort.Float64s(slice)

	// 获取最大值
	maxValue := slice[len(slice)-1]

	// 去除最大值
	return maxValue
}
