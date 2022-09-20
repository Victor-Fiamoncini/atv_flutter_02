import 'package:atv_flutter_01/application/contracts/contact_repository.dart';
import 'package:atv_flutter_01/application/entities/contact_entity.dart';
import 'package:atv_flutter_01/ui/pages/contact_list_page.dart';
import 'package:atv_flutter_01/ui/styles.dart';
import 'package:atv_flutter_01/validators/contact_validator.dart';
import 'package:flutter/material.dart';

class ContactPage extends StatefulWidget {
  final ContactRepository contactRepository;

  const ContactPage({
    Key? key,
    required this.contactRepository,
  }) : super(key: key);

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  final _formKey = GlobalKey<FormState>();

  String name = '';
  String email = '';
  String cellphone = '';

  void _onNameFieldChange(String inputName) {
    setState(() => name = inputName);
  }

  void _onEmailFieldChange(String inputEmail) {
    setState(() => email = inputEmail);
  }

  void _onCellphoneFieldChange(String inputCellphone) {
    setState(() => cellphone = inputCellphone);
  }

  void _emptyFormFields() {
    setState(() => {name = '', email = '', cellphone = ''});

    _formKey.currentState?.reset();
  }

  void _onFormButtonPress(BuildContext context) {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    try {
      final newContact = ContactEntity(
        name: name,
        email: email,
        cellphone: int.parse(cellphone),
      );

      widget.contactRepository.addContact(newContact);

      _emptyFormFields();

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ContactListPage(
            contactRepository: widget.contactRepository,
          ),
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Um erro inesperado ocorreu, verifique seus dados e tente novamente',
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 0,
        title: const Text('Cadastro de Contatos'),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 22),
          child: Column(
            children: [
              const Text(
                'Informe os dados do contato no formulário abaixo',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 16),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      style: defaultTextFormFieldTextStyle,
                      decoration: const InputDecoration(hintText: 'Nome'),
                      validator: ContactValidator.nameField,
                      onChanged: _onNameFieldChange,
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      style: defaultTextFormFieldTextStyle,
                      decoration: const InputDecoration(hintText: 'E-mail'),
                      validator: ContactValidator.emailField,
                      onChanged: _onEmailFieldChange,
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.next,
                      style: defaultTextFormFieldTextStyle,
                      decoration: const InputDecoration(hintText: 'Celular'),
                      validator: ContactValidator.cellphoneField,
                      onChanged: _onCellphoneFieldChange,
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () => _onFormButtonPress(context),
                      child: const Text(
                        'Enviar',
                        style: defaultElevatedButtonTextStyle,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
