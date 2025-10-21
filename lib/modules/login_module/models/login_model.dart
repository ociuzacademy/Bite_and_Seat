// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) =>
    LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  final String message;
  final String status;
  final int userId;
  final User user;

  LoginModel({
    required this.message,
    required this.status,
    required this.userId,
    required this.user,
  });

  LoginModel copyWith({
    String? message,
    String? status,
    int? userId,
    User? user,
  }) => LoginModel(
    message: message ?? this.message,
    status: status ?? this.status,
    userId: userId ?? this.userId,
    user: user ?? this.user,
  );

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
    message: json["message"],
    status: json["status"],
    userId: json["user_id"],
    user: User.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "status": status,
    "user_id": userId,
    "user": user.toJson(),
  };
}

class User {
  final String username;

  User({required this.username});

  User copyWith({String? username}) =>
      User(username: username ?? this.username);

  factory User.fromJson(Map<String, dynamic> json) =>
      User(username: json["username"]);

  Map<String, dynamic> toJson() => {"username": username};
}
