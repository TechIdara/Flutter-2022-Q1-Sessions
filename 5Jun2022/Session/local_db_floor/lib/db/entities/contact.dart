import 'package:floor/floor.dart';

@Entity(tableName: "contacts")
class Contact {
  @PrimaryKey(autoGenerate: true)
  final int? id;

  final String name;
  final String phone;

  Contact(this.id, this.name, this.phone);
}
