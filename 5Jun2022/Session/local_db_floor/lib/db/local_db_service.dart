import 'app_database.dart';
import 'dao/contact_dao.dart';

abstract class LocalDbService {
  static Future<AppDatabase> get _db async =>
      await $FloorAppDatabase.databaseBuilder(AppDatabase.dbName).build();

  static Future<ContactsDAO> get contactsDAO async => (await _db).contactDao;
}
