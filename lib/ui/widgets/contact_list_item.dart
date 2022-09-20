import 'package:atv_flutter_01/application/entities/contact_entity.dart';
import 'package:flutter/material.dart';

class ContactListItem extends StatelessWidget {
  final ContactEntity contact;

  const ContactListItem({
    Key? key,
    required this.contact,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(top: 16),
      elevation: 0,
      color: Colors.cyan,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(28),
      ),
      child: ListTile(
        title: Text(
          '${contact.name} - ${contact.email}',
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
        subtitle: Text(
          'Celular: ${contact.cellphone}',
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
