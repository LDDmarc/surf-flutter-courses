import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProductCellImageWidget extends StatelessWidget {
  final String url;

  const ProductCellImageWidget({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
        dimension: 68,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.network(
            url,
            fit: BoxFit.cover,
            loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
              if (loadingProgress == null) return child;
              return Container(
                  width: 24,
                  height: 24,
                  alignment: Alignment.center,
                  child: SvgPicture.asset('assets/product_empty_icon.svg', fit: BoxFit.cover)
              );
            },
          ),
        )
    );
  }
}