import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  Future<bool> loginOrCreateUser(String email, String password) async {
    try {
      await _signIn(email, password);
      return true;
    } catch (e) {
      try {
        await _signUp(email, password);
        return true;
      } catch (e) {
        return false;
      }
    }
  }

  String? get email => FirebaseAuth.instance.currentUser?.email;

  _signIn(String email, String password) async {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
  }

  _signUp(String email, String password) async {
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
  }
}
