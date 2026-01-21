import 'package:bite_and_seat/core/bloc/auth/auth_bloc.dart';
import 'package:bite_and_seat/core/theme/app_palette.dart';
import 'package:bite_and_seat/modules/login_module/utils/login_helper.dart';
import 'package:bite_and_seat/widgets/text_fields/auth_button.dart';
import 'package:bite_and_seat/widgets/text_fields/auth_field.dart';
import 'package:bite_and_seat/modules/menu_module/view/menu_page.dart';
import 'package:bite_and_seat/widgets/loaders/overlay_loader.dart';
import 'package:bite_and_seat/widgets/snackbars/custom_snackbar.dart';
import 'package:bite_and_seat/modules/register_module/view/register_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();

  static MaterialPageRoute route() =>
      MaterialPageRoute(builder: (context) => const LoginPage());
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
                decoration: const BoxDecoration(
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
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Username is missing';
                            }
                            if (value.length < 3) {
                              return 'Username must be at least 3 characters';
                            }
                            return null;
                          },
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
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Password is missing';
                            }
                            if (value.length < 8) {
                              return 'Password must be at least 8 characters';
                            }
                            if (!RegExp(r'[A-Z]').hasMatch(value)) {
                              return 'Password must contain at least one uppercase letter';
                            }
                            if (!RegExp(r'[a-z]').hasMatch(value)) {
                              return 'Password must contain at least one lowercase letter';
                            }
                            if (!RegExp(r'[0-9]').hasMatch(value)) {
                              return 'Password must contain at least one number';
                            }
                            if (!RegExp(
                              r'[!@#$%^&*(),.?":{}|<>]',
                            ).hasMatch(value)) {
                              return 'Password must contain at least one special character';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.025,
                        ),
                        AuthButton(
                          buttonText: 'LOGIN',
                          onSubmit: () => _loginHelper.login(),
                        ),
                        const SizedBox(height: 20),
                        Center(
                          child: TextButton(
                            onPressed: () {
                              Navigator.push(context, RegisterPage.route());
                            },
                            child: RichText(
                              text: TextSpan(
                                text: 'Don\'t have an account? ',
                                style: Theme.of(context).textTheme.bodyMedium,
                                children: [
                                  TextSpan(
                                    text: 'Register',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.copyWith(
                                          color: AppPalette.firstColor,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox.shrink(),
            ],
          ),
        ),
      ),
    );
  }
}
