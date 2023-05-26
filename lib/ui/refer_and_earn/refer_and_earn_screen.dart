import 'package:chef_bites/ui/base/base.dart';
import 'package:chef_bites/utils/app_colors.dart';
import 'package:chef_bites/utils/functions.dart';
import 'package:chef_bites/widget/appbar/app_bar.dart';
import 'package:chef_bites/widget/appbar/common_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ReferAndEarnScreen extends StatefulWidget {
  const ReferAndEarnScreen({Key? key}) : super(key: key);
  static const referAndEarnScreen = '/referandearnscreen';

  @override
  State<ReferAndEarnScreen> createState() => _ReferAndEarnScreenState();
}

class _ReferAndEarnScreenState extends State<ReferAndEarnScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWithBgColor(
        context: context,
        child: CommonAppBar(
          isNeedCenterTitle: "Refer & Earn",
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 37,
              ),
              SvgPicture.asset("assets/images/refer_and_earn.svg"),
              const SizedBox(
                height: 30,
              ),
              const Text(
                "Get 1500 Coin",
                style: TextStyle(
                    color: AppColors.primaryColor,
                    fontSize: 26,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                "For every new user you refer",
                style: TextStyle(
                    color: AppColors.blackColor,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 5,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 70, right: 70),
                child: Text(
                  "Share Your refer link and earn 1500 coins",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: AppColors.notificationTitleColor,
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset("assets/icons/terms_condition.svg",
                      color: AppColors.notificationTitleColor.withOpacity(0.5)),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    "CHEFBITES@2458745",
                    style: TextStyle(
                        color: AppColors.notificationTitleColor.withOpacity(0.5)),
                  )
                ],
              ),
              const SizedBox(
                height: 62,
              ),
              const Text(
                "Get 1500 Coin",
                style: TextStyle(
                    color: AppColors.primaryColor,
                    fontSize: 26,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                "For any account you connect",
                style: TextStyle(
                    color: AppColors.blackColor,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    gradient: const LinearGradient(
                      colors: [
                        AppColors.primaryColor,
                        Color(0xFFFFC56B),
                      ],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      // stops: [1,1.1],
                      tileMode: TileMode.repeated,
                    ),
                  ),
                  child: TextButton(
                      // style: TextButton.styleFrom(
                      //     backgroundColor: Colors.amber),
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Share",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, color: Colors.white),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          SvgPicture.asset("assets/icons/share.svg"),
                        ],
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
