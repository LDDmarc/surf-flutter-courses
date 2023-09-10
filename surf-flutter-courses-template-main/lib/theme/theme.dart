import 'package:flutter/material.dart';
import 'theme_colors.dart';
import 'theme_text.dart';

ThemeData makeLightOneTheme() {
  return ThemeData(
    brightness: Brightness.light,
    appBarTheme: const AppBarTheme(color: Color(0xFFFFFFFF)),
    scaffoldBackgroundColor: const Color(0xFFFFFFFF),
    textTheme: createTextTheme(
        mainLabelColor: const Color(0xFF222222),
        titleLabelColor: const Color(0xFF222222),
        descriptionLabelColor: const Color(0xFF77767B)
    ),
    extensions: <ThemeExtension<dynamic>>[
      ThemeColors.lightOne
    ],
  );
}