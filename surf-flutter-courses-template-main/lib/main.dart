import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:surf_flutter_courses_template/empty_screen.dart';
import 'tab_bar_widget.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MainAppState();
  }
}

class _MainAppState extends State<MainApp> {
  int _currentIndex = 3;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Sora'),
      home: Scaffold(
          appBar: AppBar(
            title: Text('data'),
          ),
          body: (() {
            switch (_currentIndex) {
              case 3:
                Center(
                  child: Text('tadam'),
                );
              default:
                return EmptyScreenWidget();
            }
          }()),
          bottomNavigationBar: TabBarWidget(
            selectedIndex: _currentIndex,
            onItemTapped: _onItemTapped
          )
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

}