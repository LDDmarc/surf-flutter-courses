import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

const double size = 100;

class AvatarWidget extends StatelessWidget {

  final String assetName;

  const AvatarWidget({super.key, required this.assetName});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: ClipOval(
        clipper: const MyOvalClipper(size),
        child: SvgPicture.asset(assetName),
      ),
    );
  }
}

class MyOvalClipper extends CustomClipper<Rect> {

  final double _size;

  const MyOvalClipper(this._size);

  @override
  Rect getClip(Size size) {
    var rect = Rect.fromLTWH(0.0, 0.0, _size, _size);
    return rect;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Rect> oldClipper) {
    return true;
  }
}