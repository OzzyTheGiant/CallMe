import 'dart:async';
import 'package:call_me/models/Contact.dart';
import 'package:call_me/blocs/Bloc.dart';
import 'package:call_me/database/ContactDAO.dart';
import 'package:call_me/database/SQLiteQueryExecutor.dart';

class ContactsListBloc implements Bloc 
{
    final SQLiteQueryExecutor _dao;
    final _controller = StreamController<List<Contact>>();
    List<Contact> _contactList = [];

    Stream<List<Contact>> get contactListStream => _controller.stream;

    ContactsListBloc({SQLiteQueryExecutor dao}): _dao = dao ?? ContactDAO();

    Future<void> init() async {
        await _dao.open();
        await setContactList(_contactList);
    }

    Future<void> setContactList(List<Contact> contactList) async {
        _contactList = await _dao.selectAll();
        _controller.sink.add(_contactList);
    }

    Future<void> addContact(Contact contact) async {
        contact.id = await _dao.insert(contact);
        _contactList.add(contact);
        _contactList.sort(Contact.compare);
        _controller.sink.add(_contactList);
    }

    Future<void> removeContact(int id) async {
        await _dao.delete(id);
        _contactList.removeWhere((contact) => contact.id == id);
        _controller.sink.add(_contactList);
    }

    void dispose() {
        _dao.close();
        _controller.close();
    }
}
