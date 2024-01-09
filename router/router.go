package router

import (
	"ChatBaseX-GPTX/controller"
	"ChatBaseX-GPTX/middleware"
	"github.com/gin-gonic/gin"
)

func Router() *gin.Engine {
	r := gin.Default()

	r.Use(middleware.CORSMiddleware())

	teamGroup := r.Group("/team")
	teamGroup.POST("/joinTeam", controller.NewTeamTreeController().JoinTeam)
	teamGroup.GET("/getTeamTreeByUserId", controller.NewTeamTreeController().GetSubordinates)
	teamGroup.GET("/GetAllPersonal", controller.NewTeamTreeController().GetAllPersonal)
	teamGroup.GET("/GetUserIdByBigAndSmallMarkets", controller.NewTeamTreeController().GetAdminContext)
	return r
}
