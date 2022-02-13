import 'contact.dart';

void main(List<String> args) {
  Contact contact = Contact();

  try {
    contact.email = "ishaquehassan@ssuet.com";
    contact.phone = "03451234674";
  } on InvalidPhoneException catch (e) {
    print(e.runtimeType);
    print("Invalid phone hai bhae waja ye h : ${e.message}");
  } on InvalidEmailException catch (e) {
    print(e.runtimeType);
    print("Invalid email hai bhae waja ye h : ${e.message}");
  } catch (e) {
    print(e.runtimeType);
    print(e);
  } finally {
    print("Finally boss is here :D");
  }
}

class InvalidEmailException implements Exception {
  String message;
  InvalidEmailException(this.message);
}

class InvalidPhoneException implements Exception {
  String message;
  InvalidPhoneException(this.message);
}
