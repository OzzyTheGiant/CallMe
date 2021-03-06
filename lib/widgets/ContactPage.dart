import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:call_me/models/Contact.dart';
import 'package:call_me/widgets/EditContactPage.dart';

class ContactPage extends StatefulWidget {
    final Contact contact;
    const ContactPage({Key key, this.contact}) : super(key: key);

    @override State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> 
{
    Contact get contact => widget.contact;

    void updateSelf(value) async => value ? setState(() {}) : null;

    @override Widget build(BuildContext context) {
        final pressHandler = () => Navigator.push(context, MaterialPageRoute(
            builder: (context) => EditContactPage(contact: contact, title: "Edit Contact")
        )).then(updateSelf);

        return Scaffold(
            appBar: AppBar(
                backgroundColor: Colors.white,
                brightness: Brightness.light,
                iconTheme: IconThemeData(color: Colors.blue[900]),
                actions: <Widget>[
                    IconButton(
                        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                        iconSize: 30,
                        icon: Icon(Icons.edit),
                        color: Colors.blue[900],
                        onPressed: pressHandler
                    )
                ]
            ),
            body: Container(
                padding: EdgeInsets.all(16),
                child: _constructContactDetails()
            )
        );
    }

    Widget _constructContactDetails() {
        return Column(children: <Widget>[
            Card(
                child: Column(children: <Widget>[
                    ListTile(
                        title: Text(contact.name, style: TextStyle(fontSize: 24)),
                        subtitle: contact.companyName != null ? Text(contact.companyName) : null,
                    ),

                    Divider(),
                    ListTile(
                        leading: Icon(CupertinoIcons.phone_solid, size: 30, color: Colors.blue[400]),
                        title: Text(contact.phoneNumber)
                    ),

                    contact.emailAddress != null && contact.emailAddress.isNotEmpty ? 
                        Divider() : SizedBox.shrink(), // empty box for null values
                    contact.emailAddress != null && contact.emailAddress.isNotEmpty ?
                    ListTile(
                        leading: Icon(CupertinoIcons.mail_solid, size: 30, color: Colors.blue[400]),
                        title: Text(contact.emailAddress)
                    ) :
                    SizedBox.shrink() // empty box for null value
                ]) 
            ),

            contact.streetAddress != null && contact.streetAddress.isNotEmpty ? 
            Card(
                child: Column(children: <Widget>[
                    ListTile(title: Text("Street Address", style: TextStyle(fontSize: 20))),
                    ListTile(title: Text(contact.streetAddress + "\n" + contact.streetAddressLastLine)),
                ])
            ) : 
            SizedBox.shrink()
        ]);
    }
}