import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'appearance.dart';

class TabBarWidget extends StatefulWidget {
  const TabBarWidget({super.key});

  @override
  State<StatefulWidget> createState() {
    return _TabBarWidgetState();
  }
}

class _Tab {
  final String? text;
  final Widget? icon;
  final Widget? activeIcon;

  _Tab({this.text, this.icon, this.activeIcon});
}

class _TabBarWidgetState extends State<TabBarWidget> {
  int _selectedIndex = 3;

  List<_Tab> get _tabs => [
    _Tab(text: 'Каталог', icon: SvgPicture.asset('assets/tab_catalog.svg'), activeIcon: SvgPicture.asset('assets/tab_catalog_active.svg')),
    _Tab(text: 'Поиск', icon: SvgPicture.asset('assets/tab_search.svg'), activeIcon: SvgPicture.asset('assets/tab_search_active.svg')),
    _Tab(text: 'Корзина', icon: SvgPicture.asset('assets/tab_cart.svg'), activeIcon: SvgPicture.asset('assets/tab_cart_active.svg')),
    _Tab(text: 'Личное', icon: SvgPicture.asset('assets/tab_person.svg'), activeIcon: SvgPicture.asset('assets/tab_personal_active.svg')),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: _tabs.map((tab) =>
          BottomNavigationBarItem(icon: tab.icon!, label: tab.text, activeIcon: tab.activeIcon!)).toList(),
      currentIndex: _selectedIndex,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Appearance.accentColor,
      onTap: _onItemTapped,
    );
  }
}