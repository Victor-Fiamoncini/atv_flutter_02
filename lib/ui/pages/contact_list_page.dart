import 'package:atv_flutter_01/application/contracts/contact_repository.dart';
import 'package:atv_flutter_01/ui/widgets/contact_list_item.dart';
import 'package:flutter/material.dart';

class ContactListPage extends StatelessWidget {
  final ContactRepository contactRepository;
  final void Function() togglePages;

  const ContactListPage({
    Key? key,
    required this.contactRepository,
    required this.togglePages,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final contacts = contactRepository.getAll();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        elevation: 0,
        title: const Text('Lista de Contatos'),
        leading: BackButton(color: Colors.white, onPressed: togglePages),
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
