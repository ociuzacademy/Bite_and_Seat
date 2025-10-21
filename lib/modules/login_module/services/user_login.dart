import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import 'package:bite_and_seat/core/constants/app_urls.dart';
import 'package:bite_and_seat/modules/login_module/models/login_model.dart';

Future<LoginModel> userLogin({
  required String username,
  required String password,
}) async {
  try {
    Map<String, dynamic> params = {"username": username, "password": password};

    final resp = await http.post(
      Uri.parse(AppUrls.loginUrl),
      body: jsonEncode(params),
      headers: <String, String>{
        "Content-Type": "application/json; charset=utf-8",
      },
    );

    if (resp.statusCode == 200) {
      final dynamic decoded = jsonDecode(resp.body);
      final LoginModel response = LoginModel.fromJson(decoded);
      return response;
    } else {
      final Map<String, dynamic> errorResponse = jsonDecode(resp.body);
      throw Exception(
        'Failed to login: ${errorResponse['message'] ?? 'Unknown error'}',
      );
    }
  } on SocketException {
    throw Exception('No Internet connection');
  } on HttpException {
    throw Exception('Server error');
  } on FormatException {
    throw Exception('Bad response format');
  } catch (e) {
    throw Exception('Unexpected error: ${e.toString()}');
  }
}
