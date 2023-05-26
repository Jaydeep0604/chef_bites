import 'dart:math';
import 'package:chef_bites/model/loyalty_model.dart';
import 'package:chef_bites/navigator/tab_item.dart';
import 'package:chef_bites/ui/account/account_screen.dart';
import 'package:chef_bites/ui/profile/my_profile_screen.dart';
import 'package:chef_bites/utils/app_colors.dart';
import 'package:chef_bites/utils/functions.dart';
import 'package:chef_bites/widget/appbar/app_bar.dart';
import 'package:chef_bites/widget/appbar/common_appbar.dart';
import 'package:chef_bites/widget/loyalty_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../base/base.dart';

class LoyaltyScreen extends StatefulWidget {
  const LoyaltyScreen({Key? key}) : super(key: key);
  static const loyaltyScreen = "/loyaltyscreen";

  @override
  State<LoyaltyScreen> createState() => _LoyaltyScreenState();
}

class _LoyaltyScreenState extends State<LoyaltyScreen> {
  RangeValues values = RangeValues(0, 3505);
  double _currentRangeValues = 1705;
  int _max = 3505;
  int _min = 0;

  List<LoyaltyModel> latestDealList = [
    LoyaltyModel(
        id: "1",
        imgUrl: "assets/images/latest1.1.png",
        liked: false,
        title: "Get a free drink when you purchase 2 sushi rolls!",
        validOn: "all"),
    LoyaltyModel(
        id: "1",
        imgUrl: "assets/images/latest1.2.png",
        liked: false,
        title: "Get a free drink when you purchase 2 sushi rolls!",
        validOn: "all"),
    LoyaltyModel(
        id: "1",
        imgUrl: "assets/images/latest1.3.png",
        liked: false,
        title: "Get a free drink when you purchase 2 sushi rolls!",
        validOn: "all"),
    LoyaltyModel(
        id: "1",
        imgUrl: "assets/images/latest1.4.png",
        liked: false,
        title: "Get a free drink when you purchase 2 sushi rolls!",
        validOn: "all"),
  ];
  List<LoyaltyModel> latestDealList2 = [
    LoyaltyModel(
        id: "1",
        imgUrl: "assets/images/latest2.1.png",
        liked: false,
        title: "Get a free drink when you purchase 2 sushi rolls!",
        validOn: "all"),
    LoyaltyModel(
        id: "1",
        imgUrl: "assets/images/latest2.2.png",
        liked: false,
        title: "Get a free drink when you purchase 2 sushi rolls!",
        validOn: "all"),
    LoyaltyModel(
        id: "1",
        imgUrl: "assets/images/latest1.1.png",
        liked: false,
        title: "Get a free drink when you purchase 2 sushi rolls!",
        validOn: "all"),
    LoyaltyModel(
        id: "1",
        imgUrl: "assets/images/latest2.3.png",
        liked: false,
        title: "Get a free drink when you purchase 2 sushi rolls!",
        validOn: "all"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWithBgColor(
        context: context,
        child: CommonAppBar(
          isNeedCenterTitle: "Loyalty",
          isNeedLeading: false,
          isNeedAction: true,
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
              scale: 0.7,
              child: SvgPicture.asset(
                "assets/icons/back.svg",
              ),
            ),
          ),
          action: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AccountScreen(),
                ),
              );
              // Navigator.pushNamed(context, MyProfileScreen.myProfileScreen);
              // navigatorKey[Base.getCurrentTab(context)]
              //             ?.currentState
              //             ?.pushNamed(MyProfileScreen.myProfileScreen);
            },
            child: Transform.scale(
              scale: 0.5,
              child: SvgPicture.asset(
                "assets/icons/profile.svg",
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
              Container(
                height: 102,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  color: AppColors.primaryColor,
                  image: DecorationImage(
                    image: AssetImage(
                      "assets/images/loyalty_design.png",
                    ),
                    fit: BoxFit.fill,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Welcome Back John!",
                        style: TextStyle(
                            color: AppColors.blackColor,
                            fontSize: 26,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "How can we help you today?",
                        style: TextStyle(
                          color: AppColors.whiteColor,
                          fontSize: 16,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                child: SizedBox(
                  //width: MediaQuery.of(context).size.width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Your loyalty status...",
                        style: TextStyle(fontSize: 14),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 30,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            SvgPicture.asset(
                              "assets/icons/loyalty_point.svg",
                              height: 30,
                              color: AppColors.primaryColor,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "1705",
                              style: TextStyle(
                                  fontSize: 26, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Rewards points",
                              style: TextStyle(fontSize: 14),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Row(
                          children: [
                            Text(
                              "${_min}",
                              style: TextStyle(
                                  fontSize: 10, color: AppColors.blackColor),
                            ),
                            Spacer(),
                            Text(
                              "${_max}",
                              style: TextStyle(
                                  fontSize: 10, color: AppColors.blackColor),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset("assets/icons/range.svg"),
                          Expanded(
                            child: Slider(
                              value: _currentRangeValues,
                              max: 3505,
                              activeColor: AppColors.primaryColor,
                              inactiveColor: AppColors.offwhiteColor,
                              divisions: max(0, 3505),
                              label: _currentRangeValues.round().toString(),
                              onChanged: (double value) {
                                setState(() {
                                  _currentRangeValues = value;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                      Text(
                        "You’re off the charts! Start using these rewards points",
                        style: TextStyle(fontSize: 12),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Divider(),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Row(
                  children: [
                    const Text(
                      "Check out our latest deals...",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                            onTap: () {
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) =>
                              //             CategoriesScreen()));
                            },
                            child: const Text(
                              "See all",
                              style: TextStyle(
                                  fontSize: 14, color: AppColors.primaryColor),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 227,
                child: ListView.separated(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  scrollDirection: Axis.horizontal,
                  itemCount: latestDealList.length,
                  itemBuilder: (context, index) {
                    return LoyaltyWidget(loyaltyModel: latestDealList[index]);
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(
                      width: 4,
                    );
                  },
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Row(
                  children: [
                    const Text(
                      "Check out our latest deals...",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                            onTap: () {
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) =>
                              //             CategoriesScreen()));
                            },
                            child: const Text(
                              "See all",
                              style: TextStyle(
                                  fontSize: 14, color: AppColors.primaryColor),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 227,
                child: ListView.separated(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  scrollDirection: Axis.horizontal,
                  itemCount: latestDealList2.length,
                  itemBuilder: (context, index) {
                    return LoyaltyWidget(loyaltyModel: latestDealList2[index]);
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(
                      width: 4,
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 60,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
