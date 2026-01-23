import 'dart:io';

import 'package:bite_and_seat/core/enums/user_type.dart';

class RegisterData {
  final String username;
  final String email;
  final String password;
  final UserType userType;
  final String? batchName;
  final String department;
  final File profilePhoto;

  const RegisterData({
    required this.username,
    required this.email,
    required this.password,
    required this.userType,
    this.batchName,
    required this.department,
    required this.profilePhoto,
  });
}
