import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/color_palette/support/color_cell_presentation.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ColorPaletteCellWidget extends StatefulWidget {
  final ColorCellPresentation cellPresentation;
  final void Function() onTap;
  final void Function() onLongTap;

  const ColorPaletteCellWidget({
    super.key,
    required this.cellPresentation,
    required this.onTap,
    required this.onLongTap
  });

  @override
  State<ColorPaletteCellWidget> createState() => _ColorPaletteCellWidgetState(
      cellPresentation: cellPresentation,
      onTap: onTap,
      onLongTap: onLongTap
  );
}

class _ColorPaletteCellWidgetState extends State<ColorPaletteCellWidget> with SingleTickerProviderStateMixin {
  ColorCellPresentation cellPresentation;
  final void Function() onTap;
  final void Function() onLongTap;

  double _scale = 1;
  bool _isNeedToShowCopySymbol = false;
  late AnimationController _controller;

  _ColorPaletteCellWidgetState({
    required this.cellPresentation,
    required this.onTap,
    required this.onLongTap
  });

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
      lowerBound: 0.0,
      upperBound: 0.1,
    )..addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _scale = 1 - _controller.value;
    return GestureDetector(
      onTapDown: (_) { _controller.forward(); },
      onTapUp: (_) { _controller.reverse(); },
      onTap: onTap,
      onLongPress: () {
        // после вызова 'onLongPress' 'onTapUp' уже не вызывается 😩
        // если убрать тут вызов _controller.reverse() - то вьюха не расшринкнется
        // непонятно, как сделать так, чтобы если юзер оставил палец на экране,
        // то и вьюха осталась в сжатом состоянии
        _controller.reverse();
        onLongTap();
        _showCopiedSymbol();
        },
      child: _makeCell(cellPresentation),
    );
  }

  Widget _makeCell(ColorCellPresentation cellPresentation) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
            child: Transform.scale(
                scale: _scale,
                child:  _makeColoredBox(cellPresentation.color)
            )
        ),
        const SizedBox(height: 8),
        Text(cellPresentation.title, maxLines: 1, overflow: TextOverflow.ellipsis),
        const SizedBox(height: 4),
        Row(
          children: [
            Text(cellPresentation.subtitle, maxLines: 1, overflow: TextOverflow.ellipsis),
            const SizedBox(width: 4),
            Visibility(
                visible: _isNeedToShowCopySymbol,
                child: SvgPicture.asset('assets/copied_to_clipboard.svg'),
            )
          ],
        )
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

  void _showCopiedSymbol() {
    setState(() {
      _isNeedToShowCopySymbol = true;
    });
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        setState(() {
          _isNeedToShowCopySymbol = false;
        });
      }
    });
  }
}