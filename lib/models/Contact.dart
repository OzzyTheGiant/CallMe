
import 'package:meta/meta.dart';

class Contact {
    String name;
    String companyName;
    int    phone;
    String email;
    String streetAddress;
    String city;
    String state;
    int    zipCode;

    Contact({
        @required this.name, 
        this.companyName,
        this.phone,
        this.email,
        this.streetAddress,
        this.city,
        this.state,
        this.zipCode
    });
}
