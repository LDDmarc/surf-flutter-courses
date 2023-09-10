import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/data/data.dart';
import 'personal_screen.dart';
import 'purchase_history_screen.dart';
import 'package:surf_flutter_courses_template/personal/purchases/product_list_screen.dart';

enum _PersonalTabNavigatorRoute {
  personal, purchaseList, detailCheque
}

extension _PersonalTabNavigatorRouteExtension on _PersonalTabNavigatorRoute {
  String get routeName {
    switch (this) {
      case _PersonalTabNavigatorRoute.personal:
        return 'personal';
      case _PersonalTabNavigatorRoute.purchaseList:
        return 'purchaseList';
      case _PersonalTabNavigatorRoute.detailCheque:
        return 'detailCheque';
    }
  }
}

class PersonalTabNavigator extends StatelessWidget {
  final GlobalKey<NavigatorState>? navigatorKey;

  const PersonalTabNavigator({super.key, required this.navigatorKey});

  void _push(_PersonalTabNavigatorRoute route, Object? parameter, BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => _makeWidget(route, parameter, context)
      ),
    );
  }

  Widget _makeWidget(_PersonalTabNavigatorRoute route, Object? parameter, BuildContext context) {
    switch (route) {
      case _PersonalTabNavigatorRoute.personal:
        return PersonalScreenWidget( onPurchaseHistoryTap: (){ _push(_PersonalTabNavigatorRoute.purchaseList, null, context); } );
      case _PersonalTabNavigatorRoute.purchaseList:
        return PurchaseHistoryScreenWidget( onChequeTap: (cheque){ _push(_PersonalTabNavigatorRoute.detailCheque, cheque, context); } );
      case _PersonalTabNavigatorRoute.detailCheque:
        final cheque = parameter as Cheque;
        return ProductListScreenWidget(cheque: cheque);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      initialRoute: _PersonalTabNavigatorRoute.personal.routeName,
      onGenerateRoute: (routeSettings) {
        return MaterialPageRoute(
          builder: (context) => _makeWidget(_PersonalTabNavigatorRoute.personal, null, context)
        );
      },
    );
  }
}
