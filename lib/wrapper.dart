import 'package:atv_flutter_01/application/repositories/memory_contact_repository.dart';
import 'package:atv_flutter_01/ui/pages/contact_list_page.dart';
import 'package:atv_flutter_01/ui/pages/contact_page.dart';
import 'package:flutter/material.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  final contactRepository = MemoryContactRepository();

  bool showForm = true;

  void togglePages() {
    setState(() => showForm = !showForm);
  }

  @override
  Widget build(BuildContext context) {
    if (showForm) {
      return ContactPage(
        contactRepository: contactRepository,
        togglePages: togglePages,
      );
    }

    return ContactListPage(
      contactRepository: contactRepository,
      togglePages: togglePages,
    );
  }
}
