class ContactValidator {
  static String? nameField(String? value) {
    if (value!.isEmpty) {
      return 'Informe um nome';
    }

    return null;
  }

  static String? emailField(String? value) {
    if (value!.isEmpty || !value.contains('@')) {
      return 'Informe um e-mail válido';
    }

    return null;
  }

  static String? cellphoneField(String? value) {
    try {
      if (value!.isEmpty || value.length < 9) {
        return 'Informe um número de celular válido';
      }

      int.tryParse(value);

      return null;
    } catch (e) {
      return 'Informe um número de celular válido';
    }
  }
}
