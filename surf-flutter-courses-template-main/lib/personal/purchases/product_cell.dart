import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:surf_flutter_courses_template/common/appearance.dart';
import 'package:surf_flutter_courses_template/data/task.dart';
import 'package:surf_flutter_courses_template/personal/purchases/subwidgets/product_cell_image.dart';
import 'package:surf_flutter_courses_template/personal/purchases/subwidgets/product_cell_info.dart';

class ProductCellWidget extends StatelessWidget {
  final ProductEntity product;

  const ProductCellWidget({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          const SizedBox(height: 16),
          Row(
            children: [
              ProductCellImageWidget(url: product.imageUrl),
              const SizedBox(width: 12),
              Expanded(child:
                SizedBox(
                  height: 68,
                  child: ProductCellInfoWidget(product: product)
                )
              )
            ],
          ),
          const SizedBox(height: 16),
        ],
      );
  }
}