package main

import (
	"github.com/labstack/echo/v4"
)

func main() {
	e := echo.New()
	e.GET("/", test)
	e.Logger.Fatal(e.Start(":1323"))
}
