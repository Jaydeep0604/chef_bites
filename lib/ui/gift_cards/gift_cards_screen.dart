import 'package:chef_bites/model/gift_card_model.dart';
import 'package:chef_bites/ui/base/base.dart';
import 'package:chef_bites/utils/app_colors.dart';
import 'package:chef_bites/utils/functions.dart';
import 'package:chef_bites/widget/appbar/app_bar.dart';
import 'package:chef_bites/widget/appbar/common_appbar.dart';
import 'package:chef_bites/widget/gift_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class GiftCardsScreen extends StatefulWidget {
  const GiftCardsScreen({Key? key}) : super(key: key);
  static const giftCardsScreen = '/giftcardsscreen';

  @override
  State<GiftCardsScreen> createState() => _GiftCardsScreenState();
}

class _GiftCardsScreenState extends State<GiftCardsScreen> {
  bool active = true;
  bool redeemed = false;
  List<GiftCardModel> giftCardList = [
    GiftCardModel(
      id: "1",
      gift_card_id: "2456",
      current_balance: "4.0",
      active: true,
      redeemed: false,
    ),
    GiftCardModel(
      id: "2",
      gift_card_id: "2457",
      current_balance: "4.0",
      active: false,
      redeemed: true,
    ),
    GiftCardModel(
      id: "3",
      gift_card_id: "2458",
      current_balance: "4.0",
      active: true,
      redeemed: false,
    ),
    GiftCardModel(
      id: "4",
      gift_card_id: "2459",
      current_balance: "4.0",
      active: true,
      redeemed: false,
    ),
    GiftCardModel(
      id: "5",
      gift_card_id: "2460",
      current_balance: "4.0",
      active: false,
      redeemed: true,
    ),
    GiftCardModel(
      id: "6",
      gift_card_id: "2461",
      current_balance: "4.0",
      active: true,
      redeemed: false,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWithBgColor(
        context: context,
        child: CommonAppBar(
          isNeedCenterTitle: "Gift Card",
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
      body: SafeArea(
        child: ScrollConfiguration(
          behavior: NoGlow(),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                child: Container(
                  height: 40,
                  color: AppColors.offwhiteColor,
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    children: [
                      Expanded(
                          child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Container(
                          color: active
                              ? AppColors.whiteColor
                              : AppColors.offwhiteColor,
                          padding: const EdgeInsets.all(5),
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                active = true;
                                redeemed = false;
                              });
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  "assets/icons/gif.svg",
                                  color: active
                                      ? AppColors.blackColor
                                      : AppColors.blackColor.withOpacity(0.6),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "Active Card",
                                  style: TextStyle(
                                      color: active
                                          ? AppColors.blackColor
                                          : AppColors.blackColor
                                              .withOpacity(0.6),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Container(
                            color: redeemed
                                ? AppColors.whiteColor
                                : AppColors.offwhiteColor,
                            padding: const EdgeInsets.all(5),
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  redeemed = true;
                                  active = false;
                                });
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    "assets/icons/redeem.svg",
                                    color: redeemed
                                        ? AppColors.blackColor
                                        : AppColors.blackColor.withOpacity(0.6),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "Redeemed Card",
                                    style: TextStyle(
                                        color: redeemed
                                            ? AppColors.blackColor
                                            : AppColors.blackColor
                                                .withOpacity(0.6),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: active
                    ? Padding(
                        padding: const EdgeInsets.all(20),
                        child: Expanded(
                          child: ListView.separated(
                            // shrinkWrap: true,
                            // primary: false,
                            padding: EdgeInsets.zero,
                            itemCount: giftCardList.length,
                            itemBuilder: (context, index) {
                              return GiftCardActiveCardWidget(
                                  giftCardModel: giftCardList[index]);
                            },
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return SizedBox();
                            },
                          ),
                        ),
                      )
                    : Padding(
                        padding: const EdgeInsets.all(20),
                        child: ListView.separated(
                          shrinkWrap: true,
                          primary: false,
                          padding: EdgeInsets.zero,
                          itemCount: giftCardList.length,
                          itemBuilder: (context, index) {
                            return GiftCardRedeemedWidget(
                                giftCardModel: giftCardList[index]);
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return SizedBox();
                          },
                        ),
                      ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
