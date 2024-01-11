package dao

import (
	"ChatBaseX-GPTX/global"
	"ChatBaseX-GPTX/model"
	"database/sql"
	"fmt"
	"github.com/jinzhu/gorm"
	"sort"
	"strconv"
	"time"
)

var location *time.Location

func init() {
	location, _ = time.LoadLocation("Asia/Shanghai")
}

var MarketLevels = []model.Level{
	{1, 5000, 15},
	{2, 20000, 25},
	{3, 60000, 35},
	{4, 200000, 45},
	{5, 600000, 55},
	{6, 2000000, 60},
	{7, 5000000, 65},
}

type LevelsAmount struct {
	UserId int64
	Amount float64
}

type LevelList struct {
	LevelName     int
	LevelPersonal []LevelsAmount
}

//var LevelListAccount = []LevelList{
//	{1, []LevelsAmount{}},
//	{2, []LevelsAmount{}},
//	{3, []LevelsAmount{}},
//	{4, []LevelsAmount{}},
//	{5, []LevelsAmount{}},
//	{6, []LevelsAmount{}},
//	{7, []LevelsAmount{}},
//}

func JoinTeam(userID, ParentId int64) (int64, error) {
	existingTeam1 := &model.TeamTree{}

	if result := global.DBLink.First(existingTeam1, "user_id = ?", ParentId); result.RowsAffected == 0 {
		// 用户不存在，新增 TeamTree 记录
		newTeam1 := &model.TeamTree{
			CreateTime: time.Now().In(location).Format("2006-01-02 15:04:05"),
			ParentId:   0,
			UserId:     ParentId,
		}
		if err := global.DBLink.Create(newTeam1).Error; err != nil {
			fmt.Println("JoinTeam: global.DBLink.Create err :", err.Error())
		}
	}
	// 检查给定的 userID 是否存在
	existingTeam := &model.TeamTree{}
	if result := global.DBLink.First(existingTeam, "user_id = ?", userID); result.RowsAffected > 0 {
		// 用户存在
		if existingTeam.ParentId != 0 {
			return 1, nil
		} else {
			// 如果 ParentId 为空，则更新其 ParentId
			existingTeam.ParentId = ParentId
			if err := global.DBLink.Save(existingTeam).Error; err != nil {
				fmt.Println("JoinTeam: global.DBLink.Save err :", err.Error())
				return -1, err
			}
			return 2, nil
		}
	} else {
		// 用户不存在，新增 TeamTree 记录
		newTeam := &model.TeamTree{
			CreateTime: time.Now().In(location).Format("2006-01-02 15:04:05"),
			ParentId:   ParentId,
			UserId:     userID,
		}
		if err := global.DBLink.Create(newTeam).Error; err != nil {
			fmt.Println("JoinTeam: global.DBLink.Create err :", err.Error())
			return -1, err
		}
		return 2, nil
	}
}

