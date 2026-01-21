import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class RegisterProvider with ChangeNotifier {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _departmentController = TextEditingController();
  final TextEditingController _batchNameController = TextEditingController();

  String _userType = 'student';
  File? _profileImage;

  // Getters
  GlobalKey<FormState> get formKey => _formKey;
  TextEditingController get usernameController => _usernameController;
  TextEditingController get passwordController => _passwordController;
  TextEditingController get departmentController => _departmentController;
  TextEditingController get batchNameController => _batchNameController;
  String get userType => _userType;
  File? get profileImage => _profileImage;

  // Setters
  void setUserType(String type) {
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
    if (_userType == 'student') {
      if (value == null || value.isEmpty) {
        return 'Batch Name is missing';
      }
    }
    return null;
  }

  Future<void> pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      _profileImage = File(pickedFile.path);
      notifyListeners();
    }
  }

  void onRegister(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      if (_profileImage == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please select a profile photo')),
        );
        return;
      }

      debugPrint('Registering user: ${_usernameController.text}');
    }
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
