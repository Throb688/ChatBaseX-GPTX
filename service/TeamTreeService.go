package service

import (
	"ChatBaseX-GPTX/dao"
	"ChatBaseX-GPTX/model"
)

func JoinTeam(userID, ParentId int64) (int64, error) {
	return dao.JoinTeam(userID, ParentId)
}

func BuildTree(userID int64) (model.TeamTree, error) {
	return dao.BuildTree(userID)
}

func GetAllPersonal() {
	dao.GetAllPersonal()
}
func GetAdminContext(userID int64) (float64, float64) {
	return dao.GetAdminContext(userID)
}
