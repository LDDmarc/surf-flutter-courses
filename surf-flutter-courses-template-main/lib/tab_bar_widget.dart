import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'appearance.dart';

class _Tab {
  final String? text;
  final Widget? icon;
  final Widget? activeIcon;

  _Tab({this.text, this.icon, this.activeIcon});
}

class TabBarWidget extends StatelessWidget {
  final int selectedIndex;
  final void Function(int) onItemTapped;

  List<_Tab> get _tabs => [
    _Tab(text: 'Каталог', icon: SvgPicture.asset('assets/tab_catalog.svg'), activeIcon: SvgPicture.asset('assets/tab_catalog_active.svg')),
    _Tab(text: 'Поиск', icon: SvgPicture.asset('assets/tab_search.svg'), activeIcon: SvgPicture.asset('assets/tab_search_active.svg')),
    _Tab(text: 'Корзина', icon: SvgPicture.asset('assets/tab_cart.svg'), activeIcon: SvgPicture.asset('assets/tab_cart_active.svg')),
    _Tab(text: 'Личное', icon: SvgPicture.asset('assets/tab_person.svg'), activeIcon: SvgPicture.asset('assets/tab_personal_active.svg')),
  ];

  const TabBarWidget({super.key, required this.selectedIndex, required this.onItemTapped});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Appearance.backgroundColor,
          border: Border(top: BorderSide(color: Appearance.separatorColor, width: 1.0))
      ),
      child: BottomNavigationBar(
          items: _tabs.map((tab) => BottomNavigationBarItem(icon: tab.icon!, label: tab.text, activeIcon: tab.activeIcon!)).toList(),
          currentIndex: selectedIndex,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Appearance.backgroundColor,
          selectedItemColor: Appearance.accentColor,
          selectedFontSize: 10,
          unselectedFontSize: 10,
          onTap: onItemTapped
      ),
    );
  }
}
