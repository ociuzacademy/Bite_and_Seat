import 'package:flutter/material.dart';

import 'package:bite_and_seat/core/theme/app_palette.dart';

class AppTheme {
  static _border([Color color = AppPalette.blackColor]) => OutlineInputBorder(
    borderSide: BorderSide(color: color, width: 2),
    borderRadius: BorderRadius.circular(10),
  );
  static final darkThemeData = ThemeData.dark().copyWith(
    // scaffoldBackgroundColor: AppPalette.firstColor,
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.all(27),
      enabledBorder: _border(),
      focusedBorder: _border(AppPalette.firstColor),
      errorBorder: _border(AppPalette.errorColor),
      focusedErrorBorder: _border(AppPalette.errorColor),
    ),
    // appBarTheme: const AppBarTheme(backgroundColor: AppPalette.firstColor),
  );

  static final lightThemeData = ThemeData.light().copyWith(
    // scaffoldBackgroundColor: AppPalette.firstColor,
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.all(27),
      enabledBorder: _border(),
      focusedBorder: _border(AppPalette.firstColor),
      errorBorder: _border(AppPalette.errorColor),
      focusedErrorBorder: _border(AppPalette.errorColor),
    ),
    // appBarTheme: const AppBarTheme(backgroundColor: AppPalette.firstColor),
  );
}
