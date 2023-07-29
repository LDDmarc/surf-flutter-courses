import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/data/task.dart';

class ProductCellWidget extends StatelessWidget {
  final ProductEntity product;

  const ProductCellWidget({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          makeImage(product.imageUrl),
          makeProductInfo()
        ],
      ),
    );
  }
  
  Widget makeImage(String url) {
    return SizedBox.square(
      dimension: 68,
      child: Image.network(
        url,
        fit: BoxFit.cover,
        loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
          // todo: mock image
          return Center(child: child);
        },
      ),
    );
  }

  Widget makeProductInfo() {
    return Column(
      children: [
        Text('gurf'),
        Text('gurf')
      ],
    );
  }

}