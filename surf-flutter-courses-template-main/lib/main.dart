import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'tab_bar_widget.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Sora'),
      home: Scaffold(
        appBar: AppBar(
          title: Text('data'),
        ),
        body: Center(
          child: Text('Hello World!'),
        ),
        bottomNavigationBar: TabBarWidget()
      ),
    );
  }
}
