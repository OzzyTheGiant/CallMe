class Contact {
    int    id = 0;
    String name;
    String companyName;
    String phoneNumber;
    String emailAddress;
    String streetAddress;
    String city;
    String state;
    String zipCode;
    
    bool get hasRequiredFields => 
        !(name == null || name.isEmpty) &&
        !(phoneNumber == null || phoneNumber.isEmpty);

    Contact({
        this.id,
        this.name, 
        this.companyName,
        this.phoneNumber,
        this.emailAddress,
        this.streetAddress,
        this.city,
        this.state,
        this.zipCode
    });

    Contact.fromMap(Map<String, dynamic> contactData):
        id            = contactData['id'],
        name          = contactData['name'],
        companyName   = contactData['companyName'],
        phoneNumber   = contactData['phoneNumber'],
        emailAddress  = contactData['emailAddress'],
        streetAddress = contactData['streetAddress'],
        city          = contactData['city'],
        state         = contactData['state'],
        zipCode       = contactData['zipCode'];

    static Map<String, dynamic> toMap(Contact contact) {
        return {
            "name": contact.name,
            "companyName": contact.companyName,
            "phoneNumber": contact.phoneNumber,
            "emailAddress": contact.emailAddress,
            "streetAddress": contact.streetAddress,
            "city": contact.city,
            "state": contact.state,
            "zipCode": contact.zipCode
        };
    }

    static int compare(Contact c1, Contact c2) => c1.name.compareTo(c2.name);

    void set(String property, String value) {
        switch(property) {
            case "name"          : this.name = value; break;
            case "companyName"   : this.companyName = value; break;
            case "phoneNumber"   : this.phoneNumber = value; break;
            case "emailAddress"  : this.emailAddress = value; break;
            case "streetAddress" : this.streetAddress = value; break;
            case "city"          : this.city = value; break;
            case "state"         : this.state = value; break;
            case "zipCode"       : this.zipCode = value; break;
            default              : break;
        }
    }

    String toString() {
        return toMap(this).toString();
    }
}
