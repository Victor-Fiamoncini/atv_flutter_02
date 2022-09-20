import 'package:atv_flutter_01/application/contracts/contact_repository.dart';
import 'package:atv_flutter_01/ui/widgets/contact_list_item.dart';
import 'package:flutter/material.dart';

class ContactListPage extends StatelessWidget {
  final ContactRepository contactRepository;

  const ContactListPage({
    Key? key,
    required this.contactRepository,
  }) : super(key: key);

  void _onBackButtonPressed(BuildContext context) {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final contacts = contactRepository.getAll();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.colorScheme.primary,
        elevation: 0,
        title: Text(
          'Lista de Contatos',
          style: TextStyle(color: theme.colorScheme.secondary),
        ),
        leading: BackButton(
          color: theme.colorScheme.secondary,
          onPressed: () => _onBackButtonPressed(context),
        ),
      ),
      body: SizedBox(
        width: double.infinity,
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 22),
          itemCount: contacts.length,
          itemBuilder: (context, index) => ContactListItem(
            contact: contacts[index],
          ),
        ),
      ),
    );
  }
}
