import 'package:flutter/material.dart';
import 'empty_screen.dart';
import 'personal/personal_screen.dart';
import 'tab_bar_widget.dart';
import 'personal/personal_tab_navigator.dart';


enum TabItem {
  catalog, search, cart, personal
}


void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MainAppState();
  }
}

class _MainAppState extends State<MainApp> {
  var _currentTab = TabItem.personal;
  final _navigatorKeys = {
    TabItem.catalog: GlobalKey<NavigatorState>(),
    TabItem.search: GlobalKey<NavigatorState>(),
    TabItem.cart: GlobalKey<NavigatorState>(),
    TabItem.personal: GlobalKey<NavigatorState>(),
  };
  final _tabs = [TabItem.catalog, TabItem.search, TabItem.cart, TabItem.personal];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Sora'),
      home: Scaffold(
          appBar: AppBar(
            title: Text('data'),
          ),
          body: Stack(children: _tabs.map((e) => _buildOffstageNavigator(e)).toList()),
          bottomNavigationBar: TabBarWidget(
            selectedIndex: _tabs.indexOf(_currentTab),
            onItemTapped: _onItemTapped
          )
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _currentTab = _tabs[index];
    });
  }

  Widget _buildOffstageNavigator(TabItem tab) {
    return Offstage(
      offstage: _currentTab != tab,
      child: ((){
        switch (tab) {
          case TabItem.personal:
            return PersonalTabNavigator(navigatorKey: _navigatorKeys[tab]);
          default:
            return const EmptyScreenWidget();
        }
      }())
    );
  }

}