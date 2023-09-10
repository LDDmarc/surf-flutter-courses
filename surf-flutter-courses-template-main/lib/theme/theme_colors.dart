import 'package:flutter/material.dart';

class ThemeColors extends ThemeExtension<ThemeColors> {
  final Color subviewColor;
  final Color accentColor;

  const ThemeColors({
    required this.subviewColor,
    required this.accentColor,
  });

  @override
  ThemeExtension<ThemeColors> copyWith({
    Color? descriptionTitleColor,
    Color? subviewColor,
    Color? accentColor
  }) {
    return ThemeColors(
        subviewColor: subviewColor ?? this.subviewColor,
        accentColor: accentColor ?? this.accentColor
    );
  }

  @override
  ThemeExtension<ThemeColors> lerp(
      ThemeExtension<ThemeColors>? other,
      double t,
      ) {
    if (other is! ThemeColors) {
      return this;
    }

    return ThemeColors(
        subviewColor: Color.lerp(subviewColor, other.subviewColor, t)!,
        accentColor: Color.lerp(accentColor, other.accentColor, t)!,
    );
  }

  static get lightOne => const ThemeColors(
    subviewColor: Color(0xFFFAFAFA),
    accentColor: Color(0xFF6DD902),
  );

}