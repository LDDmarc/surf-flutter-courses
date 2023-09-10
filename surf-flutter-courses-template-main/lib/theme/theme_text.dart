import 'package:flutter/material.dart';

TextTheme createTextTheme(
{
  required Color mainLabelColor,
  required Color titleLabelColor,
  required Color descriptionLabelColor,
}) {
  return TextTheme(
    labelLarge: TextStyle(fontSize: 18, color: titleLabelColor),
    labelMedium: TextStyle(fontSize: 16, color: mainLabelColor),
    labelSmall: TextStyle(fontSize: 14, color: descriptionLabelColor)
  );
}