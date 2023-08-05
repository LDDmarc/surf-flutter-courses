import 'package:flutter/material.dart';
import 'color_palette_model.dart';
import 'package:surf_flutter_courses_template/color_model.dart';
import 'support/color_palette_view.dart';
import 'support/color_cell_presentation.dart';
import 'package:flutter/services.dart';

class ColorPalettePresenter {
  final _colorPalette = ColorPaletteModel();
  List<ColorModel>? _colorModels;
  late final ColorPaletteView? _view;

  final void Function(ColorModel) onShowColor;

  ColorPalettePresenter({required this.onShowColor});

  void setView(ColorPaletteView view) {
    _view = view;
    _update();
  }

  Future<List<ColorModel>> _loadColors() async {
    await Future.delayed(const Duration(seconds: 1));
    return await _colorPalette.getColors();
  }

  void onTapItemAt({required int index }) {
    final model = _colorModels?[index];
    if (model != null) {
      onShowColor(model);
    }
  }

  void onLongTapItemAt({required int index }) async {
    final text = _colorModels?[index].value;
    if ( text != null) {
      await Clipboard.setData(ClipboardData(text: text));
    }
  }

  void _update() {
    _view?.updateData(_getColors());
  }

  Future<ColorList> _getColors() async {
    final colors = await _loadColors();
    final sortedColors = colors.where((element) => element.value != null).toList();
    _colorModels = sortedColors;

    return sortedColors
        .map((e) => ColorCellPresentation(
                      e.name,
                      e.value!,
                      _generateColor(e.value!)
                    )
    ).toList();
  }

  Color _generateColor(String code) {
    return Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
  }

}