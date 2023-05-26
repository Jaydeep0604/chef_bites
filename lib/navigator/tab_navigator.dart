import 'package:chef_bites/navigator/route.dart';
import 'package:chef_bites/navigator/tab_item.dart';
import 'package:flutter/material.dart';

class TabNavigator extends StatelessWidget {
  const TabNavigator(
      {Key? key, required this.navigatorKey, required this.tabItem})
      : super(key: key);
  final GlobalKey<NavigatorState> navigatorKey;
  final MyTabItem tabItem;
  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      initialRoute: "/",
      onGenerateRoute: (RouteSettings) {
        return MaterialPageRoute(
            builder: (context) => CBRoute.genrateRoute(context, tabItem.index,
                RouteSettings)[RouteSettings.name]!(context),
            settings: RouteSettings);
      },
    );
  }
}
