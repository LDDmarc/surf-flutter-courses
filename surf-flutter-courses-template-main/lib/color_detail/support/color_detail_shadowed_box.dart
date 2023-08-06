import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ColorDetailShadowedBox extends StatefulWidget {
  String title;
  String value;
  final void Function() onTap;

  ColorDetailShadowedBox({super.key, required this.title, required this.value, required this.onTap});

  @override
  State<ColorDetailShadowedBox> createState() => _ColorDetailShadowedBoxState(title: title, value: value, onTap: onTap);
}

class _ColorDetailShadowedBoxState extends State<ColorDetailShadowedBox> {
  String title;
  String value;
  final void Function() onTap;
  bool _isNeedToShowCopySymbol = false;

  _ColorDetailShadowedBoxState({required this.title, required this.value, required this.onTap});

  @override
  Widget build(BuildContext context) {
      return _makeShadowedRow(title, value);
  }

  Widget _makeShadowedRow(String title, String value) {
    return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(16)),
          boxShadow: [
            BoxShadow(
              color: Color(0xFF252838).withOpacity(0.08),
              blurRadius: 6,
              offset: const Offset(0, 12), // changes position of shadow
            ),
          ],
        ),
        child: Padding(
            padding: const EdgeInsets.all(16),
            child: GestureDetector(
              onTap: () {
                onTap();
                _showCopiedSymbol();
              },
              child: Row(
                children: [
                  Expanded(child: Text(title, style: const TextStyle(fontSize: 16), maxLines: 1, overflow: TextOverflow.ellipsis)),
                  const SizedBox(width: 4),
                  Text(value, style: const TextStyle(fontSize: 16)),
                  const SizedBox(width: 4),
                  Visibility(
                    visible: _isNeedToShowCopySymbol,
                    child: SvgPicture.asset('assets/copied_to_clipboard.svg'),
                  )
                ],
              ),
            )
        )
    );
  }

  void _showCopiedSymbol() {
    setState(() {
      _isNeedToShowCopySymbol = true;
    });
    Future.delayed(const Duration(seconds: 1), () {
      if (mounted) {
        setState(() {
          _isNeedToShowCopySymbol = false;
        });
      }
    });
  }

}