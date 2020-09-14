import 'package:sqflite/sqflite.dart' as sqflite;
import 'package:path/path.dart' as path;

abstract class SQLiteQueryExecutor<T> {
    sqflite.Database _db;

    static const String _CREATE_CONTACTS_TABLE = '''
        CREATE TABLE IF NOT EXISTS Contacts (
            id            INTEGER PRIMARY KEY,
            name          TEXT NOT NULL,
            companyName   TEXT,
            phoneNumber   TEXT NOT NULL,
            emailAddress  TEXT,
            streetAddress TEXT,
            city          TEXT,
            state         TEXT,
            zipCode       TEXT
        );
    ''';

    String get table => null;
    String get idColumn => "ID";
    sqflite.Database get db => _db;

    Future<void> open() async {
        var dbPath = await sqflite.getDatabasesPath();
        this._db   = await sqflite.openDatabase(
            path.join(dbPath, "CallMe.db"), 
            onCreate: (db, version) => db.execute(_CREATE_CONTACTS_TABLE),
            version: 1
        );
    }

    Future<List<T>> selectAll();
    Future<int> insert(T t);
    Future<int> update(T t);
    Future<int> delete(int id);
    Future<void> close() async => _db.close();
}
