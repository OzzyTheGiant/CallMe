package main

import (
	"gorm.io/driver/sqlite"
	"gorm.io/gorm"
	"gorm.io/gorm/clause"
)

// Be sure to set default to null if a column is nullable.
// Otherwise, it will return a zero-value
const createContactsTable = (`
	CREATE TABLE IF NOT EXISTS Contacts (
		ID            INTEGER PRIMARY KEY,
		Name          TEXT NOT NULL,
		CompanyName   TEXT DEFAULT NULL,
		PhoneNumber   TEXT NOT NULL,
		EmailAddress  TEXT DEFAULT NULL,
		StreetAddress TEXT DEFAULT NULL,
		City          TEXT DEFAULT NULL,
		State         TEXT DEFAULT NULL,
		ZipCode       TEXT DEFAULT NULL
	);
`)

func openDB() (*gorm.DB, error) {
	db, err := gorm.Open(sqlite.Open("CallMe.db"), &gorm.Config{})
	db.Exec(createContactsTable)
	return db, err
}

func selectAllContacts() ([]Contact, error) {
	db, err := openDB()

	if err != nil {
		return nil, err
	}

	var contacts []Contact

	if result := db.Find(&contacts); result.Error != nil {
		return nil, err
	}

	return contacts, nil
}

func insertContacts(contacts *[]Contact) error {
	db, err := openDB()

	if err != nil {
		return err
	}

	result := db.Clauses(clause.OnConflict{
		Columns: []clause.Column{{Name: "ID"}},
		DoUpdates: clause.AssignmentColumns([]string{
			"Name", "CompanyName", "PhoneNumber", "EmailAddress",
			"StreetAddress", "City", "State", "ZipCode",
		}),
	}).Create(&contacts)

	if result.Error != nil && result.RowsAffected == 0 {
		return result.Error
	}

	return nil
}
