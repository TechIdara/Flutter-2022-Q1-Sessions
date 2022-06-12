import 'package:flutter/material.dart';
import 'package:local_db_floor/db/entities/contact.dart';
import 'package:local_db_floor/db/local_db_service.dart';

class ContactForm extends StatefulWidget {
  Function onSaved;
  ValueChanged<ContactForm> onReady;
  int? editId;
  final TextEditingController nameCtrl = TextEditingController();
  final TextEditingController phoneCtrl = TextEditingController();

  edit(Contact contact) {
    nameCtrl.text = contact.name;
    phoneCtrl.text = contact.phone;
    editId = contact.id;
  }

  ContactForm({Key? key, required this.onSaved, required this.onReady})
      : super(key: key);

  @override
  State<ContactForm> createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  @override
  Widget build(BuildContext context) {
    widget.onReady(widget);
    return Form(
      child: Builder(
          builder: (childContext) => Column(
                children: [
                  TextFormField(
                    controller: widget.nameCtrl,
                    decoration: InputDecoration(hintText: "Name"),
                    validator: (value) => value == null || value.isEmpty
                        ? "Please enter name"
                        : null,
                  ),
                  TextFormField(
                    controller: widget.phoneCtrl,
                    decoration: InputDecoration(hintText: "Phone"),
                    validator: (value) => value == null || value.isEmpty
                        ? "Please enter phone"
                        : null,
                  ),
                  ElevatedButton(
                      onPressed: () => saveContact(childContext),
                      child: Text(widget.editId != null ? "Update" : "Save"))
                ],
              )),
    );
  }

  saveContact(BuildContext childContext) async {
    if (!Form.of(childContext)!.validate()) {
      return;
    }
    if (widget.editId == null) {
      (await LocalDbService.contactsDAO).addContact(
          Contact(null, widget.nameCtrl.text, widget.phoneCtrl.text));
    } else {
      (await LocalDbService.contactsDAO).updateContact(
          Contact(widget.editId, widget.nameCtrl.text, widget.phoneCtrl.text));
    }
    widget.nameCtrl.clear();
    widget.phoneCtrl.clear();
    setState(() {
      widget.editId = null;
    });
    widget.onSaved();
  }
}
