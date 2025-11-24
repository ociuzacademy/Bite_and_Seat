import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:bite_and_seat/core/constants/app_constants.dart';
import 'package:bite_and_seat/core/constants/app_urls.dart';
import 'package:bite_and_seat/core/models/api_models/booking_response_model.dart';
import 'package:bite_and_seat/modules/table_booking_module/models/selected_tables_model.dart';

class TableBookingServices {
  static Future<BookingResponseModel> bookingStep3({
    required int orderId,
    required SelectedTablesModel selectedTables,
  }) async {
    try {
      Map<String, dynamic> params = {
        'tables': selectedTables.tables.map((table) {
          return {
            'table_id': table.selectedTableId.toString(),
            'seat_ids': table.selectedSeats
                .map((seat) => seat.toString())
                .toList(),
          };
        }).toList(),
      };

      final resp = await http
          .put(
            Uri.parse('${AppUrls.step3Url}/$orderId/'),
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
        debugPrint(errorResponse.toString());
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
