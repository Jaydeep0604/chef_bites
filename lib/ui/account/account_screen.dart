import 'package:chef_bites/navigator/tab_item.dart';
import 'package:chef_bites/ui/base/base.dart';
import 'package:chef_bites/ui/gift_cards/gift_cards_screen.dart';
import 'package:chef_bites/ui/help_and_support/help_and_support_screen.dart';
import 'package:chef_bites/ui/login/login_screen.dart';
import 'package:chef_bites/ui/loyalty/loyalty_screen.dart';
import 'package:chef_bites/ui/my_favorites/my_favorites_screen.dart';
import 'package:chef_bites/ui/order_history/order_history_screen.dart';
import 'package:chef_bites/ui/profile/my_profile_screen.dart';
import 'package:chef_bites/ui/refer_and_earn/refer_and_earn_screen.dart';
import 'package:chef_bites/ui/restaurant_feedback/restaurant_feedback_screen.dart';
import 'package:chef_bites/ui/settings/settings_screen.dart';
import 'package:chef_bites/ui/terms_and_condition/terms_and_condition_screen.dart';
import 'package:chef_bites/utils/app_colors.dart';
import 'package:chef_bites/utils/functions.dart';
import 'package:chef_bites/utils/route_transition.dart';
import 'package:chef_bites/widget/appbar/app_bar.dart';
import 'package:chef_bites/widget/appbar/common_appbar.dart';
import 'package:chef_bites/widget/drawer_list_tile_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);
  static const accountScreen = "/accounscreen";

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      appBar: CustomAppBarWithoutBgColor(
        context: context,
        child: CommonAppBar(
          isNeedCenterTitle: "",
          isNeedLeading: false,
          isNeedAction: false,
          leadingIcon: GestureDetector(
            onTap: () async {
              bool isPop = await navigatorKey[Base.getCurrentTab(context)]!
                  .currentState!
                  .maybePop();
              if (!isPop) {
                Base.switchTab(context, MyTabItem.home);
              }
            },
            child: Transform.scale(
              scale: 0.6,
              child: SvgPicture.asset(
                "assets/icons/back.svg",
              ),
            ),
          ),
        ),
      ),
      body: ScrollConfiguration(
        behavior: NoGlow(),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 175,
                width: MediaQuery.of(context).size.width,
                child: Stack(
                  children: [
                    Container(
                      height: 175,
                      width: MediaQuery.of(context).size.width,
                      color: AppColors.primaryColor,
                    ),
                    SizedBox(
                      height: 175,
                      width: MediaQuery.of(context).size.width,
                      child: Image.asset(
                        "assets/images/design.png",
                        fit: BoxFit.fill,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(
                          left: 20, bottom: 10, right: 20),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  "User Name",
                                  style: TextStyle(
                                      color: AppColors.whiteColor,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "Testmail@gmail.com",
                                  style: TextStyle(
                                      color: AppColors.whiteColor,
                                      fontSize: 12),
                                )
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                InkWell(
                                  onTap: () {
                                    globalNavigatorKey.currentState?.push(
                                      SlideRightRoute(
                                        page: const MyProfileScreen(),
                                        settings: const RouteSettings(
                                          name: MyProfileScreen.myProfileScreen,
                                        ),
                                      ),
                                    );
                                  },
                                  child: Column(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(50),
                                        child: SvgPicture.asset(
                                          "assets/icons/account_logo.svg",
                                          height: 68,
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      const Text(
                                        "My Profile",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                            color: AppColors.whiteColor),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                            child: InkWell(
                          onTap: () {
                            globalNavigatorKey.currentState?.push(
                                SlideRightRoute(
                                    page: const MyFavoritesScreen(),
                                    settings: const RouteSettings(
                                        name: MyFavoritesScreen
                                            .myFavoritesScreen)));
                          },
                          child: Container(
                            height: 81,
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: AppColors.offwhiteColor),
                                borderRadius: BorderRadius.circular(10)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SvgPicture.asset("assets/icons/favourite.svg"),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(
                                      left: 8, right: 8, bottom: 10),
                                  child: Text(
                                    "My Favorites",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        )),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                            child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        OrderHistoryScreen()));
                          },
                          child: Container(
                            height: 81,
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: AppColors.offwhiteColor),
                                borderRadius: BorderRadius.circular(10)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                    "assets/icons/order_history.svg"),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(
                                      left: 8, right: 8, bottom: 10),
                                  child: Text(
                                    "Orders History",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        )),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                            child: InkWell(
                          onTap: () {
                            globalNavigatorKey.currentState?.push(
                                SlideRightRoute(
                                    page: const SettingsScreen(),
                                    settings: const RouteSettings(
                                        name: SettingsScreen.settingsScreen)));
                          },
                          child: Container(
                            height: 81,
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: AppColors.offwhiteColor),
                                borderRadius: BorderRadius.circular(10)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SvgPicture.asset("assets/icons/settings.svg"),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(
                                      left: 8, right: 8, bottom: 10),
                                  child: Text(
                                    "Settings",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        )),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Divider(),
                    const SizedBox(
                      height: 10,
                    ),
                    DrawerListTile(
                      leading: "assets/icons/gif.svg",
                      title: "Gift Cards",
                      onTap: () {
                        globalNavigatorKey.currentState?.push(SlideRightRoute(
                            page: const GiftCardsScreen(),
                            settings: const RouteSettings(
                                name: GiftCardsScreen.giftCardsScreen)));
                      },
                    ),
                    DrawerListTile(
                      leading: "assets/icons/drawer_refer.svg",
                      title: "Refer & Earn",
                      onTap: () {
                        globalNavigatorKey.currentState?.push(SlideRightRoute(
                            page: const ReferAndEarnScreen(),
                            settings: const RouteSettings(
                                name: ReferAndEarnScreen.referAndEarnScreen)));
                      },
                    ),
                    DrawerListTile(
                      leading: "assets/icons/loyalty_point.svg",
                      title: "Reward/Loyalty Points",
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoyaltyScreen()));
                      },
                    ),
                    DrawerListTile(
                      leading: "assets/icons/feedback.svg",
                      title: "Restaurant Feedback",
                      onTap: () {
                        globalNavigatorKey.currentState?.push(SlideRightRoute(
                            page: const RestaurantFeedbackScreen(),
                            settings: const RouteSettings(
                                name: RestaurantFeedbackScreen
                                    .restaurantFeedbackScreen)));
                      },
                    ),
                    DrawerListTile(
                      leading: "assets/icons/terms_condition.svg",
                      title: "Terms & Conditions",
                      onTap: () {
                        globalNavigatorKey.currentState?.push(SlideRightRoute(
                            page: const TermsAndConditionScreen(),
                            settings: const RouteSettings(
                                name: TermsAndConditionScreen
                                    .termsAndConditionScreen)));
                      },
                    ),
                    DrawerListTile(
                      leading: "assets/icons/help_support.svg",
                      title: "Help & Support",
                      onTap: () {
                        globalNavigatorKey.currentState?.push(SlideRightRoute(
                            page: const HelpAndSupportScreen(),
                            settings: const RouteSettings(
                                name: HelpAndSupportScreen
                                    .helpAndSupportScreen)));
                      },
                    ),
                    DrawerListTile(
                      leading: "assets/icons/log_out.svg",
                      title: "Log Out",
                      onTap: () {
                        showLogoutDialog(context).then((value) {
                          if (value != null) {
                            if (value) {
                              //userStateContainerState.logOutUser().then((value) {
                              if (value) {
                                // sharedStore.closeSession();
                                // userStateContainerState.updateUser(
                                //     userResponseModel: null);
                                // userStateContainerState
                                //     .updateLoggedStatus(false)

                                Navigator.pushReplacementNamed(
                                  context,
                                  LoginScreen.loginScreen,
                                );
                              }
                              //});
                            }
                          }
                        });
                        // Navigator.pop(context);
                        // showLogoutDialog(context).then((value) {
                        //   if (value != null) {
                        //     if (value) {
                        //       //userStateContainerState.logOutUser().then((value) {
                        //       if (value) {
                        //         // sharedStore.closeSession();
                        //         // userStateContainerState.updateUser(
                        //         //     userResponseModel: null);
                        //         // userStateContainerState
                        //         //     .updateLoggedStatus(false)

                        //         Navigator.pushReplacementNamed(
                        //           context,
                        //           LoginScreen.loginScreen,
                        //         );
                        //       }
                        //       //});
                        //     }
                        //   }
                        // });
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<bool?> showLogoutDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15.0))),
        content: Container(
          decoration: BoxDecoration(),
          child: Stack(
            children: [
              Container(
                padding: EdgeInsets.only(top: 15),
                child: Text(
                  "Are you sure you want to logout",
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      ?.copyWith(color: AppColors.blackColor, fontSize: 16),
                ),
              ),
              Container(
                  padding: EdgeInsets.only(top: 70),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.only(left: 5, right: 14),
                          child: FlatButton(
                            minWidth: 400,
                            height: 40,
                            color: AppColors.offwhiteColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                            child: new Text(
                              "Cancel",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6
                                  ?.copyWith(
                                    color: AppColors.blackColor,
                                  ),
                            ),
                            onPressed: () {
                              Navigator.pop(context, false);
                            },
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.only(left: 5, right: 14),
                          child: FlatButton(
                            minWidth: 400,
                            height: 40,
                            color: AppColors.primaryColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                            child: Text(
                              "Logout",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6
                                  ?.copyWith(
                                    color: Colors.white,
                                  ),
                            ),
                            onPressed: () {
                              // if (context.read<NetworkBloc>().state
                              //     is ConnectionFailure) {
                              //   AvmToast.instance.showErrorMessage(
                              //       context, "${ApiConstant.NO_INTERNET}");
                              //   return;
                              // }
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(builder: (context)=> LoginScreen()),
                                  (route) => false,
                                );
                              // Navigator.pop(context, true);
                            },
                          ),
                        ),
                      ),
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
