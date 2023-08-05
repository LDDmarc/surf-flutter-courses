import 'dart:convert';
import 'package:flutter/services.dart';
import '../color_model.dart';

class ColorPaletteModel {

  Future<List<ColorModel>> getColors() async {
    final json = await _fetchJson();
    return json['colors'].map<ColorModel>((json) => ColorModel.fromJson(json)).toList();
  }

  Future<dynamic> _fetchJson() async {
    final jsonString = await rootBundle.loadString('assets/colors_list.json');
    return jsonDecode(jsonString);
  }

}
