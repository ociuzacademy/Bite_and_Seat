import 'package:bite_and_seat/core/theme/app_palette.dart';
import 'package:bite_and_seat/modules/register_module/providers/register_provider.dart';
import 'package:bite_and_seat/modules/register_module/widgets/register_form_field_label.dart';
import 'package:bite_and_seat/widgets/text_fields/auth_button.dart';
import 'package:bite_and_seat/widgets/text_fields/auth_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();

  static MaterialPageRoute route() => MaterialPageRoute(
    builder: (context) => ChangeNotifierProvider(
      create: (context) => RegisterProvider(),
      child: const RegisterPage(),
    ),
  );
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    final registerProvider = context.watch<RegisterProvider>();

    return Scaffold(
      appBar: AppBar(backgroundColor: AppPalette.firstColor, elevation: 0),
      backgroundColor: AppPalette.firstColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
            Text(
              'Register.',
              style: Theme.of(context).textTheme.displayLarge?.copyWith(
                color: AppPalette.whiteColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
                color: AppPalette.whiteColor,
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  key: registerProvider.formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: GestureDetector(
                          onTap: () => registerProvider.pickImage(),
                          child: Column(
                            children: [
                              CircleAvatar(
                                radius: 50,
                                backgroundColor: AppPalette.greyColor.withAlpha(
                                  50,
                                ),
                                backgroundImage:
                                    registerProvider.profileImage != null
                                    ? FileImage(registerProvider.profileImage!)
                                    : null,
                                child: registerProvider.profileImage == null
                                    ? const Icon(
                                        Icons.camera_alt,
                                        size: 40,
                                        color: AppPalette.greyColor,
                                      )
                                    : null,
                              ),
                              const SizedBox(height: 10),
                              const Text('Set Profile Photo'),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 25),
                      RegisterFormFieldLabel(
                        context: context,
                        text: 'Username',
                      ),
                      const SizedBox(height: 8),
                      AuthField(
                        hintText: 'Username',
                        controller: registerProvider.usernameController,
                        validator: registerProvider.validateUsername,
                      ),
                      const SizedBox(height: 15),
                      RegisterFormFieldLabel(
                        context: context,
                        text: 'Password',
                      ),
                      const SizedBox(height: 8),
                      AuthField(
                        hintText: 'Password',
                        controller: registerProvider.passwordController,
                        isObscure: true,
                        validator: registerProvider.validatePassword,
                      ),
                      const SizedBox(height: 15),
                      RegisterFormFieldLabel(
                        context: context,
                        text: 'User Type',
                      ),
                      const SizedBox(height: 8),
                      DropdownButtonFormField<String>(
                        value: registerProvider.userType,
                        decoration: const InputDecoration(
                          hintText: 'User Type',
                          border: OutlineInputBorder(),
                        ),
                        items: const [
                          DropdownMenuItem(
                            value: 'student',
                            child: Text('Student'),
                          ),
                          DropdownMenuItem(
                            value: 'faculty',
                            child: Text('Faculty'),
                          ),
                        ],
                        onChanged: (value) {
                          if (value != null) {
                            registerProvider.setUserType(value);
                          }
                        },
                      ),
                      const SizedBox(height: 15),
                      RegisterFormFieldLabel(
                        context: context,
                        text: 'Department',
                      ),
                      const SizedBox(height: 8),
                      AuthField(
                        hintText: 'Department',
                        controller: registerProvider.departmentController,
                        validator: registerProvider.validateDepartment,
                      ),
                      if (registerProvider.userType == 'student') ...[
                        const SizedBox(height: 15),
                        RegisterFormFieldLabel(
                          context: context,
                          text: 'Batch Name',
                        ),
                        const SizedBox(height: 8),
                        AuthField(
                          hintText: 'Batch Name',
                          controller: registerProvider.batchNameController,
                          validator: registerProvider.validateBatchName,
                        ),
                      ],
                      const SizedBox(height: 30),
                      AuthButton(
                        buttonText: 'REGISTER',
                        onSubmit: () => registerProvider.onRegister(context),
                      ),
                      const SizedBox(height: 20),
                      Center(
                        child: TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: RichText(
                            text: TextSpan(
                              text: 'Already have an account? ',
                              style: Theme.of(context).textTheme.bodyMedium,
                              children: [
                                TextSpan(
                                  text: 'Login',
                                  style: Theme.of(context).textTheme.bodyMedium
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
          ],
        ),
      ),
    );
  }
}
