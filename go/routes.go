package main

import (
	"net/http"

	"github.com/labstack/echo/v4"
)

func test(c echo.Context) error {
	object := make(map[string]int)
	object["hello"] = 1
	return c.JSON(http.StatusOK, object)
}
