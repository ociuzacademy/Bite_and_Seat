import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:bite_and_seat/core/constants/app_constants.dart';
import 'package:bite_and_seat/core/constants/app_urls.dart';
import 'package:bite_and_seat/modules/complaints_module/classes/complaints_data.dart';
import 'package:bite_and_seat/modules/complaints_module/models/submit_report_response_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ComplaintsServices {
  static Future<SubmitReportResponseModel> submitResponse({
    required int userId,
    required ComplaintsData complaintsData,
  }) async {
    try {
      var request = http.MultipartRequest(
        'POST',
        Uri.parse(AppUrls.submitReportUrl),
      );

      request.fields['user'] = userId.toString();
      request.fields['category'] = complaintsData.category;
      request.fields['description'] = complaintsData.description;

      for (var image in complaintsData.images) {
        var imageStream = http.ByteStream(image.openRead());
        var imageLength = await image.length();
        var multipartFile = http.MultipartFile(
          'images',
          imageStream,
          imageLength,
          filename: image.path.split('/').last,
        );
        request.files.add(multipartFile);
      }

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
        final SubmitReportResponseModel response =
            SubmitReportResponseModel.fromJson(decoded);
        return response;
      } else {
        final Map<String, dynamic> errorResponse = jsonDecode(responseBody);
        throw Exception(errorResponse['message'] ?? 'Unknown error');
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
