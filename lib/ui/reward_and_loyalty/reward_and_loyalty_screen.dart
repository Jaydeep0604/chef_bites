import 'package:chef_bites/ui/base/base.dart';
import 'package:chef_bites/widget/appbar/app_bar.dart';
import 'package:chef_bites/widget/appbar/common_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class RewardAndLoyaltyScreen extends StatefulWidget {
  const RewardAndLoyaltyScreen({ Key? key }) : super(key: key);

  @override
  State<RewardAndLoyaltyScreen> createState() => _RewardAndLoyaltyScreenState();
}

class _RewardAndLoyaltyScreenState extends State<RewardAndLoyaltyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWithBgColor(
        context: context,
        child: CommonAppBar(
          isNeedCenterTitle: "Reward/Loyalty Points",
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
    );
  }
}