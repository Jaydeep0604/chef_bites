import 'package:chef_bites/model/notification_model.dart';
import 'package:chef_bites/navigator/tab_item.dart';
import 'package:chef_bites/ui/account/account_screen.dart';
import 'package:chef_bites/ui/base/base.dart';
import 'package:chef_bites/utils/app_colors.dart';
import 'package:chef_bites/utils/functions.dart';
import 'package:chef_bites/widget/appbar/app_bar.dart';
import 'package:chef_bites/widget/appbar/common_appbar.dart';
import 'package:chef_bites/widget/notification_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);
  static const notificationScreen = "/notificationscreen";

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  List<NotificationModel> notificationList = [
    NotificationModel(
        id: "1",
        imgUrl: "assets/icons/macd.png",
        notificationText:
            "Reference site about Lorem Ipsum, giving Reference site",
        time: "07:30 PM"),
    NotificationModel(
        id: "1",
        imgUrl: "assets/icons/starbugs.png",
        notificationText:
            "Reference site about Lorem Ipsum, giving Reference site",
        time: "07:30 PM"),
    NotificationModel(
        id: "1",
        imgUrl: "assets/icons/ccd.png",
        notificationText:
            "Reference site about Lorem Ipsum, giving Reference site",
        time: "07:30 PM"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.offwhiteColor,
      appBar: CustomAppBarWithBgColor(
        context: context,
        child: CommonAppBar(
          isNeedCenterTitle: "Notifications",
          isNeedLeading: false,
          isNeedAction: true,
          leadingIcon: InkWell(
            onTap: () {
              // Base.openDrawer(context);
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => AccountScreen(),
              //   ),
              // );
              // Navigator.pushNamed(context, Base.getCurrentTab());
            },
            child: Transform.scale(
              scale: 0.5,
              child: SvgPicture.asset(
                "assets/icons/profile.svg",
              ),
            ),
          ),
          action: GestureDetector(
            onTap: () {
              Navigator.pop(context);
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
        child: SafeArea(
            child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                    color: AppColors.whiteColor,
                    borderRadius: BorderRadius.circular(10)),
                width: MediaQuery.of(context).size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        "New Notifications",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            color: AppColors.notificationTitleColor,
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        child: ListView.separated(
                          primary: false,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: notificationList.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                                onTap: () {
                                  // globalNavigatorKey.currentState?.push(
                                  //     SlideRightRoute(
                                  //         page: EventDetailsScreen(),
                                  //         settings: RouteSettings(
                                  //             name: EventDetailsScreen
                                  //                 .eventDetailsScreen)));
                                },
                                child: NotificationWidget(
                                    notificationModel:
                                        notificationList[index]));
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return Divider();
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                    color: AppColors.whiteColor,
                    borderRadius: BorderRadius.circular(10)),
                width: MediaQuery.of(context).size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        "Old Notifications",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            color: AppColors.notificationTitleColor,
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        child: ListView.separated(
                          primary: false,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: notificationList.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                                onTap: () {
                                  // globalNavigatorKey.currentState?.push(
                                  //     SlideRightRoute(
                                  //         page: EventDetailsScreen(),
                                  //         settings: RouteSettings(
                                  //             name: EventDetailsScreen
                                  //                 .eventDetailsScreen)));
                                },
                                child: NotificationWidget(
                                    notificationModel:
                                        notificationList[index]));
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return Divider();
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        )),
      ),
    );
  }
}
