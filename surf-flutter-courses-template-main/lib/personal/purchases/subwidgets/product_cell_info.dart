import 'package:flutter/material.dart';
import '../../../common/appearance.dart';
import '../../../data/task.dart';

class ProductCellInfoWidget extends StatelessWidget {
  final ProductEntity product;

  const ProductCellInfoWidget({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(product.title, style: const TextStyle(fontSize: 14)), //fonts sizes are pretty strange :( mine look too small
        const Spacer(),
        Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
            child: Row(
              children: [
                Text(product.totalAmountString),
                const Spacer(),
                ProductCellPriceWidget(product: product)
              ],
            )
        )
      ],
    );
  }
}

class ProductCellPriceWidget extends StatelessWidget {
  final ProductEntity product;

  const ProductCellPriceWidget({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    if (product.sale > 0) {
      return Row(
        children: [
          Text(product.startPriceString, style: const TextStyle(decoration: TextDecoration.lineThrough, color: Appearance.secondaryForegroundColor)),
          const SizedBox(width: 18),
          Text(product.totalPriceString, style: const TextStyle(fontWeight: FontWeight.bold, color: Appearance.destructiveColor)),
        ],
      );
    } else {
      return Text(product.totalPriceString, style: const TextStyle(fontWeight: FontWeight.bold));
    }
  }
}