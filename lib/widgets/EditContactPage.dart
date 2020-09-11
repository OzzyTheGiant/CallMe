import 'package:flutter/material.dart';
import 'package:call_me/models/Contact.dart';
import 'package:call_me/widgets/ContactForm.dart';

class EditContactPage extends StatelessWidget 
{
    final String title;
    final Contact contact;

    EditContactPage({Key key, this.title, this.contact}) : super(key: key);

    @override Widget build(BuildContext context) 
    {
        final contactForm = ContactForm(contact);

        return Scaffold(
            appBar: AppBar(
                title: Text(title, style: TextStyle(color: Colors.blue[900])),
                backgroundColor: Colors.white,
                brightness: Brightness.light,
                iconTheme: IconThemeData(color: Colors.blue[900]),
                actions: <Widget>[
                    IconButton(
                        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                        icon: Icon(Icons.save, size: 30),
                        color: Colors.blue[900],
                        onPressed: () => navigateBack(context, whileSaving: true, contact: contact)
                    )
                ]
            ),
            body: contactForm
        );
    }

    void navigateBack(BuildContext context, {bool whileSaving = false, Contact contact}) 
    {
        if (whileSaving) print(contact);
        Navigator.pop(context);
    }
}
