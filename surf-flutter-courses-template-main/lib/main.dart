import 'package:flutter/material.dart';
import 'main_widget.dart';
import 'theme_colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: _makeTheme(),
        home: MainWidget()
    );
  }

  ThemeData _makeTheme() {
    return ThemeData(
      brightness: Brightness.light,
      extensions: <ThemeExtension<dynamic>>[
        ThemeColors.lightOne
      ],
    );
  }
}
