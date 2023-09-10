import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/theme_settings_color_scheme.dart';
import 'app_theme.dart';

class ThemeSettingsBottomSheet extends StatefulWidget {
  AppTheme theme;
  final schemes = [
    ThemeColorScheme('Схема 1', 'assets/color_scheme_1.svg'),
    ThemeColorScheme('Схема 2', 'assets/color_scheme_2.svg'),
    ThemeColorScheme('Схема 3', 'assets/color_scheme_3.svg')
  ];

  ThemeSettingsBottomSheet({super.key,required this.theme});

  @override
  State<StatefulWidget> createState() {
    return _ThemeSettingsBottomSheetState();
  }
}

class _ThemeSettingsBottomSheetState extends State<ThemeSettingsBottomSheet> {
  late AppTheme _theme;

  @override
  void initState() {
    super.initState();
    _theme = widget.theme;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 24, 20, 16),
          child: _makeHeader(),
        ),
        Expanded(
            child: Column(
              children: [
                _makeRadioRow(AppTheme.system),
                _makeRadioRow(AppTheme.light),
                _theme == AppTheme.light
                  ? ThemeSettingsColorSchemeWidget(schemes: widget.schemes)
                    : const SizedBox(),
                _makeRadioRow(AppTheme.dark),
                _theme == AppTheme.dark
                    ? ThemeSettingsColorSchemeWidget(schemes: widget.schemes)
                    : const SizedBox(),
              ],
            )
        )
      ],
    );
  }

  // it looks like we need to redraw the whole widget when theme changed, so it's okay to keep row as method ?
  Widget _makeRadioRow(AppTheme value) {
    return SizedBox(
        height: 56,
        child: Row(
          children: [
            const SizedBox(width: 5),
            Radio<AppTheme>(
              value: value,
              groupValue: _theme,
              onChanged: (AppTheme? value) {
                setState(() {
                  _theme = value ?? AppTheme.system;
                });
              },
            ),
            Text(value.name),
          ],
        )
    );
  }

  Widget _makeHeader() {
    return Row(
      children: [
        const Text('Тема оформления'),
        const Spacer(),
        SizedBox(
          height: 24,
          width: 24,
          child: IconButton(
            padding: EdgeInsets.zero,
            onPressed: (){ Navigator.pop(context); },
            icon: const Icon(Icons.close),
          ),
        ),
      ],
    );
  }
}