import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/data/data.dart';

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
      appBar: AppBar(),
      body: Center(
        child: Text(cheque.title),
      )
    );
  }
}

// class PurchaseHistoryScreenCellWidget extends StatelessWidget {
//   final String title;
//   final void Function() onTap;
//
//   const PurchaseHistoryScreenCellWidget({super.key, required this.title, required this.onTap});
//
//   @override
//   Widget build(BuildContext context) {
//     return ListTile(
//         title: Text(title, style: const TextStyle(fontSize: 18)),
//         onTap: onTap
//     );
//   }
// }