// 递归构建树形结构
func BuildTree(userID int64) (model.TeamTree, error) {

	var distinctParentIDs []int64

	// 使用 GORM 进行查询
	if err := global.DBLink.Table("team_tree").
		Select("DISTINCT parent_id").
		Where("parent_id != ?", 0).
		Pluck("parent_id", &distinctParentIDs).
		Error; err != nil {
		fmt.Println(" global.DBLink.Table finalDistinctParentIDs err:", err.Error())
	}
	// 手动去重
	uniqueParentIDs := make(map[int64]struct{})
	var finalDistinctParentIDs []int64

	totalIncome := TotalOnlineConsumption()
	incomeIndex := ((totalIncome * 0.01 * 0.4 * 0.1) / 0.6) / 4
	for _, parentID := range distinctParentIDs {
		if _, exists := uniqueParentIDs[parentID]; !exists {
			uniqueParentIDs[parentID] = struct{}{}
			finalDistinctParentIDs = append(finalDistinctParentIDs, parentID)
		}
	}
	LevelListAccount := GetObtainLevel(finalDistinctParentIDs)
	for _, i := range finalDistinctParentIDs {
		var root model.TeamTree
		if err := global.DBLink.Where("user_id = ?", i).First(&root).Error; err != nil {
			return model.TeamTree{}, err
		}
		var RevenueNum1 float64
		var RevenueNum2 float64
		buildTreeRecursive(&root)
		if TotalAmount(i) >= 100 {

			var childrenId []int64

			for index, i := range root.Children {
				childrenId = append(childrenId, i.UserId)
				RevenueNum1 += SumAmountByUserId(i.UserId)
				if len(root.Children) >= 2 {
					for _, j := range root.Children[index].Children {
						childrenId = append(childrenId, j.UserId)
						RevenueNum2 += SumAmountByUserId(j.UserId)
					}
				}
			}

			newUserAmountRecord1 := &model.UserAmountRecord{
				UserID:     i,
				Type:       8,
				Amount:     RevenueNum1 * 0.1,
				ExtInfo:    "直推收益",
				CreateTime: time.Now().In(location),
				UpdateTime: time.Now().In(location),
				IsDeleted:  0,
			}

			newUserAmountRecord2 := &model.UserAmountRecord{
				UserID:     i,
				Type:       9,
				Amount:     RevenueNum2 * 0.05,
				ExtInfo:    "间推收益",
				CreateTime: time.Now().In(location),
				UpdateTime: time.Now().In(location),
				IsDeleted:  0,
			}

			if RevenueNum1*0.1 > 0 {
				if err := global.DBLink.Create(&newUserAmountRecord1).Error; err != nil {
					fmt.Println("插入直推奖励失败", err)
				}
				UpdateCBUByUserId(i, RevenueNum1*0.1)
			}

			if RevenueNum2*0.05 > 0 {

				if err := global.DBLink.Create(&newUserAmountRecord2).Error; err != nil {
					fmt.Println("插入间推奖励失败", err)
				}
				UpdateCBUByUserId(i, RevenueNum2*0.05)
			}
		}

		if TotalAmount(i) >= 100 {
			var amountTest []float64
			var LevelIncome float64
			for _, k := range root.Children {
				var resultTest []int64
				extractChildrenUserIDs(k, &resultTest)
				var amountTest1 float64
				amountTest1 += TotalAmount(k.UserId)
				for _, j := range resultTest {
					amountTest1 += TotalAmount(j)
					LevelIncome += LowerLevelIncome(j)
				}
				amountTest = append(amountTest, amountTest1)
			}

			amountTest1 := amountTest
			//amountTest = RemoveMax(amountTest)
			var hjamount float64
			for _, h := range amountTest {
				hjamount += h
			}
			var hjamount2 float64
			for _, h := range RemoveMax(amountTest) {
				hjamount2 += h
			}

			myLevel := GetMarketLevel(hjamount2)

			if myLevel.Name > 0 && myLevel.Name < 4 {
				//amountTest = RemoveMax(amountTest)
				var hjamount1 float64
				for _, h := range amountTest1 {
					hjamount1 += h
				}
				if hjamount1 > 0 {
					income := float64(hjamount1) * 0.01 * 0.4 * float64(myLevel.Percentage) / (100 * 0.6)

					if income-LevelIncome > 0 {
						newUserAmountRecord3 := &model.UserAmountRecord{
							UserID:     i,
							Type:       10,
							Amount:     income,
							ExtInfo:    "社区收益",
							CreateTime: time.Now().In(location),
							UpdateTime: time.Now().In(location),
							IsDeleted:  0,
						}
						UpdateCBUByUserId(i, income)
						if err := global.DBLink.Create(&newUserAmountRecord3).Error; err != nil {
							fmt.Println("插入社区收益失败", err)
						}
					}
				}

			}

			if myLevel.Name >= 4 {
				var levelAmount float64
				for _, l := range LevelListAccount[myLevel.Name-1].LevelPersonal {
					levelAmount += l.Amount
				}
				income := incomeIndex * hjamount2 / levelAmount
				//sumAmount := income - LevelIncome
				if income > 0 {
					newUserAmountRecord3 := &model.UserAmountRecord{
						UserID:     i,
						Type:       10,
						Amount:     income,
						ExtInfo:    "社区收益",
						CreateTime: time.Now().In(location),
						UpdateTime: time.Now().In(location),
						IsDeleted:  0,
					}
					UpdateCBUByUserId(i, income)
					if err := global.DBLink.Create(&newUserAmountRecord3).Error; err != nil {
						fmt.Println("插入社区收益失败", err)
					}
				}

			}

		}

	}

	var root model.TeamTree
	if err := global.DBLink.Where("user_id = ?", 8316524508283584).First(&root).Error; err != nil {
		return model.TeamTree{}, err
	}
	err := buildTreeRecursive(&root)
	if err != nil {
		return model.TeamTree{}, err
	}

	return root, nil
}

