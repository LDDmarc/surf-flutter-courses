import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/appearance.dart';
import 'package:surf_flutter_courses_template/data/data.dart';
import 'package:surf_flutter_courses_template/personal/purchases/product_cell.dart';

class ProductListScreenWidget extends StatefulWidget {
  final Cheque cheque;

  const ProductListScreenWidget({super.key, required this.cheque});

  @override
  State<StatefulWidget> createState() {
    return _ProductListScreenState(cheque);
  }
}

class _ProductListScreenState extends State<ProductListScreenWidget> {
  final Cheque cheque;

  _ProductListScreenState(this.cheque);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: BackButton(
          color: Appearance.accentColor,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: ListView.builder(
        itemCount: cheque.productList.length,
        itemBuilder: (BuildContext context, int index) {
          return ProductCellWidget(product: cheque.productList[index]);
        }
      )
      )
    );
  }
}
