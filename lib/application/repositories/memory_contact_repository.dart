import 'package:atv_flutter_01/application/contracts/contact_repository.dart';
import 'package:atv_flutter_01/application/entities/contact_entity.dart';

class MemoryContactRepository implements ContactRepository {
  final List<ContactEntity> contacts = [];

  @override
  void addContact(ContactEntity contact) {
    contacts.add(contact);
  }

  @override
  List<ContactEntity> getAll() => contacts;
}
