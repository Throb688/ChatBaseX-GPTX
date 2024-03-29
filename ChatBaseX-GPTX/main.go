package main

import (
	"ChatBaseX-GPTX/global"
	"ChatBaseX-GPTX/router"
	"fmt"
	"log"
)

func init() {
	err := global.SetupDBLink()
	if err != nil {
		fmt.Println(err.Error())
		log.Fatalf("初始化数据库失败 err:%v", err)
	}
}

func main() {
	r := router.Router()
	r.Run(":9090")
}
