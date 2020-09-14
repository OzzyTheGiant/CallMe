import 'package:call_me/database/SQLiteQueryExecutor.dart';
import 'package:call_me/models/Contact.dart';

class ContactDAO extends SQLiteQueryExecutor<Contact>
{
    @override String get table => "Contacts";

    @override Future<List<Contact>> selectAll() async {
        List<Map<String, dynamic>> rows = await db.query(table, columns: null); // all columns
        return rows.map((Map<String, dynamic> row) => Contact.fromMap(row)).toList();
    }

    @override Future<int> insert(Contact contact) async {
        return await db.insert(table, Contact.toMap(contact));
    }

    @override Future<int> update(Contact contact) async {
        return await db.update(
            table, 
            Contact.toMap(contact), 
            where: "$idColumn = ?", 
            whereArgs: [contact.id]
        );
    }

    @override Future<int> delete(int id) async {
        return await db.delete(table, where: "$idColumn = ?", whereArgs: [id]);
    }
}
