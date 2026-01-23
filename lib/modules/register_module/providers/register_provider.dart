import 'dart:io';
import 'package:bite_and_seat/core/enums/user_type.dart';
import 'package:bite_and_seat/modules/register_module/class/register_data.dart';
import 'package:bite_and_seat/widgets/snackbars/custom_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class RegisterProvider with ChangeNotifier {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _departmentController = TextEditingController();
  final TextEditingController _batchNameController = TextEditingController();

  UserType _userType = UserType.student;
  File? _profileImage;

  // Getters
  GlobalKey<FormState> get formKey => _formKey;
  TextEditingController get usernameController => _usernameController;
  TextEditingController get emailController => _emailController;
  TextEditingController get passwordController => _passwordController;
  TextEditingController get departmentController => _departmentController;
  TextEditingController get batchNameController => _batchNameController;
  UserType get userType => _userType;
  File? get profileImage => _profileImage;

  // Setters
  void setUserType(UserType type) {
    _userType = type;
    notifyListeners();
  }

  // Validators
  String? validateUsername(String? value) {
    if (value == null || value.isEmpty) {
      return 'Username is missing';
    }
    if (value.length < 3) {
      return 'Username must be at least 3 characters';
    }
    return null;
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is missing';
    }
    final emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );
    if (!emailRegex.hasMatch(value)) {
      return 'Enter a valid email address';
    }
    return null;
  }

  String? validatePassword(String? value) {
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
    if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value)) {
      return 'Password must contain at least one special character';
    }
    return null;
  }

  String? validateDepartment(String? value) {
    if (value == null || value.isEmpty) {
      return 'Department is missing';
    }
    return null;
  }

  String? validateBatchName(String? value) {
    if (_userType == UserType.student) {
      if (value == null || value.isEmpty) {
        return 'Batch Name is missing';
      }
    }
    return null;
  }

  Future<void> pickImage(BuildContext context) async {
    try {
      final picker = ImagePicker();
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        _profileImage = File(pickedFile.path);
        notifyListeners();
      }
    } catch (e) {
      if (context.mounted) {
        CustomSnackbar.showError(
          context,
          message: 'Failed to pick image: ${e.toString()}',
        );
      }
    }
  }

  RegisterData? getRegisterData() {
    if (!_formKey.currentState!.validate()) {
      return null;
    }

    if (_profileImage == null) {
      return null;
    }

    final String username = _usernameController.text.trim();
    final String email = _emailController.text.trim();
    final String password = _passwordController.text.trim();
    final String department = _departmentController.text.trim();
    final String batchName = _batchNameController.text.trim();

    if (_userType == UserType.student && batchName.isEmpty) {
      return null;
    }

    return RegisterData(
      username: username,
      email: email,
      password: password,
      userType: _userType,
      batchName: _userType == UserType.student ? batchName : null,
      department: department,
      profilePhoto: _profileImage!,
    );
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    _departmentController.dispose();
    _batchNameController.dispose();
    super.dispose();
  }
}
