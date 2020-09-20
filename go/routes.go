package main

import (
	"encoding/json"
	"net/http"

	"github.com/labstack/echo/v4"
)

func restoreContacts(c echo.Context) error {
	contacts := [2]*Contact{
		&Contact{
			ID:            1,
			Name:          "Ozzy Perez",
			CompanyName:   "DreamCraft",
			PhoneNumber:   "956-241-0157",
			EmailAddress:  "OZLperez11@gmail.com",
			StreetAddress: "918 S Houston Dr",
			City:          "Harlingen",
			State:         "TX",
			ZipCode:       "78550",
		},
		&Contact{
			ID:          2,
			Name:        "John Doe",
			PhoneNumber: "1234567890",
		},
	}

	c.Response().Header().Set(echo.HeaderContentType, echo.MIMEApplicationJSONCharsetUTF8)
	c.Response().WriteHeader(http.StatusOK)

	return json.NewEncoder(c.Response()).Encode(contacts)
}

func backUpContacts(c echo.Context) (err error) {
	contacts := &[]Contact{}

	if err = c.Bind(contacts); err != nil {
		return c.JSON(http.StatusBadRequest, map[string]string{
			"message": "No data provided",
		})
	}

	return c.JSON(http.StatusOK, contacts)
}
