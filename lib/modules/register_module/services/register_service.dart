import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:bite_and_seat/core/constants/app_constants.dart';
import 'package:bite_and_seat/core/enums/user_type.dart';
import 'package:bite_and_seat/modules/register_module/class/register_data.dart';
import 'package:bite_and_seat/modules/register_module/models/register_response_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:bite_and_seat/core/constants/app_urls.dart';

class RegisterService {
  static Future<RegisterResponseModel> userRegister({
    required RegisterData data,
  }) async {
    try {
      var request = http.MultipartRequest(
        'POST',
        Uri.parse(AppUrls.registerUrl),
      );

      request.fields['username'] = data.username;
      request.fields['email'] = data.email;
      request.fields['password'] = data.password;
      request.fields['user_type'] = data.userType.toJson();
      request.fields['department'] = data.department;

      if (data.userType == UserType.student && data.batchName != null) {
        request.fields['batch_name'] = data.batchName!;
      }

      var imageStream = http.ByteStream(data.profilePhoto.openRead());
      var imageLength = await data.profilePhoto.length();
      var multipartFile = http.MultipartFile(
        'profile_photo',
        imageStream,
        imageLength,
        filename: data.profilePhoto.path.split('/').last,
      );
      request.files.add(multipartFile);

      // Send request
      final resp = await request.send().timeout(
        const Duration(seconds: AppConstants.requestTimeoutSeconds),
        onTimeout: () {
          throw TimeoutException(
            'Request timed out after ${AppConstants.requestTimeoutSeconds} seconds',
          );
        },
      );

      // Convert the response stream to a string
      final responseBody = await resp.stream.bytesToString();

      if (resp.statusCode == 201) {
        final dynamic decoded = jsonDecode(responseBody);
        final RegisterResponseModel response = RegisterResponseModel.fromJson(
          decoded,
        );
        return response;
      } else {
        final Map<String, dynamic> errorResponse = jsonDecode(responseBody);
        throw Exception(errorResponse['message'] ?? 'Unknown error');
      }
    } on TimeoutException catch (e) {
      debugPrint('RegisterService: Request timeout - $e');
      throw Exception(
        'Request timeout. Please check your internet connection and try again.',
      );
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
}
