import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:bite_and_seat/modules/order_details_module/models/cancel_order_response_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:bite_and_seat/core/constants/app_constants.dart';
import 'package:bite_and_seat/core/constants/app_urls.dart';
import 'package:bite_and_seat/modules/order_details_module/class/feedback_data.dart';
import 'package:bite_and_seat/modules/order_details_module/models/submit_feedback_response_model.dart';

class OrderDetailsServices {
  static Future<SubmitFeedbackResponseModel> submitFeedback({
    required int userId,
    required FeedbackData feedbackData,
  }) async {
    try {
      Map<String, dynamic> params = {
        'user': userId.toString(),
        'order': feedbackData.orderId,
        'overall_rating': feedbackData.overallRating,
        'comments': feedbackData.comments,
        'items': feedbackData.itemRatings.map((itemRating) {
          return {
            'food_item': itemRating.foodItem,
            'rating': itemRating.rating,
          };
        }).toList(),
      };

      final resp = await http
          .post(
            Uri.parse(AppUrls.submitFeedbackUrl),
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
        final SubmitFeedbackResponseModel response =
            SubmitFeedbackResponseModel.fromJson(decoded);
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

  static Future<CancelOrderResponseModel> cancelOrder({
    required int orderId,
    required int userId,
  }) async {
    try {
      Map<String, dynamic> params = {'user_id': userId, 'order_id': orderId};

      final resp = await http
          .post(
            Uri.parse(AppUrls.cancelOrderUrl),
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
        final CancelOrderResponseModel response =
            CancelOrderResponseModel.fromJson(decoded);
        return response;
      } else {
        final Map<String, dynamic> errorResponse = jsonDecode(resp.body);
        throw Exception(
          'Failed to cancel order: ${errorResponse['message'] ?? 'Unknown error'}',
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
