import 'package:flutter/material.dart';

enum MyTabItem { home, loyalty, account, order }
const Map<MyTabItem, String> tabName = {
  MyTabItem.home: 'home',
  MyTabItem.loyalty: 'loyalty',
  MyTabItem.account: 'account',
  MyTabItem.order: 'order'
};
final navigatorKey = {
  MyTabItem.home: GlobalKey<NavigatorState>(debugLabel: 'home'),
  MyTabItem.loyalty: GlobalKey<NavigatorState>(debugLabel: 'loyalty'),
  MyTabItem.account: GlobalKey<NavigatorState>(debugLabel: 'account'),
  MyTabItem.order: GlobalKey<NavigatorState>(debugLabel: 'order')
};
final globalNavigatorKey=GlobalKey<NavigatorState>();