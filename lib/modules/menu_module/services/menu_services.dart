// menu_services.dart
import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

import 'package:bite_and_seat/core/constants/app_constants.dart';
import 'package:bite_and_seat/core/constants/app_urls.dart';
import 'package:bite_and_seat/core/enums/booking_type.dart';
import 'package:bite_and_seat/core/models/api_models/booking_response_model.dart';
import 'package:bite_and_seat/modules/menu_module/classes/step1_booking_details.dart';

class MenuServices {
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
          'Failed to booking: ${errorResponse['error'] ?? 'Unknown error'}',
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
