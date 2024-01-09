package controller

import (
	"ChatBaseX-GPTX/service"
	"fmt"
	"github.com/gin-gonic/gin"
	"net/http"
	"strconv"
)

type TeamTreeController struct{}

func NewTeamTreeController() TeamTreeController {
	return TeamTreeController{}
}

func (t TeamTreeController) JoinTeam(c *gin.Context) {
	type TeamTreeRequest struct {
		UserId   string `json:"userId"`
		ParentId string `json:"parentId"`
	}

	var teamTreeRequest TeamTreeRequest

	if err := c.BindJSON(&teamTreeRequest); err != nil {
		fmt.Println("解析JoinTeamPOST传参数失败：", err.Error())
		c.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
		return
	}

	UserId, err := strconv.ParseInt(teamTreeRequest.UserId, 10, 64)
	if err != nil {
		fmt.Println("转换UserId失败：", err.Error())
		c.JSON(http.StatusBadRequest, gin.H{"error": "Invalid UserId"})
		return
	}

	ParentId, err := strconv.ParseInt(teamTreeRequest.ParentId, 10, 64)
	if err != nil {
		fmt.Println("转换ParentId失败：", err.Error())
		c.JSON(http.StatusBadRequest, gin.H{"error": "Invalid ParentId"})
		return
	}

	flag, err := service.JoinTeam(UserId, ParentId)
	if err != nil {
		fmt.Println("JoinTeam失败：", err.Error())
		c.JSON(http.StatusBadRequest, gin.H{"error": " service.JoinTeam"})
		return
	}
	if flag == 1 {
		c.JSON(http.StatusBadRequest, gin.H{"message": "你已加入团队，无法再次加入"})
		return
	}
	c.JSON(http.StatusOK, gin.H{"message": "你已成功加入该团队"})
	return
}

func (t TeamTreeController) GetSubordinates(c *gin.Context) {
	//userId := c.Query("userId")

	//UserId, err := strconv.ParseInt(userId, 10, 64)
	//if err != nil {
	//	fmt.Println("转换UserId失败：", err.Error())
	//	c.JSON(http.StatusBadRequest, gin.H{"error": "Invalid UserId"})
	//	return
	//}

	flag, err := service.BuildTree(0)
	if err != nil {
		fmt.Println("GetSubordinates失败：", err.Error())
		c.JSON(http.StatusBadRequest, gin.H{"error": " service.GetSubordinates"})
		return
	}
	c.JSON(http.StatusOK, gin.H{"message": flag})
	return
}

func (t TeamTreeController) GetAllPersonal(c *gin.Context) {
	service.GetAllPersonal()
	c.JSON(http.StatusOK, gin.H{"message": "更新成功"})
	return
}

func (t TeamTreeController) GetAdminContext(c *gin.Context) {
	userId := c.Query("userId")

	UserId, err := strconv.ParseInt(userId, 10, 64)
	if err != nil {
		fmt.Println("转换UserId失败：", err.Error())
		c.JSON(http.StatusBadRequest, gin.H{"error": "Invalid UserId"})
		return
	}

	Big, Small := service.GetAdminContext(UserId)

	c.JSON(http.StatusOK, gin.H{"Big": Big, "Small": Small})
	return
}

func (t TeamTreeController) GetLevelReward(c *gin.Context) {
	service.LevelReward()
	c.JSON(http.StatusOK, gin.H{"message": "更新成功"})
	return
}
