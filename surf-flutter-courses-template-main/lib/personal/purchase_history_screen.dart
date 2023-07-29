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
      body: ListView.builder(
          itemCount: _cheques.length,
          itemBuilder: (BuildContext context, int index) {
            final cheque = _cheques[index];
              return PurchaseHistoryScreenCellWidget(
                title: cheque.title,
                subtitle: cheque.date.toString(),
                onTap: (){ onChequeTap(cheque); }
              );
          }
      ),
    );
  }
}

class PurchaseHistoryScreenCellWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final void Function() onTap;

  const PurchaseHistoryScreenCellWidget({super.key, required this.title, required this.subtitle, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Text(title, style: const TextStyle(fontSize: 18)),
        subtitle: Text(subtitle),
        onTap: onTap
    );
  }


}

