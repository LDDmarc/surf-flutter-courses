import 'package:flutter/material.dart';

ThemeData get lightFirstTheme {
  return ThemeData(
    colorScheme: _lightFirstScheme
  );
}

ColorScheme get _lightFirstScheme {
  return const ColorScheme(
      brightness: Brightness.light,
      primary: Colors.white,
      onPrimary: Color(0xFF222222),
      secondary: Color(0xFFF6F6F6),
      onSecondary: Color(0xFF77767B),
      error: Colors.red,
      onError: Colors.black,
      background: Colors.white,
      onBackground: Color(0xFF222222),
      surface: Colors.white,
      onSurface: Color(0xFF222222)
  );
}