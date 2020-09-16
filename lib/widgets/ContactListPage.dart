import 'package:flutter/material.dart';
import 'package:call_me/models/Contact.dart';
import 'package:call_me/blocs/BlocProvider.dart';
import 'package:call_me/blocs/ContactsListBloc.dart';
import 'package:call_me/widgets/ContactPage.dart';
import 'package:call_me/widgets/EditContactPage.dart';

class ContactListPage extends StatelessWidget 
{
    ContactListPage({Key key}) : super(key: key);

    @override Widget build(BuildContext context) 
    {
        return StreamBuilder<List<Contact>>(
            stream: BlocProvider.of<ContactsListBloc>(context).contactListStream,
            builder: (BuildContext context, AsyncSnapshot<List<Contact>> snapshot) 
            {
                return _constructPage(snapshot.data == null || snapshot.data.isEmpty ? 
                    Center(child: Text("No Contacts Added Yet")) :
                    _generateListItems(snapshot.data),
                    context
                );
            }
        );
    }

    Widget _constructPage(Widget contactList, BuildContext context) 
    {
        final buttonPressHandler = () => Navigator.push(context, MaterialPageRoute(
            builder: (context) => EditContactPage(contact: Contact(), title: "Add Contact")
        ));

        return Scaffold(
            appBar: AppBar(
                title: Text("My Contacts", style: TextStyle(color: Colors.blue[900])),
                backgroundColor: Colors.white,
                brightness: Brightness.light,
                iconTheme: IconThemeData(color: Colors.blue[900]),
            ),
            body: contactList,
            floatingActionButton: FloatingActionButton(
                onPressed: buttonPressHandler,
                tooltip: 'Add New Contact',
                child: Icon(Icons.person_add),
            )
        );
    }

    Widget _generateListItems(List<Contact> contacts) 
    {
        return ListView.builder(
            itemCount: contacts.length,
            itemBuilder: (BuildContext context, int index) 
            {
                final tapHandler = () => Navigator.push(context, MaterialPageRoute(
                    builder: (BuildContext context) => ContactPage(contact: contacts[index])
                ));

                return Container(
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                    child: InkWell(
                        onTap: tapHandler,
                        child: Row(
                            children: <Widget>[
                                CircleAvatar(
                                    backgroundColor: Colors.grey[350],
                                    child: Text(contacts[index].name[0])
                                ),
                                Container(
                                    margin: EdgeInsets.only(left: 16),
                                    child: Text(contacts[index].name, style: TextStyle(fontSize: 18))
                                )
                            ]
                        )
                    ) 
                );
            }
        );
    }
}