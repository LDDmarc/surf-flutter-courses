import 'package:flutter/material.dart';
import 'appearance.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final String? subtitle;
  final bool isBackButtonHidden;

  const CustomAppBar({super.key, required this.title, this.subtitle, required this.isBackButtonHidden});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Appearance.backgroundColor,
      leading: ((){
        if (!isBackButtonHidden) {
          return const BackButton(
          color: Appearance.accentColor,
        );
        }
      }()),
      title: ((){
        if (subtitle != null) {
          return Column(
            children: [
              Text(title, style: const TextStyle(color: Appearance.primaryForegroundColor, fontWeight: FontWeight.bold)),
              Text(subtitle!, style: const TextStyle(color: Appearance.iconColor, fontSize: 10))
            ],
          );
        } else {
          return Text(title, style: const TextStyle(color: Appearance.primaryForegroundColor, fontWeight: FontWeight.bold));
        }
      }()),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);

}