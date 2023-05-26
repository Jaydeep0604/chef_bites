import 'package:chef_bites/ui/account/account_screen.dart';
import 'package:chef_bites/ui/address/address_screen.dart';
import 'package:chef_bites/ui/base/base.dart';
import 'package:chef_bites/ui/home/home_screen.dart';
import 'package:chef_bites/ui/login/login_screen.dart';
import 'package:chef_bites/ui/loyalty/loyalty_screen.dart';
import 'package:chef_bites/ui/order/order_screen.dart';
import 'package:chef_bites/ui/profile/my_profile_screen.dart';
import 'package:chef_bites/ui/splash/splash_screen.dart';
import 'package:flutter/material.dart';

class CBRoute {
  static Map<String, WidgetBuilder> genrateRoute(
      BuildContext context, int index, RouteSettings settings) {
    Map<int, Widget> routeName = {
      0: HomeScreen(),
      1: LoyaltyScreen(),
      2: AccountScreen(),
      3: OrderScreen()
    };
    return {
      HomeScreen.homeScreen: (context) => routeName[index]!,
      LoyaltyScreen.loyaltyScreen: (context) => routeName[index]!,
      AccountScreen.accountScreen: (context) => routeName[index]!,
      OrderScreen.orderScreen: (context) => routeName[index]!
    };
  }

  static Route<dynamic> genrateGlobleRoute(RouteSettings settings) {
    switch (settings.name) {
      case SplashScreen.splashScreen:
        return MaterialPageRoute(
            builder: (context) => SplashScreen(), settings: settings);
      case AddressScreen.addressScreen:
        return MaterialPageRoute(
            builder: (context) => AddressScreen(), settings: settings);
      case Base.base:
        return MaterialPageRoute(
            builder: (context) => Base(), settings: settings);
      case AccountScreen.accountScreen:
        return MaterialPageRoute(
            builder: (context) => AccountScreen(), settings: settings);
      case LoginScreen.loginScreen:
        return MaterialPageRoute(
            builder: (context) => LoginScreen(), settings: settings);
      case MyProfileScreen.myProfileScreen:
        return MaterialPageRoute(
            builder: (context) => MyProfileScreen(), settings: settings);
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text("No Route defined for ${settings.name}")),
                ));
    }
  }
}
