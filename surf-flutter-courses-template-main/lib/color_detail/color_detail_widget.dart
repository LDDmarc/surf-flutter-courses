import 'package:flutter/material.dart';
import 'support/color_detail_presentation.dart';
import 'color_detail_presenter.dart';

class ColorDetailWidget extends StatefulWidget {
  final ColorDetailPresenter presenter;

  const ColorDetailWidget({super.key, required this.presenter});

  @override
  State<ColorDetailWidget> createState() => _ColorDetailWidgetState(presenter.detailPresentation);
}

class _ColorDetailWidgetState extends State<ColorDetailWidget> {
  final ColorDetailPresentation detailPresentation;

  _ColorDetailWidgetState(this.detailPresentation);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Ubuntu', scaffoldBackgroundColor: Colors.white),
      home: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: detailPresentation.color,
        ),
        body: Center(
            child: Text('ddd')
        ),
      ),
    );
  }

}