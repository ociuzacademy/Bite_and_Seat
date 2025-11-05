import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:bite_and_seat/core/constants/app_constants.dart';
import 'package:bite_and_seat/core/constants/app_urls.dart';
import 'package:bite_and_seat/core/models/api_models/order_details_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AppServices {
  static Future<OrderDetailsModel> getOrderDetails({
    required int orderId,
  }) async {
    try {
      final url = Uri.parse('${AppUrls.orderDetailsUrl}/$orderId/');

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
        final OrderDetailsModel response = OrderDetailsModel.fromJson(decoded);
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
}
