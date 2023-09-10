import 'package:flutter/material.dart';
import 'main_widget.dart';
import 'theme/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: makeLightOneTheme(),
        home: const MainWidget()
    );
  }
}
