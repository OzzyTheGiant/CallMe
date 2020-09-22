package main

// Contact - A person's contact details
type Contact struct {
	ID            *int    `json:"id" gorm:"primaryKey;column:ID"`
	Name          *string `json:"name" gorm:"column:Name"`
	CompanyName   *string `json:"companyName" gorm:"column:CompanyName"`
	PhoneNumber   *string `json:"phoneNumber" gorm:"column:PhoneNumber"`
	EmailAddress  *string `json:"emailAddress" gorm:"column:EmailAddress"`
	StreetAddress *string `json:"streetAddress" gorm:"column:StreetAddress"`
	City          *string `json:"city" gorm:"column:City"`
	State         *string `json:"state" gorm:"column:State"`
	ZipCode       *string `json:"zipCode" gorm:"column:ZipCode"`
}
