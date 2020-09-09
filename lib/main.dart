import 'package:flutter/material.dart';

void main() {
    runApp(CallMeApp());
}

class CallMeApp extends StatelessWidget {
    @override Widget build(BuildContext context) {
        return MaterialApp(
            title: 'Call Me',
            theme: ThemeData(
                primarySwatch: Colors.blue,
                visualDensity: VisualDensity.adaptivePlatformDensity,
            ),
            home: ContactListPage(title: 'My Contacts'),
        );
    }
}

class ContactListPage extends StatefulWidget {
    ContactListPage({Key key, this.title}) : super(key: key);

    // This class is the configuration for the state. It holds the values (in this
    // case the title) provided by the parent (in this case the App widget) and
    // used by the build method of the State. Fields in a Widget subclass are
    // always marked "final".

    final String title;

    @override
    _ContactListPageState createState() => _ContactListPageState();
}

class _ContactListPageState extends State<ContactListPage> {
    @override Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: Text(
                    widget.title,
                    style: TextStyle(color: Colors.black)
                ),
                backgroundColor: Colors.white,
            ),
            body: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[Text('No Contacts Added',)],
                ),
            ),
            floatingActionButton: FloatingActionButton(
                onPressed: () => {},
                tooltip: 'Add New Contact',
                child: Icon(Icons.person_add),
            ),
        );
    }
}
