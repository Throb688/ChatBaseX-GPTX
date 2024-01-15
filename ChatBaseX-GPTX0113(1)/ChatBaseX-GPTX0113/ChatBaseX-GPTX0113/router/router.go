package router

import (
	"ChatBaseX-GPTX0113/dao"
	"ChatBaseX-GPTX0113/middleware"
	"fmt"
	"github.com/gin-gonic/gin"
	"net/http"
	"strconv"
)

func Router() *gin.Engine {
	r := gin.Default()

	r.Use(middleware.CORSMiddleware())

	r.GET("/team/GetReward", func(c *gin.Context) {
		dao.GetCommunityEarnings()
		c.JSON(200, gin.H{
			"message": "刷新成功",
		})
		return
	})

	r.GET("/team/GetUserIdByBigAndSmallMarkets", func(c *gin.Context) {
		userId := c.Query("userId")
		UserId, err := strconv.ParseInt(userId, 10, 64)
		if err != nil {
			fmt.Println("转换UserId失败：", err.Error())
			c.JSON(http.StatusBadRequest, gin.H{"error": "Invalid UserId"})
			return
		}

		Big, Small := dao.GetAdminContext(UserId)
		c.JSON(http.StatusOK, gin.H{"Big": Big, "Small": Small})
		return
	})

	return r
}
