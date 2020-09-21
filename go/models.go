package main

// Contact - A person's contact details
type Contact struct {
	ID            *int    `json:"id"`
	Name          *string `json:"name"`
	CompanyName   *string `json:"companyName"`
	PhoneNumber   *string `json:"phoneNumber"`
	EmailAddress  *string `json:"emailAddress"`
	StreetAddress *string `json:"streetAddress"`
	City          *string `json:"city"`
	State         *string `json:"state"`
	ZipCode       *string `json:"zipCode"`
}
