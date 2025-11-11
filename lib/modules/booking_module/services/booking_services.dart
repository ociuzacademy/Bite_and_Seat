import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:bite_and_seat/core/constants/app_constants.dart';
import 'package:bite_and_seat/core/constants/app_urls.dart';
import 'package:bite_and_seat/core/enums/food_time.dart';
import 'package:bite_and_seat/core/models/api_models/booking_response_model.dart';
import 'package:bite_and_seat/modules/booking_module/classes/step2_booking_details.dart';
import 'package:bite_and_seat/modules/booking_module/models/category_time_slot_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class BookingServices {
  static Future<List<CategoryTimeSlotModel>> getCategoryTimeSlots({
    required FoodTime foodTime,
  }) async {
    try {
      Map<String, dynamic> params = {
        'category_id': _getCategoryId(foodTime).toString(),
      };
      final url = Uri.parse(
        AppUrls.categoryTimeSlotsUrl,
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
        debugPrint(resp.body);
        final List<dynamic> decoded = jsonDecode(resp.body);
        final response = decoded
            .map((item) => CategoryTimeSlotModel.fromJson(item))
            .toList();
        return response;
      } else {
        final Map<String, dynamic> errorResponse = jsonDecode(resp.body);
        throw Exception('${errorResponse['message'] ?? 'Unknown error'}');
      }
    } on TimeoutException catch (e) {
      debugPrint('MenuServices: Request timeout - $e');
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
      debugPrint('MenuServices: Unexpected error - $e');
      throw Exception('Something went wrong. Please try again.');
    }
  }

  static int _getCategoryId(FoodTime foodTime) {
    switch (foodTime) {
      case FoodTime.breakfast:
        return 1;
      case FoodTime.lunch:
        return 2;
      default:
        return 3;
    }
  }

  static Future<BookingResponseModel> bookingStep1({
    required int orderId,
    required Step2BookingDetails bookingDetails,
  }) async {
    try {
      Map<String, dynamic> params = {
        'slot_id': bookingDetails.selectedSlotId.toString(),
        'number_of_persons': bookingDetails.numberOfPersons.toString(),
      };

      final resp = await http
          .put(
            Uri.parse('${AppUrls.step2Url}/$orderId/'),
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

      if (resp.statusCode == 200) {
        final dynamic decoded = jsonDecode(resp.body);
        final BookingResponseModel response = BookingResponseModel.fromJson(
          decoded,
        );
        return response;
      } else {
        final Map<String, dynamic> errorResponse = jsonDecode(resp.body);
        throw Exception(
          'Failed to booking: ${errorResponse['message'] ?? 'Unknown error'}',
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
