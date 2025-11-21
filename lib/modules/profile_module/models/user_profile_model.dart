// To parse this JSON data, do
//
//     final userProfileModel = userProfileModelFromJson(jsonString);

import 'dart:convert';

UserProfileModel userProfileModelFromJson(String str) =>
    UserProfileModel.fromJson(json.decode(str));

String userProfileModelToJson(UserProfileModel data) =>
    json.encode(data.toJson());

class UserProfileModel {
  final int id;
  final String username;
  final String password;
  final String userType;
  final String? batchName;
  final String department;
  final String profilePhoto;

  const UserProfileModel({
    required this.id,
    required this.username,
    required this.password,
    required this.userType,
    this.batchName,
    required this.department,
    required this.profilePhoto,
  });

  UserProfileModel copyWith({
    int? id,
    String? username,
    String? password,
    String? userType,
    String? batchName,
    String? department,
    String? profilePhoto,
  }) => UserProfileModel(
    id: id ?? this.id,
    username: username ?? this.username,
    password: password ?? this.password,
    userType: userType ?? this.userType,
    batchName: batchName ?? this.batchName,
    department: department ?? this.department,
    profilePhoto: profilePhoto ?? this.profilePhoto,
  );

  factory UserProfileModel.fromJson(Map<String, dynamic> json) =>
      UserProfileModel(
        id: json['id'],
        username: json['username'],
        password: json['password'],
        userType: json['user_type'],
        batchName: json['batch_name'],
        department: json['department'],
        profilePhoto: json['profile_photo'],
      );

  Map<String, dynamic> toJson() => {
    'id': id,
    'username': username,
    'password': password,
    'user_type': userType,
    'batch_name': batchName,
    'department': department,
    'profile_photo': profilePhoto,
  };
}
