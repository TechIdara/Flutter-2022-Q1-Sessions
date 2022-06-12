import 'dart:async';

import 'package:floor/floor.dart';
import 'package:local_db_floor/db/dao/contact_dao.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import 'entities/contact.dart';

part 'app_database.g.dart'; // the generated code will be there

@Database(version: 1, entities: [Contact])
abstract class AppDatabase extends FloorDatabase {
  static const String dbName = "second_local_db.db";

  ContactsDAO get contactDao;
}
