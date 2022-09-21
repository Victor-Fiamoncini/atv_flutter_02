import 'package:atv_flutter_02/application/entities/contact_entity.dart';

abstract class ContactRepository {
  void addContact(ContactEntity contact);

  List<ContactEntity> getAll();
}
