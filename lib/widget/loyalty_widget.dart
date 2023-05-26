import 'package:chef_bites/model/loyalty_model.dart';
import 'package:chef_bites/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LoyaltyWidget extends StatefulWidget {
  LoyaltyWidget({Key? key, required this.loyaltyModel}) : super(key: key);
  LoyaltyModel loyaltyModel;

  @override
  State<LoyaltyWidget> createState() => _LoyaltyWidgetState();
}

class _LoyaltyWidgetState extends State<LoyaltyWidget> {
  bool like = false;
  liked() {
    setState(() {
      like = !like;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 227,
      width: 272,
      child: Column(
        children: [
          Container(
            height: 202,
            width: 268,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
            child: Column(
              children: [
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Image.asset(
                        widget.loyaltyModel.imgUrl,
                        height: 202,
                        width: 272,
                        fit: BoxFit.fill,
                      ),
                    ),
                    SizedBox(
                      height: 202,
                      width: 272,
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: Image.asset("assets/images/bottom_shaddow.png",
                              height: 58, fit: BoxFit.fill),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 202,
                      width: 272,
                      child: Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 10, bottom: 10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    widget.loyaltyModel.title,
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.whiteColor),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      child: Align(
                        alignment: Alignment.topRight,
                        child: GestureDetector(
                          onTap: liked,
                          child: like
                              ? SvgPicture.asset(
                                  "assets/icons/like.svg",
                                  color: AppColors.primaryColor,
                                  fit: BoxFit.fill,
                                )
                              : SvgPicture.asset(
                                  "assets/icons/like.svg",
                                  // color: AppColors.offwhiteColor,
                                  fit: BoxFit.fill,
                                ),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            children: [
              SvgPicture.asset("assets/icons/star.svg"),
              SizedBox(
                width: 5,
              ),
              Text("Valid on ${widget.loyaltyModel.validOn} orders")
            ],
          )
        ],
      ),
    );
  }
}
