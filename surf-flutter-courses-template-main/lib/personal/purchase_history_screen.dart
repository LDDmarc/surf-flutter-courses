import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/tab_bar_widget.dart';

class PurchaseHistoryScreenWidget extends StatelessWidget {
  const PurchaseHistoryScreenWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
    body: ListView(
      children: [
        PurchaseHistoryScreenCellWidget(
            title: 'Чек №1',
            onTap: (){}
        ),
        PurchaseHistoryScreenCellWidget(
            title: 'Чек №2',
            onTap: (){}
        ),
      ],
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