import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/data/data.dart';

class PurchaseHistoryScreenWidget extends StatelessWidget {
  final void Function(Cheque) onChequeTap;
  final _cheques = testData;

  PurchaseHistoryScreenWidget({super.key, required this.onChequeTap});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
      children: _cheques.map((e) => PurchaseHistoryScreenCellWidget(
        title: e.title,
        onTap: (){ onChequeTap(e); }
      )).toList()
      )
    );
  }
}

class PurchaseHistoryScreenCellWidget extends StatelessWidget {
  final String title;
  final void Function() onTap;

  const PurchaseHistoryScreenCellWidget({super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Text(title, style: const TextStyle(fontSize: 18)),
        onTap: onTap
    );
  }
}