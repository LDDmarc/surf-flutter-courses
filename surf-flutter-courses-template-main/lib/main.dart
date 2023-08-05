import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/color_palette/color_palette_presenter.dart';
import 'color_palette/color_palette_widget.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  final _colorPalettePresenter = ColorPalettePresenter();

  MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: ColorPaletteWidget(presenter: _colorPalettePresenter)
        ),
      ),
    );
  }
}