// 递归构建树形结构的辅助函数
func buildTreeRecursive(node *model.TeamTree) error {
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

func SumAmountByUserId(userId int64) float64 {
	var totalAmount sql.NullFloat64

	////// 使用 GORM 进行查询
	//query := global.DBLink.Table("user_amount_record").
	//	Select("COALESCE(SUM(amount), 0) as total_amount").
	//	Where("user_id = ? AND type IN (?, ?)", userId, 2, 7).
	//	Row()

	// 获取今天的开始时间和结束时间
	now := time.Now().In(location)
	startOfDay := time.Date(now.Year(), now.Month(), now.Day(), 0, 0, 0, 0, now.Location())
	endOfDay := startOfDay.Add(24 * time.Hour)

	// 使用 GORM 进行查询
	query := global.DBLink.Table("user_amount_record").
		Select("COALESCE(SUM(amount), 0) as total_amount").
		Where("user_id = ? AND type IN (?, ?) AND create_time BETWEEN ? AND ?", userId, 2, 7, startOfDay, endOfDay).
		Row()

	if err := query.Scan(&totalAmount); err != nil {
		fmt.Println("SumAmountByUserId row.Scan(&totalAmount) err:", err.Error())
		return 0
	}

	// 通过 sql.NullFloat64.Value 获取结果值
	return totalAmount.Float64
}

func extractChildrenUserIDs(node model.TeamTree, result *[]int64) {
	for _, child := range node.Children {
		*result = append(*result, child.UserId)
		extractChildrenUserIDs(child, result)
	}
}

func GetMarketLevel(amount float64) model.Level {
	if amount >= 5000 && amount < 20000 {
		return MarketLevels[0]
	}

	if amount >= 20000 && amount < 60000 {
		return MarketLevels[1]
	}

	if amount >= 60000 && amount < 200000 {
		return MarketLevels[2]
	}

	if amount >= 200000 && amount < 600000 {
		return MarketLevels[3]
	}

	if amount >= 600000 && amount < 2000000 {
		return MarketLevels[4]
	}

	if amount >= 2000000 && amount < 5000000 {
		return MarketLevels[5]
	}
	if amount > 5000000 {
		return MarketLevels[6]
	}

	// 如果金额超过最高阈值，则返回最后一个级别
	return model.Level{}
}

// RemoveMax removes the maximum value from a slice of float64
func RemoveMax(slice []float64) []float64 {
	if len(slice) == 0 {
		return slice
	}

	// 使用 sort 包对切片进行排序
	sort.Float64s(slice)

	// 去除最大值
	return slice[:len(slice)-1]
}

func TotalOnlineConsumption() float64 {
	var totalAmount sql.NullFloat64

	query := global.DBLink.Table("user_amount_record").
		Select("COALESCE(SUM(amount), 0) as total_amount").
		Where(" type IN (?, ?)", 2, 7).
		Row()

	if err := query.Scan(&totalAmount); err != nil {
		fmt.Println("SumAmountByUserId row.Scan(&totalAmount) err:", err.Error())
		return 0
	}

	return totalAmount.Float64
}

func GetObtainLevel(ParentIDs []int64) []LevelList {
	var LevelListAccount = []LevelList{
		{1, []LevelsAmount{}},
		{2, []LevelsAmount{}},
		{3, []LevelsAmount{}},
		{4, []LevelsAmount{}},
		{5, []LevelsAmount{}},
		{6, []LevelsAmount{}},
		{7, []LevelsAmount{}},
	}

	for _, i := range ParentIDs {

		var root model.TeamTree
		if err := global.DBLink.Where("user_id = ?", i).First(&root).Error; err != nil {
		}
		var amountTest []float64
		buildTreeRecursive(&root)
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
		amountTest = RemoveMax(amountTest)
		var hjamount float64
		for _, h := range amountTest {
			hjamount += h
		}
		//fmt.Println(hjamount)

		myLevel := GetMarketLevel(hjamount)
		if myLevel.Name == 1 {
			result := global.DBLink.Table("user").
				Where("id = ?", i).
				Updates(map[string]interface{}{"market": "A1"})
			if result.Error != nil {
				fmt.Println("UpdateCBUByUserId err：", result.Error.Error())
			}

		}
		if myLevel.Name == 2 {
			result := global.DBLink.Table("user").
				Where("id = ?", i).
				Updates(map[string]interface{}{"market": "A2"})
			if result.Error != nil {
				fmt.Println("UpdateCBUByUserId err：", result.Error.Error())
			}
		}
		if myLevel.Name == 3 {
			result := global.DBLink.Table("user").
				Where("id = ?", i).
				Updates(map[string]interface{}{"market": "A3"})
			if result.Error != nil {
				fmt.Println("UpdateCBUByUserId err：", result.Error.Error())
			}
		}
		if myLevel.Name == 4 {
			result := global.DBLink.Table("user").
				Where("id = ?", i).
				Updates(map[string]interface{}{"market": "A4"})
			LevelListAccount[3].LevelPersonal = append(LevelListAccount[3].LevelPersonal, LevelsAmount{UserId: i, Amount: hjamount})
			if result.Error != nil {
				fmt.Println("UpdateCBUByUserId err：", result.Error.Error())
			}
		}
		if myLevel.Name == 5 {
			result := global.DBLink.Table("user").
				Where("id = ?", i).
				Updates(map[string]interface{}{"market": "A5"})
			LevelListAccount[4].LevelPersonal = append(LevelListAccount[4].LevelPersonal, LevelsAmount{UserId: i, Amount: hjamount})
			if result.Error != nil {
				fmt.Println("UpdateCBUByUserId err：", result.Error.Error())
			}
		}
		if myLevel.Name == 6 {
			result := global.DBLink.Table("user").
				Where("id = ?", i).
				Updates(map[string]interface{}{"market": "A6"})
			LevelListAccount[5].LevelPersonal = append(LevelListAccount[5].LevelPersonal, LevelsAmount{UserId: i, Amount: hjamount})
			if result.Error != nil {
				fmt.Println("UpdateCBUByUserId err：", result.Error.Error())
			}
		}
		if myLevel.Name == 7 {
			result := global.DBLink.Table("user").
				Where("id = ?", i).
				Updates(map[string]interface{}{"market": "A7"})
			LevelListAccount[6].LevelPersonal = append(LevelListAccount[6].LevelPersonal, LevelsAmount{UserId: i, Amount: hjamount})
			if result.Error != nil {
				fmt.Println("UpdateCBUByUserId err：", result.Error.Error())
			}
		}

	}
	return LevelListAccount

}

func LowerLevelIncome(userId int64) float64 {
	var root model.TeamTree
	if err := global.DBLink.Where("user_id = ?", userId).First(&root).Error; err != nil {
		return 0
	}

	err := buildTreeRecursive(&root)
	if err != nil {
		return 0
	}

	// 计算根节点的收入
	var amountTest []float64
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
	//amountTest = RemoveMax(amountTest)
	//var hjamount float64
	//for _, h := range amountTest {
	//	hjamount += h
	//}

	amountTest1 := amountTest
	//amountTest = RemoveMax(amountTest)
	var hjamount float64
	for _, h := range amountTest {
		hjamount += h
	}
	var hjamount2 float64
	for _, h := range RemoveMax(amountTest) {
		hjamount2 += h
	}

	myLevel := GetMarketLevel(hjamount2)

	//myLevel := GetMarketLevel(hjamount)
	if myLevel.Name > 0 {
		//amountTest = RemoveMax(amountTest)
		var hjamount1 float64
		for _, h := range amountTest1 {
			hjamount1 += h
		}

		income := float64(hjamount1) * 0.01 * 0.4 * float64(myLevel.Percentage) / (100 * 0.6)

		// 遍历根节点下的子节点
		for _, child := range root.Children {
			income += LowerLevelIncome(child.UserId)
		}
		return income
	}
	return 0
}

func UpdateCBUByUserId(userId int64, amount float64) {
	result := global.DBLink.Table("user").
		Where("id = ?", userId).
		Updates(map[string]interface{}{"withdraw_cbu": gorm.Expr("withdraw_cbu + ?", amount)})
	if result.Error != nil {
		fmt.Println("UpdateCBUByUserId err：", result.Error.Error())
	}

}

func GetAllPersonal() {
	GetObtainLevel(FinalDistinctParentIDs())
}

func FinalDistinctParentIDs() []int64 {
	var distinctParentIDs []int64

	// 使用 GORM 进行查询
	if err := global.DBLink.Table("team_tree").
		Select("DISTINCT parent_id").
		Where("parent_id != ?", 0).
		Pluck("parent_id", &distinctParentIDs).
		Error; err != nil {
		fmt.Println(" global.DBLink.Table finalDistinctParentIDs err:", err.Error())
	}
	// 手动去重
	uniqueParentIDs := make(map[int64]struct{})
	var finalDistinctParentIDs []int64
	for _, parentID := range distinctParentIDs {
		if _, exists := uniqueParentIDs[parentID]; !exists {
			uniqueParentIDs[parentID] = struct{}{}
			finalDistinctParentIDs = append(finalDistinctParentIDs, parentID)
		}
	}
	return finalDistinctParentIDs
}

func GetAdminContext(userId int64) (float64, float64) {
	var root model.TeamTree
	if err := global.DBLink.Where("user_id = ?", userId).First(&root).Error; err != nil {
		fmt.Println("GetAdminContext global.DBLink.Where(\"user_id = ?\", userId).First(&root).Error :", err)
		return 0, 0
	}
	var amountTest []float64
	fmt.Println(root.UserId)
	buildTreeRecursive(&root)
	for _, k := range root.Children {
		fmt.Println(k.UserId)
		var resultTest []int64
		extractChildrenUserIDs(k, &resultTest)
		var amountTest1 float64
		amountTest1 += TotalAmount(k.UserId)
		fmt.Println("amountTest1,", amountTest1)
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

func SortDescending(slice []float64) []float64 {
	if len(slice) == 0 {
		return nil
	}

	// 使用 sort 包对切片进行降序排序
	sort.Sort(sort.Reverse(sort.Float64Slice(slice)))

	return slice
}

func LevelReward() {
	var distinctParentIDs []int64

	// 使用 GORM 进行查询
	if err := global.DBLink.Table("user").
		Select("DISTINCT id").
		Where("market IN ('A1', 'A2', 'A3')").
		Pluck("id", &distinctParentIDs).
		Error; err != nil {
		fmt.Println("LevelReward global.DBLink.Table finalDistinctParentIDs err:", err.Error())
	}

	for _, i := range distinctParentIDs {
		var root model.TeamTree
		if err := global.DBLink.Where("user_id = ?", i).First(&root).Error; err != nil {
			fmt.Println("LevelReward global.DBLink.Where(user_id = ?, i).First(&root) err :", err)
		}
		buildTreeRecursive(&root)
		var amountTest []float64
		for _, k := range root.Children {
			var resultTest []int64
			extractChildrenUserIDs(k, &resultTest)
			var amountTest1 float64
			amountTest1 += TotalAmount(k.UserId)
			for _, j := range resultTest {
				amountTest1 += TotalAmount(j)
				//LevelIncome += LowerLevelIncome(j)
			}
			amountTest = append(amountTest, amountTest1)
		}
		//maxChirenAmount := SortDescending(amountTest)[0]
		amountTest = RemoveMax(amountTest)
		var hjamount float64
		for _, h := range amountTest {
			hjamount += h
		}

		myLevel := GetMarketLevel(hjamount)

		if myLevel.Name > 0 && myLevel.Name < 4 {
			if TotalAmount(i) >= 100 {
				var teamIDs []TeamNode
				if err := buildTeamIDsRecursive(i, 0, &teamIDs); err != nil {
					// 处理错误
					fmt.Println("Error building team IDs:", err.Error())
				}

				var sortedIDs []int64
				for _, node := range teamIDs {
					sortedIDs = append(sortedIDs, node.ID)
				}

				var maxChilenUserId11 []int64
				var levelName []string
				for k := myLevel.Name; k <= 3; k++ {
					levelName = append(levelName, "A"+strconv.Itoa(k))
				}
				//levelName := "A" + strconv.Itoa(myLevel.Name)

				if err := global.DBLink.Table("user").
					Select("DISTINCT id").
					Where("market in (?)  and id IN (?)", levelName, sortedIDs).
					Pluck("id", &maxChilenUserId11).
					Error; err != nil {
					fmt.Println("LevelReward global.DBLink.Table finalDistinctParentIDs err:", err.Error())
				}

				var maxChilenUserId1 int64
				if len(maxChilenUserId11) > 0 {
					maxChilenUserId1 = maxChilenUserId11[0]
				}

				if maxChilenUserId1 > 0 {
					fmt.Println("maxChilenUserId", maxChilenUserId1)
					var sumResult float64

					// 使用 GORM 进行查询
					if err := global.DBLink.Table("user_amount_record").
						Where("user_id = ? AND type IN (8,9,10)", maxChilenUserId1).
						Select("COALESCE(SUM(amount), 0)").Row().
						Scan(&sumResult); err != nil {
						fmt.Println("Error querying user amount sum:", err.Error())
					}

					if sumResult > 0 {
						newUserAmountRecord3 := &model.UserAmountRecord{
							UserID:     i,
							Type:       20,
							Amount:     sumResult * 0.3,
							ExtInfo:    "平级收益",
							CreateTime: time.Now().In(location),
							UpdateTime: time.Now().In(location),
							IsDeleted:  0,
						}
						UpdateCBUByUserId(i, sumResult*0.3)
						if err := global.DBLink.Create(&newUserAmountRecord3).Error; err != nil {
							fmt.Println("插入平级收益失败", err)
						}
					}
				}
			}

		}
	}

}

type TeamNode struct {
	ID    int64
	Depth int
}

// buildTeamIDsRecursive 是递归构建团队ID的辅助函数
func buildTeamIDsRecursive(userID int64, depth int, teamIDs *[]TeamNode) error {
	var children []model.TeamTree
	if err := global.DBLink.Model(&model.TeamTree{}).Select("id").Where("user_id = ?", userID).Find(&children).Error; err != nil {
		return err
	}

	for _, child := range children {
		*teamIDs = append(*teamIDs, TeamNode{ID: child.UserId, Depth: depth})
		if err := buildTeamIDsRecursive(child.UserId, depth+1, teamIDs); err != nil {
			return err
		}
	}

	return nil
}
