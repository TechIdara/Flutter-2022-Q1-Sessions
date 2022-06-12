import 'package:flutter/material.dart';
import 'package:local_db_floor/contact_form.dart';
import 'package:local_db_floor/db/local_db_service.dart';

import 'db/entities/contact.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: ContactsAppScreen(),
    );
  }
}

class ContactsAppScreen extends StatefulWidget {
  const ContactsAppScreen({Key? key}) : super(key: key);

  @override
  State<ContactsAppScreen> createState() => _ContactsAppScreenState();
}

class _ContactsAppScreenState extends State<ContactsAppScreen> {
  List<Contact> contacts = [];
  late ContactForm form;

  @override
  void initState() {
    super.initState();
    fetchAllContacts();
  }

  fetchAllContacts() async {
    contacts = await (await LocalDbService.contactsDAO).getAll();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Contacts App'),
        ),
        body: Column(
          children: [
            ContactForm(
                onSaved: fetchAllContacts,
                onReady: (form) {
                  this.form = form;
                }),
            Expanded(
                child: ListView.builder(
              itemCount: contacts.length,
              itemBuilder: (ctx, index) => ListTile(
                title: Text(contacts[index].name),
                subtitle: Text(contacts[index].phone),
                trailing: GestureDetector(
                  onTap: () => onEditTap(index),
                  child: Icon(Icons.edit),
                ),
              ),
            ))
          ],
        ));
  }

  onEditTap(int index) {
    form.edit(contacts[index]);
  }

  onDeleteTap(int index) {}
}
