package main

import (
	"encoding/json"
	"net/http"

	"github.com/labstack/echo/v4"
)

func restoreContacts(c echo.Context) error {
	id1 := 1
	name1, company1, phone1, email1, street1, city1, state1, zip1 :=
		"Ozzy Perez",
		"DreamCraft",
		"956-241-0157",
		"OZLperez11@gmail.com",
		"918 S Houston Dr",
		"Harlingen",
		"TX",
		"78550"

	id2 := 2
	var name2 string = "John Doe"
	var company2 *string = nil
	var phone2 string = "123-456-7890"
	var email2 *string = nil
	var street2 *string = nil
	var city2 *string = nil
	var state2 *string = nil
	var zip2 *string = nil

	contacts := [2]*Contact{
		&Contact{&id1, &name1, &company1, &phone1, &email1, &street1, &city1, &state1, &zip1},
		&Contact{&id2, &name2, company2, &phone2, email2, street2, city2, state2, zip2},
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
