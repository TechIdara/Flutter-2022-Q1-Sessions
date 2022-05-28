import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_explained/base/app_setup.locator.dart';
import 'package:stacked_explained/base/app_setup.router.dart';
import 'package:stacked_explained/services/auth_service.dart';
import 'package:stacked_services/stacked_services.dart';

class LoginViewModel extends BaseViewModel {
  final _authService = locator<AuthService>();

  TextEditingController emailFieldController = TextEditingController();
  TextEditingController passwordFieldController = TextEditingController();

  void onLoginTap(BuildContext context) async {
    if (!(Form.of(context)?.validate() ?? false)) {
      return;
    }
    var res = await runBusyFuture(_authService.loginOrCreateUser(
        emailFieldController.text, passwordFieldController.text));
    if (res) {
      locator<NavigationService>().pushNamedAndRemoveUntil(Routes.homeView);
    }
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return "Please enter an email";
    }
    if (!value.contains("@")) {
      return "Please enter a valid email";
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return "Please enter a password";
    }
    if (value.length < 6) {
      return "Password must contain at least 6 chars";
    }
    return null;
  }
}
