import 'package:flutter/material.dart';

class PersonalScreenWidget extends StatelessWidget {
  final void Function() onPurchaseHistoryTap;

  const PersonalScreenWidget({super.key, required this.onPurchaseHistoryTap});

  @override
  Widget build(BuildContext context) {
    return ListView(
        children: [
          PersonalScreenCellWidget(
              title: 'История покупок',
              onTap: onPurchaseHistoryTap
          ),
        ],
      );
  }
}

class PersonalScreenCellWidget extends StatelessWidget {
  final String title;
  final void Function() onTap;

  const PersonalScreenCellWidget({super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Text(title, style: const TextStyle(fontSize: 18)),
        onTap: onTap
    );
  }
}