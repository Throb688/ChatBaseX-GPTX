package model

type TeamTree struct {
	Id         int64      `gorm:"column:id",json:"id"`
	UserId     int64      `gorm:"column:user_id",json:"user_id"`
	ParentId   int64      `gorm:"column:parent_id",json:"parent_id"`
	CreateTime string     `gorm:"column:create_time",json:"create_time"`
	Children   []TeamTree `gorm:"-"`
}

func (TeamTree) TableName() string {
	return "team_tree"
}
