import 'package:floor/floor.dart';
import 'package:local_db_floor/db/entities/contact.dart';

@dao
abstract class ContactsDAO {
  @insert
  Future<void> addContact(Contact contact);

  @update
  Future<void> updateContact(Contact contact);

  @delete
  Future<void> deleteContact(Contact contact);

  @Query("SELECT * FROM contacts")
  Future<List<Contact>> getAll();

  @Query("SELECT * FROM contacts WHERE id = :id")
  Future<Contact?> findById(int id);

  @Query("SELECT * FROM contacts WHERE name LIKE '%:name%'")
  Future<Contact?> findByName(String name);

  @Query("SELECT * FROM contacts WHERE phone LIKE '%:phone%'")
  Future<Contact?> findByPhone(String phone);
}
