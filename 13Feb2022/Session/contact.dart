import 'custom_exceptions.dart';

class Contact {
  String _email = "";
  set email(String value) {
    if (value.contains('@') && value.contains('ssuet.com')) {
      _email = value;
    } else {
      if (!value.contains("@")) {
        throw InvalidEmailException("Bhae @ lagao email mai");
      } else if (!value.contains("ssuet.com")) {
        throw InvalidEmailException("Sirf sir syed ka bnda allow h :D");
      }
    }
  }

  String _phone = "";
  set phone(String value) {
    if (value.length == 11) {
      _phone = value;
    } else {
      throw InvalidPhoneException("Number sahe nh hai 11 number wala batao!");
    }
  }

  String get phone => _phone;

  String get email => _email;
}
