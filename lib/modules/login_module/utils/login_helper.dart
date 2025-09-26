// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bite_and_seat/modules/menu_module/view/menu_page.dart';
import 'package:bite_and_seat/widgets/snackbars/custom_snackbar.dart';
import 'package:flutter/widgets.dart';

class LoginHelper {
  final BuildContext context;
  final GlobalKey<FormState> loginFormKey;
  final TextEditingController userIdController;
  final TextEditingController passwordController;

  LoginHelper({
    required this.context,
    required this.loginFormKey,
    required this.userIdController,
    required this.passwordController,
  });

  void login() {
    FocusScope.of(context).unfocus();
    if (loginFormKey.currentState!.validate()) {
      if (userIdController.text.trim() != 'user') {
        CustomSnackbar.showError(context, message: 'Invalid user ID');
      } else {
        final String password = passwordController.text.trim();
        if (password.isEmpty || password != '123') {
          CustomSnackbar.showError(context, message: 'Invalid password');
        } else {
          CustomSnackbar.showSuccess(
            context,
            message: 'User logged in successfully',
          );
          Navigator.pushReplacement(context, MenuPage.route());
        }
      }
    } else {
      CustomSnackbar.showError(
        context,
        message: 'Please fill both user ID and password',
      );
    }
  }
}
