// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder {
  _$AppDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$AppDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  ContactsDAO? _contactDaoInstance;

  Future<sqflite.Database> open(String path, List<Migration> migrations,
      [Callback? callback]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `contacts` (`id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, `name` TEXT NOT NULL, `phone` TEXT NOT NULL)');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  ContactsDAO get contactDao {
    return _contactDaoInstance ??= _$ContactsDAO(database, changeListener);
  }
}

class _$ContactsDAO extends ContactsDAO {
  _$ContactsDAO(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _contactInsertionAdapter = InsertionAdapter(
            database,
            'contacts',
            (Contact item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'phone': item.phone
                }),
        _contactUpdateAdapter = UpdateAdapter(
            database,
            'contacts',
            ['id'],
            (Contact item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'phone': item.phone
                }),
        _contactDeletionAdapter = DeletionAdapter(
            database,
            'contacts',
            ['id'],
            (Contact item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'phone': item.phone
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Contact> _contactInsertionAdapter;

  final UpdateAdapter<Contact> _contactUpdateAdapter;

  final DeletionAdapter<Contact> _contactDeletionAdapter;

  @override
  Future<List<Contact>> getAll() async {
    return _queryAdapter.queryList('SELECT * FROM contacts',
        mapper: (Map<String, Object?> row) => Contact(
            row['id'] as int, row['name'] as String, row['phone'] as String));
  }

  @override
  Future<Contact?> findById(int id) async {
    return _queryAdapter.query('SELECT * FROM contacts WHERE id = ?1',
        mapper: (Map<String, Object?> row) => Contact(
            row['id'] as int, row['name'] as String, row['phone'] as String),
        arguments: [id]);
  }

  @override
  Future<Contact?> findByName(String name) async {
    return _queryAdapter.query(
        'SELECT * FROM contacts WHERE name LIKE \'%?1%\'',
        mapper: (Map<String, Object?> row) => Contact(
            row['id'] as int, row['name'] as String, row['phone'] as String),
        arguments: [name]);
  }

  @override
  Future<Contact?> findByPhone(String phone) async {
    return _queryAdapter.query(
        'SELECT * FROM contacts WHERE phone LIKE \'%?1%\'',
        mapper: (Map<String, Object?> row) => Contact(
            row['id'] as int, row['name'] as String, row['phone'] as String),
        arguments: [phone]);
  }

  @override
  Future<void> addContact(Contact contact) async {
    await _contactInsertionAdapter.insert(contact, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateContact(Contact contact) async {
    await _contactUpdateAdapter.update(contact, OnConflictStrategy.abort);
  }

  @override
  Future<void> deleteContact(Contact contact) async {
    await _contactDeletionAdapter.delete(contact);
  }
}
