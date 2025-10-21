// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bite_and_seat/core/bloc/auth/auth_bloc.dart';
import 'package:bite_and_seat/widgets/snackbars/custom_snackbar.dart';

class LoginHelper {
  final BuildContext context;
  final GlobalKey<FormState> loginFormKey;
  final TextEditingController usernameController;
  final TextEditingController passwordController;

  const LoginHelper({
    required this.context,
    required this.loginFormKey,
    required this.usernameController,
    required this.passwordController,
  });

  void login() {
    FocusScope.of(context).unfocus();
    if (loginFormKey.currentState!.validate()) {
      final String username = usernameController.text.trim();
      final String password = passwordController.text.trim();

      final AuthBloc authBloc = context.read<AuthBloc>();

      authBloc.add(AuthEvent.userLoggingIn(username, password));
    } else {
      CustomSnackbar.showError(
        context,
        message: 'Please fill both user ID and password',
      );
    }
  }
}
