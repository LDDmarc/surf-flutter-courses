import 'package:flutter/material.dart';
import 'color_palette_model.dart';
import 'package:surf_flutter_courses_template/color_model.dart';
import 'support/color_palette_view.dart';
import 'support/color_cell_presentation.dart';

class ColorPalettePresenter {
  final _colorPalette = ColorPaletteModel();
  late final ColorPaletteView? _view;

  void setView(ColorPaletteView view) {
    _view = view;
    update();
  }

  void update() {
    _view?.updateData(_getColors());
  }

  Future<ColorList> _getColors() async {
    final colors = await _loadColors();

    return colors
        .where((element) => element.value != null)
        .map((e) => ColorCellPresentation(
                      e.name,
                      e.value!,
                      Color(0xFFFF0000)
                    )
    ).toList();
  }

  Future<List<ColorModel>> _loadColors() async {
    await Future.delayed(const Duration(seconds: 1));
    return await _colorPalette.getColors();
  }

}