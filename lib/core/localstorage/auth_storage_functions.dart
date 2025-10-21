import 'package:bite_and_seat/core/localstorage/auth_storage_keys.dart';
import 'package:bite_and_seat/core/exceptions/auth_storage_exceptions.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthStorageFunctions {
  static Future<void> login(int userId) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await Future.wait([
        prefs.setInt(AuthStorageKeys.userId, userId),
        prefs.setBool(AuthStorageKeys.isLoggedIn, true),
      ]);
    } catch (e) {
      throw LoginStorageException('Unable to store user credentials', e);
    }
  }

  static Future<void> logout() async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await Future.wait([
        prefs.remove(AuthStorageKeys.userId),
        prefs.setBool(AuthStorageKeys.isLoggedIn, false),
      ]);
    } catch (e) {
      throw LogoutStorageException('Unable to clear user credentials', e);
    }
  }

  static Future<int> getUserId() async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final int? userId = prefs.getInt(AuthStorageKeys.userId);
      return userId ?? 0;
    } catch (e) {
      throw GetUserIdStorageException('Unable to retrieve user ID', e);
    }
  }

  static Future<bool> getLoginStatus() async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final bool? isLoggedIn = prefs.getBool(AuthStorageKeys.isLoggedIn);
      return isLoggedIn ?? false;
    } catch (e) {
      throw GetLoginStatusStorageException(
        'Unable to retrieve login status',
        e,
      );
    }
  }
}
