import 'package:flutter/material.dart';
import 'theme_colors.dart';

extension BuildContextExt on BuildContext {

  ThemeColors get color => Theme.of(this).extension<ThemeColors>()!;

}