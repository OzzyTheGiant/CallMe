import 'package:flutter/material.dart';

class EditContactPage extends StatefulWidget {
    final String title;
    final GlobalKey<FormState> _formKey = GlobalKey();

    EditContactPage({Key key, this.title,}) : super(key: key);

    @override State createState() => _EditContactPageState();
}

class _EditContactPageState extends State<EditContactPage>{
    @override Widget build(BuildContext context) {
        final navigateBack = (BuildContext context, {bool whileSaving = false}) {
            if (whileSaving) print("Saved");
            Navigator.pop(context);
        };

        return Scaffold(
            appBar: AppBar(
                title: Text(widget.title, style: TextStyle(color: Colors.blue[900])),
                backgroundColor: Colors.white,
                brightness: Brightness.light,
                iconTheme: IconThemeData(color: Colors.blue[900]),
                actions: <Widget>[
                    IconButton(
                        icon: Icon(Icons.save),
                        color: Colors.blue[900],
                        onPressed: () => navigateBack(context, whileSaving: true)
                    )
                ]
            ),
            body: _createForm()
        );
    }

    Widget _createForm() {
        return Form(
            key: widget._formKey,
            child: Container(
                padding: EdgeInsets.all(16),
                child: Column(
                    children: <Widget>[
                        TextFormField(decoration: const InputDecoration(hintText: "Name")),
                        TextFormField(decoration: const InputDecoration(hintText: "Company Name")),
                        TextFormField(decoration: const InputDecoration(hintText: "Phone Number")),
                        TextFormField(decoration: const InputDecoration(hintText: "Email Address")),
                        TextFormField(decoration: const InputDecoration(hintText: "Street Addres")),
                        TextFormField(decoration: const InputDecoration(hintText: "City")),
                        TextFormField(decoration: const InputDecoration(hintText: "State")),
                        TextFormField(decoration: const InputDecoration(hintText: "Zip Code")),
                    ]
                )
            )
        );
    }
}
