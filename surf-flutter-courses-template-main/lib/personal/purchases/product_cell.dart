import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/appearance.dart';
import 'package:surf_flutter_courses_template/data/task.dart';

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
              _makeImage(product.imageUrl),
              const SizedBox(width: 12),
              Expanded(child:
                SizedBox(
                  height: 68,
                  child: _makeProductInfo(product),
                )
              )
            ],
          ),
          const SizedBox(height: 16),
        ],
      );
  }
  
  Widget _makeImage(String url) {
    return SizedBox.square(
      dimension: 68,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.network(
                url,
                fit: BoxFit.cover,
        // loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
        //   // todo: mock image
        //   return Center(child: child);
        // },,
           ),
      )
    );
  }

  Widget _makeProductInfo(ProductEntity product) {
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
            _makeProductPrice(product)
          ],
        )
        )
      ],
    );
  }

  Widget _makeProductPrice(ProductEntity product) {
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