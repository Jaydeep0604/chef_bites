import 'package:chef_bites/ui/base/base.dart';
import 'package:chef_bites/utils/app_colors.dart';
import 'package:chef_bites/utils/functions.dart';
import 'package:chef_bites/widget/appbar/app_bar.dart';
import 'package:chef_bites/widget/appbar/common_appbar.dart';
import 'package:chef_bites/widget/custom_switch_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);
  static const settingsScreen = '/settingsscreen';

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool promos_offers = false;
  bool order_purchase = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWithBgColor(
        context: context,
        child: CommonAppBar(
          isNeedCenterTitle: "Settings",
          isNeedLeading: false,
          isNeedAction: true,
          leadingIcon: GestureDetector(
            onTap: () {
              Navigator.pop(context);
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
              Navigator.pushNamedAndRemoveUntil(
                  context, Base.base, (route) => false);
            },
            child: Transform.scale(
              scale: 0.6,
              child: SvgPicture.asset(
                "assets/icons/home_icon.svg",
              ),
            ),
          ),
        ),
      ),
      body: ScrollConfiguration(
        behavior: NoGlow(),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Account Settings",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20, top: 20),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 21,
                            width: 21,
                            child: SvgPicture.asset(
                              "assets/icons/lock.svg",
                              fit: BoxFit.contain,
                              color: AppColors.notificationTitleColor,
                            ),
                          ),
                          SizedBox(
                            width: 12,
                          ),
                          Text(
                            "Change Password",
                            style: TextStyle(
                                color: AppColors.notificationTitleColor,
                                fontSize: 12),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10, bottom: 10),
                        child: Divider(),
                      ),
                      Row(
                        children: [
                          SizedBox(
                            height: 21,
                            width: 21,
                            child: SvgPicture.asset(
                              "assets/icons/email.svg",
                              fit: BoxFit.contain,
                              color: AppColors.notificationTitleColor,
                            ),
                          ),
                          SizedBox(
                            width: 12,
                          ),
                          Text(
                            "Change Email",
                            style: TextStyle(
                              color: AppColors.notificationTitleColor,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10, bottom: 10),
                        child: Divider(),
                      ),
                      Row(
                        children: [
                          SizedBox(
                            height: 21,
                            width: 21,
                            child: SvgPicture.asset(
                              "assets/icons/user.svg",
                              fit: BoxFit.contain,
                              color: AppColors.notificationTitleColor,
                            ),
                          ),
                          SizedBox(
                            width: 12,
                          ),
                          Text(
                            "Edit Profile",
                            style: TextStyle(
                                color: AppColors.notificationTitleColor,
                                fontSize: 12),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10, bottom: 10),
                        child: Divider(),
                      ),
                    ],
                  ),
                ),
                Text(
                  "Notification Settings",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 20,
                    top: 20,
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            height: 21,
                            width: 21,
                            child: SvgPicture.asset(
                              "assets/icons/discount.svg",
                              fit: BoxFit.contain,
                              color: AppColors.notificationTitleColor,
                            ),
                          ),
                          SizedBox(
                            width: 12,
                          ),
                          Expanded(
                            child: Text(
                              "Promos & offers",
                              style: TextStyle(
                                  color: AppColors.notificationTitleColor,
                                  fontSize: 12),
                            ),
                          ),
                          CustomSwitch(
                            value: promos_offers,
                            onChanged: (bool? value) {
                              setState(
                                () {
                                  promos_offers = value!;
                                },
                              );
                            },
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10, bottom: 10),
                        child: Divider(),
                      ),
                      Row(
                        children: [
                          SizedBox(
                            height: 21,
                            width: 21,
                            child: SvgPicture.asset(
                              "assets/icons/order_purchase.svg",
                              fit: BoxFit.contain,
                              color: AppColors.notificationTitleColor,
                            ),
                          ),
                          SizedBox(
                            width: 12,
                          ),
                          Expanded(
                            child: Text(
                              "Order & Purchases",
                              style: TextStyle(
                                  color: AppColors.notificationTitleColor,
                                  fontSize: 12),
                            ),
                          ),
                          CustomSwitch(
                            value: order_purchase,
                            onChanged: (bool? value) {
                              setState(
                                () {
                                  order_purchase = value!;
                                },
                              );
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// class CustomSwitch extends StatefulWidget {
//   final bool value;
//   final ValueChanged<bool> onChanged;
//   CustomSwitch({Key? key, required this.value, required this.onChanged})
//       : super(key: key);
//   @override
//   _CustomSwitchState createState() => _CustomSwitchState();
// }
// class _CustomSwitchState extends State<CustomSwitch>
//     with SingleTickerProviderStateMixin {
//   Animation? _circleAnimation;
//   AnimationController? _animationController;
//   @override
//   void initState() {
//     super.initState();
//     _animationController =
//         AnimationController(vsync: this, duration: Duration(milliseconds: 60));
//     _circleAnimation = AlignmentTween(
//             begin: widget.value ? Alignment.centerRight : Alignment.centerLeft,
//             end: widget.value ? Alignment.centerLeft : Alignment.centerRight)
//         .animate(CurvedAnimation(
//             parent: _animationController!, curve: Curves.linear));
//   }
//   @override
//   Widget build(BuildContext context) {
//     return AnimatedBuilder(
//       animation: _animationController!,
//       builder: (context, child) {
//         return GestureDetector(
//           onTap: () {
//             if (_animationController!.isCompleted) {
//               _animationController!.reverse();
//             } else {
//               _animationController!.forward();
//             }
//             widget.value == false
//                 ? widget.onChanged(true)
//                 : widget.onChanged(false);
//           },
//           child: Container(
//             width: 45.0,
//             height: 28.0,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(24.0),
//               color: _circleAnimation!.value == Alignment.centerLeft
//                   ? Colors.grey
//                   : Colors.blue,
//             ),
//             child: Padding(
//               padding: const EdgeInsets.only(
//                   top: 2.0, bottom: 2.0, right: 2.0, left: 2.0),
//               child: Container(
//                 alignment: widget.value
//                     ? ((Directionality.of(context) == TextDirection.rtl)
//                         ? Alignment.centerRight
//                         : Alignment.centerLeft)
//                     : ((Directionality.of(context) == TextDirection.rtl)
//                         ? Alignment.centerLeft
//                         : Alignment.centerRight),
//                 child: Container(
//                   width: 20.0,
//                   height: 20.0,
//                   decoration: BoxDecoration(
//                       shape: BoxShape.circle, color: Colors.white),
//                 ),
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }

