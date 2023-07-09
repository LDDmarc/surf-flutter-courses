import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/appearance.dart';

class InfoWidget extends StatelessWidget {

  final String title;
  final String description;

  const InfoWidget({super.key, required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Appearence.titleStyle,
          ),
          const SizedBox(height: 4),
          Text(
              description,
              style: Appearence.textStyle
          )
        ]);
  }
}