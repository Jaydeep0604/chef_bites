import 'package:chef_bites/navigator/bottom_navigation.dart';
import 'package:chef_bites/navigator/tab_item.dart';
import 'package:chef_bites/navigator/tab_navigator.dart';
import 'package:chef_bites/ui/base/drawer.dart';
import 'package:flutter/material.dart';

class Base extends StatefulWidget {
  const Base({Key? key}) : super(key: key);
  static const String base   = "/base";

  static openDrawer(BuildContext context) {
    _BaseState? state = context.findAncestorStateOfType<_BaseState>();
    state?.openDrawer();
  }

  static getCurrentTab(BuildContext context) {
    _BaseState? state = context.findAncestorStateOfType<_BaseState>();
    return state?._currentTab;
  }

  static switchTab(BuildContext context, MyTabItem myTabItem) {
    _BaseState? state = context.findAncestorStateOfType<_BaseState>();
    state?._selectTab(myTabItem);
  }

  @override
  State<Base> createState() => _BaseState();
}

class _BaseState extends State<Base> {
  late GlobalKey<ScaffoldState> globalScaffoldKey;

 openDrawer() {
    globalScaffoldKey.currentState?.openDrawer();
  }

  getCurrentTab() {
    return _currentTab;
  }

  @override
  void initState() {
    // super.initState();
    globalScaffoldKey = GlobalKey<ScaffoldState>();
  }

  var _currentTab = MyTabItem.home;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final isFirstRouteInCurrentTab =
            !await navigatorKey[_currentTab]!.currentState!.maybePop();
        if (isFirstRouteInCurrentTab) {
          if (_currentTab == MyTabItem.home) {
            _selectTab(MyTabItem.home);
            return false;
          }
        }
        return isFirstRouteInCurrentTab;
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        // drawer: const CBDrawer(),
        key: globalScaffoldKey,
        body: Stack(
          children: [
            Container(
                child: MyTabItem.home == _currentTab
                    ? _buildOffsetNavigator(MyTabItem.home)
                    : MyTabItem.loyalty == _currentTab
                        ? _buildOffsetNavigator(MyTabItem.loyalty)
                        : MyTabItem.account == _currentTab
                            ? _buildOffsetNavigator(MyTabItem.account)
                            : _buildOffsetNavigator(MyTabItem.order))
          ],
        ),
        extendBody: true,
        bottomNavigationBar:
            BottomNavigation(currentTab: _currentTab, onSelectTab: _selectTab),
      ),
    );
  }

  Widget _buildOffsetNavigator(MyTabItem tabItem) {
    bool isOffset = _currentTab != tabItem;
    return TabNavigator(navigatorKey: navigatorKey[tabItem]!, tabItem: tabItem);
  }

  void _selectTab(MyTabItem tabItem) {
    if (tabItem == _currentTab) {
      navigatorKey[tabItem]!.currentState!.popUntil((route) => route.isFirst);
    } else {
      setState(() => _currentTab = tabItem);
    }
  }
}
