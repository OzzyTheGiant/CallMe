import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:recase/recase.dart';
import 'package:call_me/models/Contact.dart';

class ContactForm extends StatefulWidget {
    final Contact contact;
    ContactForm(this.contact);
    @override State<ContactForm> createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
    final _formKey = GlobalKey<FormBuilderState>();

    _ContactFormState({Key key});
    
    @override Widget build(BuildContext context) {
        List<Widget> fields = [];

        Contact.toMap(widget.contact).forEach((key, value) {
            List<String Function(dynamic)> validators = [];

            switch(key) {
                case "name":
                case "phone":   validators.add(FormBuilderValidators.required()); break;
                case "email":   validators.add(FormBuilderValidators.email()); break;
                case "state":   validators.add(FormBuilderValidators.maxLength(2)); break;
                case "zipCode": validators.add(FormBuilderValidators.numeric()); break;
                default: break;
            }

            fields.add(FormBuilderTextField(
                attribute: key,
                decoration: InputDecoration(hintText: key.titleCase),
                initialValue: value,
                validators: validators,
                onChanged: (value) => widget.contact.set(key, value),
            ));
        });

        return FormBuilder(
            key: _formKey,
            autovalidate: true,
            child: Container(
                padding: EdgeInsets.all(16),
                child: Column(children: fields)
            )
        );
    }
}