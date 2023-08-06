import 'package:flutter/material.dart';

class ThemeColors extends ThemeExtension<ThemeColors> {
  final Color descriptionTitleColor;
  final Color subviewColor;

  const ThemeColors({
    required this.descriptionTitleColor,
    required this.subviewColor,
  });

  @override
  ThemeExtension<ThemeColors> copyWith({
    Color? descriptionTitleColor,
    Color? subviewColor,
  }) {
    return ThemeColors(
        descriptionTitleColor: descriptionTitleColor ?? this.descriptionTitleColor,
        subviewColor: subviewColor ?? this.subviewColor
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
        descriptionTitleColor: Color.lerp(descriptionTitleColor, other.descriptionTitleColor, t)!,
        subviewColor: Color.lerp(subviewColor, other.subviewColor, t)!,
    );
  }

  static get lightOne => const ThemeColors(
    descriptionTitleColor: Color(0xFF77767B),
    subviewColor: Color(0xFFFAFAFA),
  );

}