import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/color_detail/color_detail_model.dart';
import 'package:surf_flutter_courses_template/color_detail/color_detail_presenter.dart';
import 'package:surf_flutter_courses_template/color_detail/color_detail_widget.dart';
import 'package:surf_flutter_courses_template/color_palette/color_palette_presenter.dart';
import 'color_palette/color_palette_widget.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {

  MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Ubuntu', scaffoldBackgroundColor: Colors.white),
      home: Builder(
        builder: (context) => Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
          ),
          body: Center(
            child: ColorPaletteWidget(presenter: _makeColorPalettePresenter(context))
          ),
        ),
      )
    );
  }

  ColorPalettePresenter _makeColorPalettePresenter(BuildContext context) {
    return ColorPalettePresenter(
        onShowColor: (colorModel) {
          final colorDetailModel = ColorDetailModel(colorModel);
          final colorDetailPresenter = ColorDetailPresenter(colorDetailModel);
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ColorDetailWidget(presenter: colorDetailPresenter))
          );
        }
    );
  }
}
