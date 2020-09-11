class Contact {
    int    id;
    String name;
    String companyName;
    String phoneNumber;
    String emailAddress;
    String streetAddress;
    String city;
    String state;
    int    zipCode;

    Contact({
        this.name, 
        this.companyName,
        this.phoneNumber,
        this.emailAddress,
        this.streetAddress,
        this.city,
        this.state,
        this.zipCode
    });

    Contact.fromMap(Map<String, String> contactData):
        name          = contactData['name'],
        companyName   = contactData['companyName'],
        phoneNumber   = contactData['phone'],
        emailAddress  = contactData['email'],
        streetAddress = contactData['streetAddress'],
        city          = contactData['city'],
        state         = contactData['state'],
        zipCode       = int.tryParse(contactData['zipCode']);

    static Map<String, String> toMap(Contact contact) {
        return {
            "name": contact.name,
            "companyName": contact.companyName,
            "phoneNumber": contact.phoneNumber,
            "emailAddress": contact.emailAddress,
            "streetAddress": contact.streetAddress,
            "city": contact.city,
            "state": contact.state,
            "zipCode": contact.zipCode?.toString() ?? ""
        };
    }

    void set(String property, String value) {
        switch(property) {
            case "name"          : this.name = value; break;
            case "companyName"   : this.companyName = value; break;
            case "phoneNumber"   : this.phoneNumber = value; break;
            case "emailAddress"  : this.emailAddress = value; break;
            case "streetAddress" : this.streetAddress = value; break;
            case "city"          : this.city = value; break;
            case "state"         : this.state = value; break;
            case "zipCode"       : this.zipCode = int.tryParse(value); break;
            default              : break;
        }
    }

    String toString() {
        return Contact.toMap(this).toString();
    }
}
