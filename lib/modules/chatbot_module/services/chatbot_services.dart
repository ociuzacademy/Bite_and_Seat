import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:bite_and_seat/modules/chatbot_module/models/api_models/todays_special_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:bite_and_seat/core/constants/app_constants.dart';
import 'package:bite_and_seat/core/constants/app_urls.dart';
import 'package:bite_and_seat/modules/chatbot_module/models/api_models/category_model.dart';
import 'package:intl/intl.dart';

class ChatbotServices {
  static Future<List<CategoryModel>> getCategories() async {
    try {
      final url = Uri.parse(AppUrls.getCategoriesUrl);

      // Create a timeout duration
      const Duration timeoutDuration = Duration(
        seconds: AppConstants.requestTimeoutSeconds,
      );

      // Make the HTTP request with timeout
      final resp = await http
          .get(
            url,
            headers: <String, String>{
              'Content-Type': 'application/x-www-form-urlencoded',
            },
          )
          .timeout(
            timeoutDuration,
            onTimeout: () {
              throw TimeoutException(
                'Request timed out after ${AppConstants.requestTimeoutSeconds} seconds',
              );
            },
          );

      if (resp.statusCode == 200) {
        final List<dynamic> decoded = jsonDecode(resp.body);
        final List<CategoryModel> response = decoded
            .map((item) => CategoryModel.fromJson(item))
            .toList();
        return response;
      } else {
        final Map<String, dynamic> errorResponse = jsonDecode(resp.body);
        throw Exception('${errorResponse['message'] ?? 'Unknown error'}');
      }
    } on TimeoutException catch (e) {
      debugPrint('ChatbotServices: Request timeout - $e');
      throw Exception(
        'Request timeout. Please check your internet connection and try again.',
      );
    } on SocketException {
      throw Exception(
        'No internet connection. Please check your network settings.',
      );
    } on HttpException {
      throw Exception('Server error. Please try again later.');
    } on FormatException {
      throw Exception('Invalid response format. Please try again.');
    } catch (e) {
      debugPrint('ChatbotServices: Unexpected error - $e');
      throw Exception('Something went wrong. Please try again.');
    }
  }

  static Future<List<TodaysSpecialModel>> getTodaysSpecial(
    DateTime date,
  ) async {
    try {
      final DateFormat formatter = DateFormat('yyyy-MM-dd');
      final String formattedDate = formatter.format(date);
      final url = Uri.parse(
        AppUrls.getTodaysSpecialUrl,
      ).replace(queryParameters: {'date': formattedDate});

      // Create a timeout duration
      const Duration timeoutDuration = Duration(
        seconds: AppConstants.requestTimeoutSeconds,
      );

      // Make the HTTP request with timeout
      final resp = await http
          .get(
            url,
            headers: <String, String>{
              'Content-Type': 'application/x-www-form-urlencoded',
            },
          )
          .timeout(
            timeoutDuration,
            onTimeout: () {
              throw TimeoutException(
                'Request timed out after ${AppConstants.requestTimeoutSeconds} seconds',
              );
            },
          );

      if (resp.statusCode == 200) {
        final List<dynamic> decoded = jsonDecode(resp.body);
        final List<TodaysSpecialModel> response = decoded
            .map((item) => TodaysSpecialModel.fromJson(item))
            .toList();
        return response;
      } else {
        final Map<String, dynamic> errorResponse = jsonDecode(resp.body);
        throw Exception('${errorResponse['message'] ?? 'Unknown error'}');
      }
    } on TimeoutException catch (e) {
      debugPrint('ChatbotServices: Request timeout - $e');
      throw Exception(
        'Request timeout. Please check your internet connection and try again.',
      );
    } on SocketException {
      throw Exception(
        'No internet connection. Please check your network settings.',
      );
    } on HttpException {
      throw Exception('Server error. Please try again later.');
    } on FormatException {
      throw Exception('Invalid response format. Please try again.');
    } catch (e) {
      debugPrint('ChatbotServices: Unexpected error - $e');
      throw Exception('Something went wrong. Please try again.');
    }
  }
}
