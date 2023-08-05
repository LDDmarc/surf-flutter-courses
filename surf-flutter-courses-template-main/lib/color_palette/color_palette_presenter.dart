import 'package:flutter/material.dart';
import 'color_palette_model.dart';
import 'package:surf_flutter_courses_template/color_model.dart';
import 'support/color_palette_view.dart';
import 'support/color_cell_presentation.dart';
import 'package:flutter/services.dart';

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

  void copyToClipBoard(String text) async {
    await Clipboard.setData(ClipboardData(text: text));
  }

  Future<ColorList> _getColors() async {
    final colors = await _loadColors();

    return colors
        .where((element) => element.value != null)
        .map((e) => ColorCellPresentation(
                      e.name,
                      e.value!,
                      _generateColor(e.value!)
                    )
    ).toList();
  }

  Future<List<ColorModel>> _loadColors() async {
    await Future.delayed(const Duration(seconds: 1));
    return await _colorPalette.getColors();
  }

  Color _generateColor(String code) {
    return Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
  }

}