import 'package:flutter/material.dart';
import 'package:call_me/models/Contact.dart';
import 'package:call_me/blocs/ContactsListBloc.dart';
import 'package:call_me/blocs/BlocProvider.dart';
import 'package:call_me/widgets/ContactForm.dart';

class EditContactPage extends StatelessWidget 
{
    final String title;
    final Contact contact;

    EditContactPage({Key key, this.title, this.contact}) : super(key: key);

    @override Widget build(BuildContext context) 
    {
        final contactForm = ContactForm(contact);

        final actions = <Widget>[
            Builder(builder: (BuildContext context) {
                return IconButton(
                    padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    icon: Icon(Icons.save, size: 30),
                    color: Colors.blue[900],
                    onPressed: () => _navigateBack(context, whileSaving: true)
                );
            })
        ];

        if (title == "Edit Contact") actions.add(
            Builder(builder: (BuildContext context) {
                return IconButton(
                    padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    icon: Icon(Icons.delete, size: 30),
                    color: Colors.blue[900],
                    onPressed: () => _navigateBack(context, whileDeleting: true),
                );
            })
        );

        return Scaffold(
            appBar: AppBar(
                title: Text(title, style: TextStyle(color: Colors.blue[900])),
                backgroundColor: Colors.white,
                brightness: Brightness.light,
                iconTheme: IconThemeData(color: Colors.blue[900]),
                actions: actions
            ),
            body: contactForm
        );
    }

    void _navigateBack(BuildContext context, {bool whileSaving = false, bool whileDeleting = false}) async
    {
        var bloc = BlocProvider.of<ContactsListBloc>(context);

        if (whileSaving && contact.hasRequiredFields) {
            
            if (title == "Edit Contact") await bloc.updateContact(contact);
            else await bloc.addContact(contact);

        } else if (whileDeleting) {
            await bloc.removeContact(contact.id);
            Navigator.popUntil(context, ModalRoute.withName("/"));
            return;
        } else {
            Scaffold.of(context).showSnackBar(SnackBar(
                content: Text("Please enter name and phone number")
            )); return;
        }

        Navigator.pop(context, whileSaving);
    }
}
