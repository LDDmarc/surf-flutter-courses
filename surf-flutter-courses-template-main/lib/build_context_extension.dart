import 'package:flutter/material.dart';
import 'theme/theme_colors.dart';

extension BuildContextExt on BuildContext {

  ThemeColors get color => Theme.of(this).extension<ThemeColors>()!;

  TextTheme get textTheme => Theme.of(this).textTheme;

}