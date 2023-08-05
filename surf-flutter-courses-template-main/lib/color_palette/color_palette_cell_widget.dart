import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/color_palette/support/color_cell_presentation.dart';

class ColorPaletteCellWidget extends StatefulWidget {
  final ColorCellPresentation cellPresentation;
  ColorPaletteCellWidget({super.key, required this.cellPresentation});

  @override
  State<ColorPaletteCellWidget> createState() => _ColorPaletteCellWidgetState(cellPresentation: cellPresentation);
}

class _ColorPaletteCellWidgetState extends State<ColorPaletteCellWidget> {
  ColorCellPresentation cellPresentation;
  double _scale = 1;

  _ColorPaletteCellWidgetState({required this.cellPresentation});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: _makeCell(cellPresentation),
      onTap: () {

      },
      onLongPress: () {
        setState(() {
          _scale = 0.7;
        });
      },
    );
  }

  Widget _makeCell(ColorCellPresentation cellPresentation) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(child:
        Transform.scale(
            scale: _scale,
            child:  _makeColoredBox(cellPresentation.color)
        )
        ),
        const SizedBox(height: 8),
        Text(cellPresentation.title, maxLines: 1, overflow: TextOverflow.ellipsis),
        Text(cellPresentation.subtitle, maxLines: 1, overflow: TextOverflow.ellipsis)
      ],
    );
  }

  Widget _makeColoredBox(Color color) {
    return AspectRatio(
      aspectRatio: 1,
      child: Container(
        decoration: BoxDecoration(
            color: color,
            borderRadius: const BorderRadius.all(Radius.circular(16))
        ),
      ),
    );
  }
}
