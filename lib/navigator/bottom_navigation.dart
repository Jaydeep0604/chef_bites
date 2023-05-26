import 'package:chef_bites/navigator/tab_item.dart';
import 'package:chef_bites/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BottomNavigation extends StatelessWidget {
  BottomNavigation(
      {Key? key, required this.currentTab, required this.onSelectTab})
      : super(key: key);
  MyTabItem currentTab;
  final ValueChanged<MyTabItem> onSelectTab;

  Widget build(BuildContext context) {
    return CustomPaint(
      child: Container(
        height: 70,
        decoration: BoxDecoration(
            color: AppColors.whiteColor,
            boxShadow: [
              BoxShadow(
                  blurRadius: 5, color: AppColors.shodowColor.withOpacity(0.2))
            ],
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                  flex: 1,
                  child: InkWell(
                      onTap: () {
                        onSelectTab(MyTabItem.values[0]);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: Container(
                          child: currentTab == MyTabItem.home
                              ? SvgPicture.asset(
                                  "assets/icons/home.svg",
                                  color: AppColors.primaryColor,
                                )
                              : SvgPicture.asset(
                                  "assets/icons/home.svg",
                                  color: AppColors.bottomIconSecondaryColor,
                                ),
                        ),
                      ))),
              Expanded(
                  flex: 1,
                  child: InkWell(
                      onTap: () {
                        onSelectTab(MyTabItem.values[1]);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: Container(
                          child: currentTab == MyTabItem.loyalty
                              ? SvgPicture.asset(
                                  "assets/icons/loyalty.svg",
                                  color: AppColors.primaryColor,
                                )
                              : SvgPicture.asset(
                                  "assets/icons/loyalty.svg",
                                  color: AppColors.bottomIconSecondaryColor,
                                ),
                        ),
                      ))),
              Expanded(
                  flex: 1,
                  child: InkWell(
                      onTap: () {
                        onSelectTab(MyTabItem.values[2]);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: Container(
                          child: currentTab == MyTabItem.account
                              ? SvgPicture.asset(
                                  "assets/icons/account.svg",
                                  color: AppColors.primaryColor,
                                )
                              : SvgPicture.asset(
                                  "assets/icons/account.svg",
                                  color: AppColors.bottomIconSecondaryColor,
                                ),
                        ),
                      ))),
              Expanded(
                  flex: 1,
                  child: InkWell(
                      onTap: () {
                        onSelectTab(MyTabItem.values[3]);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: Container(
                          child: currentTab == MyTabItem.order
                              ? SvgPicture.asset(
                                  "assets/icons/order.svg",
                                  color: AppColors.primaryColor,
                                )
                              : SvgPicture.asset(
                                  "assets/icons/order.svg",
                                  color: AppColors.bottomIconSecondaryColor,
                                ),
                        ),
                      )))
            ],
          ),
        ),
      ),
    );
  }
}
