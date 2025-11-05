// menu_services.dart
import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:bite_and_seat/core/constants/app_constants.dart';
import 'package:bite_and_seat/core/constants/app_urls.dart';
import 'package:bite_and_seat/core/enums/booking_type.dart';
import 'package:bite_and_seat/core/models/api_models/booking_response_model.dart';
import 'package:bite_and_seat/modules/menu_module/classes/step1_booking_details.dart';
import 'package:bite_and_seat/modules/menu_module/errors/no_menu_exception.dart';
import 'package:bite_and_seat/modules/menu_module/models/daily_menu_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class MenuServices {
  static Future<DailyMenuModel> getDailyMenu({
    required DateTime selectedDate,
  }) async {
    try {
      final DateFormat formatter = DateFormat('yyyy-MM-dd');
      final String formattedDate = formatter.format(selectedDate);
      debugPrint(formattedDate);
      Map<String, dynamic> params = {'date': formattedDate};
      final url = Uri.parse(
        AppUrls.dailyMenuUrl,
      ).replace(queryParameters: params);

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
        final dynamic decoded = jsonDecode(resp.body);
        final DailyMenuModel response = DailyMenuModel.fromJson(decoded);
        return response;
      } else {
        final Map<String, dynamic> errorResponse = jsonDecode(resp.body);
        if (resp.statusCode == 404 &&
            _isNoMenuMessage(errorResponse['message'])) {
          throw NoMenuException(
            selectedDate,
            message: errorResponse['message'],
          );
        } else {
          throw Exception('${errorResponse['message'] ?? 'Unknown error'}');
        }
      }
    } on TimeoutException catch (e) {
      debugPrint('MenuServices: Request timeout - $e');
      throw Exception(
        'Request timeout. Please check your internet connection and try again.',
      );
    } on NoMenuException {
      rethrow;
    } on SocketException {
      throw Exception(
        'No internet connection. Please check your network settings.',
      );
    } on HttpException {
      throw Exception('Server error. Please try again later.');
    } on FormatException {
      throw Exception('Invalid response format. Please try again.');
    } catch (e) {
      debugPrint('MenuServices: Unexpected error - $e');
      throw Exception('Something went wrong. Please try again.');
    }
  }

  // Helper method to check if the message indicates no menu
  static bool _isNoMenuMessage(String message) {
    final lowerMessage = message.toLowerCase();
    return lowerMessage.contains('no menu') ||
        lowerMessage.contains('menu not found') ||
        lowerMessage.contains('no menu found') ||
        lowerMessage.contains('menu not available');
  }

  static Future<BookingResponseModel> bookingStep1({
    required int userId,
    required Step1BookingDetails bookingDetails,
  }) async {
    try {
      final DateFormat formatter = DateFormat('yyyy-MM-dd');
      final String formattedDate = formatter.format(bookingDetails.bookingDate);
      Map<String, dynamic> params = {
        'user': userId.toString(),
        'booking_type': bookingDetails.bookingType.toString(),
        'category': bookingDetails.categoryId.toString(),
        'date': formattedDate,
      };

      if (bookingDetails.bookingType == BookingType.prebooked &&
          bookingDetails.items.isNotEmpty) {
        params['items'] = bookingDetails.items.map((item) {
          return {
            'food_item': item.foodItemId.toString(),
            'quantity': item.quantity.toString(),
          };
        }).toList();
      }

      final resp = await http
          .post(
            Uri.parse(AppUrls.step1Url),
            body: jsonEncode(params),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=utf-8',
            },
          )
          .timeout(
            const Duration(seconds: AppConstants.requestTimeoutSeconds),
            onTimeout: () {
              throw TimeoutException(
                'Request timed out after ${AppConstants.requestTimeoutSeconds} seconds',
              );
            },
          );

      if (resp.statusCode == 201) {
        final dynamic decoded = jsonDecode(resp.body);
        final BookingResponseModel response = BookingResponseModel.fromJson(
          decoded,
        );
        return response;
      } else {
        final Map<String, dynamic> errorResponse = jsonDecode(resp.body);
        throw Exception(
          'Failed to login: ${errorResponse['message'] ?? 'Unknown error'}',
        );
      }
    } on TimeoutException catch (e) {
      debugPrint('MenuServices: Request timeout - $e');
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
