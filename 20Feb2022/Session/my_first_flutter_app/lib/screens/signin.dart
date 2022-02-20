import 'package:flutter/material.dart';

import '../app_button.dart';
import '../app_textfield.dart';

class SignIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF191720),
      body: Padding(
        padding:
            const EdgeInsets.only(top: 110, left: 27, bottom: 59, right: 27),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Let’s sign in",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 35,
                    fontWeight: FontWeight.bold)),
            const SizedBox(height: 14),
            const Text("Welcome\nJoin the community!",
                style: TextStyle(color: Colors.white, fontSize: 30)),
            const SizedBox(height: 47),
            AppTextField(placeholder: "Enter your email address"),
            AppTextField(placeholder: "Enter your password"),
            const Spacer(),
            GestureDetector(
              onTap: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'Already have an account ? ',
                    style: TextStyle(color: Color(0xFF8F8F9E), fontSize: 15),
                  ),
                  Text(
                    'Sign In',
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 11),
            AppButton(label: "Sign Up", onPress: onSignPress),
          ],
        ),
      ),
    );
  }

  void onSignPress() {}
}
