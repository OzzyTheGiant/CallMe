import 'package:call_me/blocs/BlocProvider.dart';
import 'package:call_me/blocs/ContactsListBloc.dart';
import 'package:call_me/models/Contact.dart';
import 'package:flutter/material.dart';

class ContactListPage extends StatelessWidget {
    final String title;

    ContactListPage({Key key, this.title}) : super(key: key);

    @override Widget build(BuildContext context) {
        return StreamBuilder<List<Contact>>(
            stream: BlocProvider.of<ContactsListBloc>(context).contactListStream,
            builder: (BuildContext context, AsyncSnapshot<List<Contact>> snapshot) {
                List<Contact> contactList;

                if (snapshot.data == null) {
                    contactList = [
                        Contact(name: "John Doe"),
                        Contact(name: "Jane Smith")
                    ];
                } else {
                    contactList = snapshot.data;
                }

                return _constructPage(_generateListItems(contactList));
            }
        );
    }

    Widget _constructPage(Widget contactList) {
        return Scaffold(
            appBar: AppBar(
                title: Text(title, style: TextStyle(color: Colors.black)),
                backgroundColor: Colors.white,
            ),
            body: contactList,
            floatingActionButton: FloatingActionButton(
                onPressed: () => {},
                tooltip: 'Add New Contact',
                child: Icon(Icons.person_add),
            )
        );
    }

    Widget _generateListItems(List<Contact> contacts) {
        return ListView.builder(
            itemCount: contacts.length,
            itemBuilder: (BuildContext context, int index) {
                return Container(
                    padding: EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                    height: 50,
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(contacts[index].name, style: TextStyle(fontSize: 18))
                    )
                );
            }
        );
    }
}