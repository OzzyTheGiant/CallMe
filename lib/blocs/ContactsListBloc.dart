import 'dart:async';

import 'package:call_me/blocs/Bloc.dart';
import 'package:call_me/models/Contact.dart';

class ContactsListBloc implements Bloc 
{
    final _controller = StreamController<List<Contact>>();
    Stream<List<Contact>> get contactListStream => _controller.stream;
    void setContactList(List<Contact> contactList) => _controller.sink.add(contactList);
    void dispose() => _controller.close();
}