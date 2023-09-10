import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:surf_flutter_courses_template/build_context_extension.dart';

class ThemeColorScheme {
  final String title;
  final String image;

  ThemeColorScheme(this.title, this.image);
}

class ThemeSettingsColorSchemeWidget extends StatefulWidget {
  final List<ThemeColorScheme> schemes;

  const ThemeSettingsColorSchemeWidget({super.key, required this.schemes});

  @override
  State<StatefulWidget> createState() {
    return _ThemeSettingsColorSchemeWidgetState();
  }
}

class _ThemeSettingsColorSchemeWidgetState extends State<ThemeSettingsColorSchemeWidget> {

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
            padding: EdgeInsets.fromLTRB(16, 8, 16, 16),
          child: Text('Цветовая схема')
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: widget.schemes.map((e) => _ThemeColorSchemeWidget(
            title: e.title,
            image: e.image,
            onTap: () {  },
          )).toList()
        ),
        const SizedBox(height: 4),
      ],
    );
  }

}

class _ThemeColorSchemeWidget extends StatefulWidget {
  final String title;
  final String image;
  final VoidCallback onTap;

  const _ThemeColorSchemeWidget({super.key, required this.title, required this.image, required this.onTap});

  @override
  State<StatefulWidget> createState() {
    return _ThemeColorSchemeWidgetState();
  }

}

class _ThemeColorSchemeWidgetState extends State<_ThemeColorSchemeWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
      decoration: BoxDecoration(
      color: context.color.subviewColor,
      borderRadius: const BorderRadius.all(Radius.circular(6)),
    ),
    child: Padding(
      padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
      child: Column(
        children: [
          SvgPicture.asset(widget.image),
          const SizedBox(height: 4),
          Text(widget.title),
        ],
      ),
    )
    )
    );
  }
}