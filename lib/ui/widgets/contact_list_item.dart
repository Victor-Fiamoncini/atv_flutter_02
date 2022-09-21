import 'package:atv_flutter_02/application/entities/contact_entity.dart';
import 'package:flutter/material.dart';

class ContactListItem extends StatelessWidget {
  final ContactEntity contact;

  const ContactListItem({
    Key? key,
    required this.contact,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      margin: const EdgeInsets.only(top: 16),
      elevation: 0,
      color: theme.colorScheme.primary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(28),
      ),
      child: ListTile(
        title: Text(
          '${contact.name} - ${contact.email}',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            color: theme.colorScheme.secondary,
          ),
        ),
        subtitle: Text(
          'Celular: ${contact.cellphone}',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            color: theme.colorScheme.secondary,
          ),
        ),
      ),
    );
  }
}
