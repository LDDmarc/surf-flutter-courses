import 'package:flutter/material.dart';
import 'personal_screen.dart';

enum _PersonalTabNavigatorRoute {
  personal, purchaseList
}

extension _PersonalTabNavigatorRouteExtension on _PersonalTabNavigatorRoute {
  String get routeName {
    switch (this) {
      case _PersonalTabNavigatorRoute.personal:
        return 'personal';
      case _PersonalTabNavigatorRoute.purchaseList:
        return 'purchaseList';
    }
  }
}

class PersonalTabNavigator extends StatelessWidget {
  final GlobalKey<NavigatorState>? navigatorKey;

  const PersonalTabNavigator({super.key, required this.navigatorKey});

  void _push(_PersonalTabNavigatorRoute route, BuildContext context) {
    final routeBuilders = _routeBuilders(context);

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => routeBuilders[route]!(context),
      ),
    );
  }

  Map<String, WidgetBuilder> _routeBuilders(BuildContext context) {
    return {
      _PersonalTabNavigatorRoute.personal.routeName: (context) => PersonalScreenWidget(
        onPurchaseHistoryTap: (){ _push(_PersonalTabNavigatorRoute.purchaseList, context); },
      )
    };
  }

  @override
  Widget build(BuildContext context) {
    final routeBuilders = _routeBuilders(context);

    return Navigator(
      key: navigatorKey,
      initialRoute: _PersonalTabNavigatorRoute.personal.routeName,
      onGenerateRoute: (routeSettings) {
        return MaterialPageRoute(
          builder: (context) => routeBuilders[routeSettings.name!]!(context),
        );
      },
    );
  }
}
