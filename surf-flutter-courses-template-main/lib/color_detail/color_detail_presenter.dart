import 'package:surf_flutter_courses_template/color_detail/color_detail_model.dart';
import 'package:surf_flutter_courses_template/color_model.dart';
import 'support/color_detail_presentation.dart';
import 'package:flutter/material.dart';

class ColorDetailPresenter {
  final ColorDetailModel _detailModel;
  ColorModel get _colorModel => _detailModel.colorModel;

  ColorDetailPresentation get detailPresentation => _makePresentation();

  ColorDetailPresenter(this._detailModel);

  ColorDetailPresentation _makePresentation() {
    final color = _generateColor(_colorModel.value!);
    return ColorDetailPresentation(
        title: _colorModel.name,
        hexSubtitle: _colorModel.value!.substring(1),
        color: color,
        redValue: '${color.red}',
        greenValue: '${color.green}',
        blueValue: '${color.blue}'
    );
  }

  Color _generateColor(String code) {
    return Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
  }
}