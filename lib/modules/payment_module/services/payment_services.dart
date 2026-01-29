import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:bite_and_seat/modules/payment_module/classes/card_data.dart';
import 'package:bite_and_seat/modules/payment_module/classes/cash_payment_data.dart';
import 'package:bite_and_seat/modules/payment_module/classes/u_p_i_data.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:bite_and_seat/core/constants/app_constants.dart';
import 'package:bite_and_seat/core/constants/app_urls.dart';
import 'package:bite_and_seat/modules/payment_module/models/payment_response_model.dart';

class PaymentServices {
  static Future<PaymentResponseModel> submitUpiPayment({
    required UPIData upiData,
  }) async {
    try {
      Map<String, dynamic> params = {
        'order': upiData.paymentData.orderId,
        'payment_method': 'upi',
        'payment_type': upiData.bookingMethod.label,
        'upi_id': upiData.upiId,
      };

      final resp = await http
          .post(
            Uri.parse(AppUrls.paymentUrl),
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
        final PaymentResponseModel response = PaymentResponseModel.fromJson(
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

  static Future<PaymentResponseModel> submitCardPayment({
    required CardData cardData,
  }) async {
    try {
      Map<String, dynamic> params = {
        'order': cardData.paymentData.orderId,
        'payment_method': 'card',
        'payment_type': cardData.bookingMethod.label,
        'cardholder_name': cardData.cardholderName,
        'card_number': cardData.cardNumber,
        'expiry_date': cardData.expiryDate,
        'cvv_number': cardData.cvvNumber,
      };

      final resp = await http
          .post(
            Uri.parse(AppUrls.paymentUrl),
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
        final PaymentResponseModel response = PaymentResponseModel.fromJson(
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

  static Future<PaymentResponseModel> submitCashPayment({
    required CashPaymentData cashData,
  }) async {
    try {
      Map<String, dynamic> params = {
        'order': cashData.paymentData.orderId,
        'payment_method': 'cash',
        'payment_type': cashData.bookingMethod.label,
      };

      final resp = await http
          .post(
            Uri.parse(AppUrls.paymentUrl),
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
        final PaymentResponseModel response = PaymentResponseModel.fromJson(
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
