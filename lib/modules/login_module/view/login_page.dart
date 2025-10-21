import 'package:bite_and_seat/core/bloc/auth/auth_bloc.dart';
import 'package:bite_and_seat/core/theme/app_palette.dart';
import 'package:bite_and_seat/modules/login_module/utils/login_helper.dart';
import 'package:bite_and_seat/modules/login_module/widgets/auth_button.dart';
import 'package:bite_and_seat/modules/login_module/widgets/auth_field.dart';
import 'package:bite_and_seat/modules/menu_module/view/menu_page.dart';
import 'package:bite_and_seat/widgets/loaders/overlay_loader.dart';
import 'package:bite_and_seat/widgets/snackbars/custom_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();

  static route() => MaterialPageRoute(builder: (context) => LoginPage());
}

class _LoginPageState extends State<LoginPage> {
  late final LoginHelper _loginHelper;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    _loginHelper = LoginHelper(
      context: context,
      loginFormKey: _formKey,
      usernameController: _usernameController,
      passwordController: _passwordController,
    );
    super.initState();
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: AppPalette.firstColor),
      backgroundColor: AppPalette.firstColor,
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          switch (state) {
            case AuthLoading _:
              OverlayLoader.show(context, message: 'Logging in...');
              break;
            case LoginSuccess(:final response):
              OverlayLoader.hide();
              CustomSnackbar.showSuccess(
                context,
                message: 'Message: ${response.message}',
              );
              Navigator.pushReplacement(context, MenuPage.route());
              break;
            case AuthError(:final errorMessage):
              OverlayLoader.hide();
              CustomSnackbar.showError(
                context,
                message: 'Error: $errorMessage',
              );
              break;
            default:
              OverlayLoader.hide();
              break;
          }
        },
        child: SingleChildScrollView(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center, // Remove to avoid layout issues
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.35,
              ), // Add spacing instead of Spacer
              Text(
                'Login.',
                style: Theme.of(context).textTheme.displayLarge?.copyWith(
                  color: AppPalette.whiteColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.075),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.425,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                  color: AppPalette.whiteColor,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01,
                        ),
                        Text(
                          'Username',
                          style: Theme.of(context).textTheme.titleLarge
                              ?.copyWith(
                                color: AppPalette.firstColor.withValues(
                                  alpha: 0.8,
                                ),
                                fontWeight: FontWeight.w500,
                              ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.0175,
                        ),
                        AuthField(
                          hintText: 'Username',
                          controller: _usernameController,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.025,
                        ),
                        Text(
                          'Password',
                          style: Theme.of(context).textTheme.titleLarge
                              ?.copyWith(
                                color: AppPalette.firstColor.withValues(
                                  alpha: 0.8,
                                ),
                                fontWeight: FontWeight.w500,
                              ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.0175,
                        ),
                        AuthField(
                          hintText: 'Password',
                          controller: _passwordController,
                          isObscure: true,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.025,
                        ),
                        AuthButton(
                          buttonText: 'LOGIN',
                          onSubmit: () => _loginHelper.login(),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox.shrink(),
            ],
          ),
        ),
      ),
    );
  }
}
