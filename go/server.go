package main

import (
	"github.com/labstack/echo/v4"
)

func main() {
	e := echo.New()
	e.GET("/", restoreContacts)
	e.POST("/", backUpContacts)
	e.Logger.Fatal(e.Start(":1323"))
}
