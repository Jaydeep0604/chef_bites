import 'package:chef_bites/ui/base/base.dart';
import 'package:chef_bites/utils/app_colors.dart';
import 'package:chef_bites/utils/functions.dart';
import 'package:chef_bites/widget/appbar/app_bar.dart';
import 'package:chef_bites/widget/appbar/common_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TermsAndConditionScreen extends StatefulWidget {
  const TermsAndConditionScreen({Key? key}) : super(key: key);
  static const termsAndConditionScreen = '/termsandconditionscreen';

  @override
  State<TermsAndConditionScreen> createState() =>
      _TermsAndConditionScreenState();
}

class _TermsAndConditionScreenState extends State<TermsAndConditionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWithBgColor(
        context: context,
        child: CommonAppBar(
          isNeedCenterTitle: "Terms & Conditions",
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
              children: const [
                Text.rich(TextSpan(
                    text: "Case1: ",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                        color: AppColors.notificationTextColor),
                    children: [
                      TextSpan(
                          style: TextStyle(fontWeight: FontWeight.normal),
                          text:
                              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.")
                    ])),
                SizedBox(height: 20),
                Text(
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into ",
                  style: TextStyle(
                      fontSize: 12, color: AppColors.notificationTextColor),
                ),
                SizedBox(height: 20),
                Text(
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                  style: TextStyle(
                      fontSize: 12, color: AppColors.notificationTextColor),
                ),
                SizedBox(height: 20),
                Text(
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into ",
                  style: TextStyle(
                      fontSize: 12, color: AppColors.notificationTextColor),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
