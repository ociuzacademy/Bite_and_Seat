import 'dart:convert';
import 'dart:io';

import 'package:bite_and_seat/core/constants/app_urls.dart';
import 'package:bite_and_seat/modules/menu_module/errors/no_menu_exception.dart';
import 'package:bite_and_seat/modules/menu_module/models/daily_menu_model.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class MenuServices {
  static Future<DailyMenuModel> getDailyMenu({DateTime? selectedDate}) async {
    try {
      final DateFormat formatter = DateFormat('yyyy-MM-dd');
      final url = Uri.parse(AppUrls.dailyMenuUrl);

      if (selectedDate != null) {
        final String formattedDate = formatter.format(selectedDate);
        Map<String, dynamic> params = {"date": formattedDate};
        url.replace(queryParameters: params);
      }

      final resp = await http.get(
        url,
        headers: <String, String>{
          'Content-Type': 'application/x-www-form-urlencoded',
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
            selectedDate!,
            message: errorResponse['message'],
          );
        } else {
          throw Exception('${errorResponse['message'] ?? 'Unknown error'}');
        }
      }
    } on NoMenuException {
      rethrow;
    } on SocketException {
      throw Exception('Server error');
    } on HttpException {
      throw Exception('Something went wrong');
    } on FormatException {
      throw Exception('Bad request');
    } catch (e) {
      throw Exception(e.toString());
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
}
