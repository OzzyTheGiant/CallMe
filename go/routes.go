package main

import (
	"encoding/json"
	"net/http"

	"github.com/labstack/echo/v4"
)

func restoreContacts(c echo.Context) (err error) {
	var contacts []Contact

	if contacts, err = selectAllContacts(); err != nil {
		return c.JSON(http.StatusInternalServerError, map[string]string{
			"message": "Error while restoring data. Try again",
			"debug":   err.Error(),
		})
	}

	c.Response().Header().Set(echo.HeaderContentType, echo.MIMEApplicationJSONCharsetUTF8)
	c.Response().WriteHeader(http.StatusOK)

	return json.NewEncoder(c.Response()).Encode(&contacts)
}

func backUpContacts(c echo.Context) (err error) {
	contacts := &[]Contact{}

	if err = c.Bind(contacts); err != nil {
		return c.JSON(http.StatusBadRequest, map[string]string{
			"message": "No data provided",
		})
	}

	if err = insertContacts(contacts); err != nil {
		return c.JSON(http.StatusInternalServerError, map[string]string{
			"message": "Error while backing up data. Try again",
			"debug":   err.Error(),
		})
	}

	return c.JSON(http.StatusOK, contacts)
}
