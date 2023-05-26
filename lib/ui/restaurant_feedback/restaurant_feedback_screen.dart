import 'dart:ui';

import 'package:chef_bites/model/restaurant_feedback_model.dart';
import 'package:chef_bites/ui/base/base.dart';
import 'package:chef_bites/utils/app_colors.dart';
import 'package:chef_bites/utils/functions.dart';
import 'package:chef_bites/widget/appbar/app_bar.dart';
import 'package:chef_bites/widget/appbar/common_appbar.dart';
import 'package:chef_bites/widget/editText.dart';
import 'package:chef_bites/widget/rating_bar_widget.dart';
import 'package:chef_bites/widget/restaurant_feedback_widget.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class RestaurantFeedbackScreen extends StatefulWidget {
  const RestaurantFeedbackScreen({Key? key}) : super(key: key);
  static const restaurantFeedbackScreen = '/restaurantfeedbackscreen';

  @override
  State<RestaurantFeedbackScreen> createState() =>
      _RestaurantFeedbackScreenState();
}

class _RestaurantFeedbackScreenState extends State<RestaurantFeedbackScreen> {
  List<RestaurantFeedbackModel> feedbackList = [
    RestaurantFeedbackModel(
        id: "1",
        title: "La Pino'z Pizza",
        veg_nonVeg: "Pure veg",
        country_type: "Asian",
        member_type: "Family",
        quality_of_food_rating: 5,
        food_packing_container_rating: 3,
        behaviour_of_staff_rating: 5,
        suggestion:
            "Reference site about Lorem Ipsum, giving informaon its origins, as well as a random Lipsum generator. its origins, as well as a random Lipsum generator."),
    RestaurantFeedbackModel(
        id: "1",
        title: "La Pino'z Pizza",
        veg_nonVeg: "Pure veg",
        country_type: "Asian",
        member_type: "Family",
        quality_of_food_rating: 5,
        food_packing_container_rating: 3,
        behaviour_of_staff_rating: 5,
        suggestion:
            "Reference site about Lorem Ipsum, giving informaon its origins, as well as a random Lipsum generator. its origins, as well as a random Lipsum generator."),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWithBgColor(
        context: context,
        child: CommonAppBar(
          isNeedCenterTitle: "Restaurant Feedback",
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
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Dining Evaluation",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Judge food quality by freshness, prep, and flavor.",
                              style: TextStyle(
                                  fontSize: 12,
                                  color: AppColors.notificationTitleColor),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      InkWell(
                        onTap: () {
                          showModalBottomSheet<void>(
                            isScrollControlled: true,
                            backgroundColor: Colors.white,
                            // isDismissible: false,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0)),
                            context: context,
                            builder: (BuildContext context) {
                              final MediaQueryData mediaQueryData =
                                  MediaQuery.of(context);
                              return Padding(
                                padding: mediaQueryData.viewInsets,
                                child: ScrollConfiguration(
                                  behavior: NoGlow(),
                                  child: Theme(
                                    data: Theme.of(context)
                                        .copyWith(canvasColor: Colors.white),
                                    child: Material(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(20.0),
                                          topRight: Radius.circular(20.0)),
                                      child: SingleChildScrollView(
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 15,
                                              right: 15,
                                              top: 15,
                                              bottom: 5),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Add Restaurant Feedback",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16),
                                              ),
                                              SizedBox(
                                                height: 20,
                                              ),
                                              EditText(
                                                hint: "Restaurant Name",
                                                prefixIcon: SvgPicture.asset(
                                                    "assets/icons/restaurant_feedback.svg"),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                  top: 20,
                                                ),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Expanded(
                                                          child: Text(
                                                            "Quality of food",
                                                            style: TextStyle(
                                                                color: AppColors
                                                                    .notificationTitleColor,
                                                                fontSize: 14),
                                                          ),
                                                        ),
                                                        Container(
                                                            decoration:
                                                                BoxDecoration(
                                                              color: AppColors
                                                                  .primaryColor
                                                                  .withOpacity(
                                                                      0.1),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5),
                                                            ),
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(1.0),
                                                              child: SmoothStarRating(
                                                                  allowHalfRating:
                                                                      false,
                                                                  starCount: 5,
                                                                  rating: 0,
                                                                  size: 20.0,
                                                                  filledIconData:
                                                                      Icons
                                                                          .star,
                                                                  halfFilledIconData:
                                                                      Icons
                                                                          .star,
                                                                  color:AppColors.primaryColor,
                                                                  borderColor:
                                                                      AppColors.primaryColor,
                                                                  spacing: 0.0),
                                                            ))
                                                      ],
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 5,
                                                              bottom: 5),
                                                      child: Divider(),
                                                    ),
                                                    Row(
                                                      children: [
                                                        Expanded(
                                                          child: Text(
                                                            "Food packing container",
                                                            style: TextStyle(
                                                                color: AppColors
                                                                    .notificationTitleColor,
                                                                fontSize: 14),
                                                          ),
                                                        ),
                                                        Container(
                                                            decoration:
                                                                BoxDecoration(
                                                              color: AppColors
                                                                  .primaryColor
                                                                  .withOpacity(
                                                                      0.1),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5),
                                                            ),
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(1.0),
                                                              child:
                                                                  SmoothStarRating(
                                                                  allowHalfRating:
                                                                      false,
                                                                  starCount: 5,
                                                                  rating: 0,
                                                                  size: 20.0,
                                                                  filledIconData:
                                                                      Icons
                                                                          .star,
                                                                  halfFilledIconData:
                                                                      Icons
                                                                          .star,
                                                                  color:AppColors.primaryColor,
                                                                  borderColor:
                                                                      AppColors.primaryColor,
                                                                  spacing: 0.0),
                                                            ))
                                                      ],
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 5,
                                                              bottom: 5),
                                                      child: Divider(),
                                                    ),
                                                    Row(
                                                      children: [
                                                        Expanded(
                                                          child: Text(
                                                            "Behaviour of staff",
                                                            style: TextStyle(
                                                                color: AppColors
                                                                    .notificationTitleColor,
                                                                fontSize: 14),
                                                          ),
                                                        ),
                                                        Container(
                                                            decoration:
                                                                BoxDecoration(
                                                              color: AppColors
                                                                  .primaryColor
                                                                  .withOpacity(
                                                                      0.1),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5),
                                                            ),
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(1.0),
                                                              child:
                                                                  SmoothStarRating(
                                                                  allowHalfRating:
                                                                      false,
                                                                  starCount: 5,
                                                                  rating: 0,
                                                                  size: 20.0,
                                                                  filledIconData:
                                                                      Icons
                                                                          .star,
                                                                  halfFilledIconData:
                                                                      Icons
                                                                          .star,
                                                                  color:AppColors.primaryColor,
                                                                  borderColor:
                                                                      AppColors.primaryColor,
                                                                  spacing: 0.0),
                                                            ))
                                                      ],
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 5,
                                                              bottom: 5),
                                                      child: Divider(),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              right: 70),
                                                      child: Text(
                                                        "What should make you return more frequently to us?",
                                                        style: TextStyle(
                                                            fontSize: 14),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    EditText(
                                                      hint: "Type a message",
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 5,
                                                              bottom: 5),
                                                      child: Divider(),
                                                    ),
                                                    Text(
                                                      "Suggestions",
                                                      style: TextStyle(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    EditText(
                                                      hint: "Type a message",
                                                    )
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 15, bottom: 5),
                                                child: Expanded(
                                                  child: Container(
                                                    height: 40,
                                                    decoration:
                                                        BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius
                                                              .circular(5),
                                                      gradient:
                                                          const LinearGradient(
                                                        colors: [
                                                          AppColors
                                                              .primaryColor,
                                                          Color(0xFFFFC56B),
                                                        ],
                                                        begin: Alignment
                                                            .centerLeft,
                                                        end: Alignment
                                                            .centerRight,
                                                        tileMode: TileMode
                                                            .repeated,
                                                      ),
                                                    ),
                                                    child: TextButton(
                                                      // style: TextButton.styleFrom(
                                                      //     backgroundColor: Colors.amber),
                                                      onPressed: () {
                                                        Navigator.pop(
                                                            context);
                                                      },
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Text(
                                                            "Add Feedback",
                                                            style: TextStyle(
                                                                color: AppColors
                                                                    .whiteColor,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                          SizedBox(
                                                            width: 10,
                                                          ),
                                                          SvgPicture.asset(
                                                            "assets/icons/feedback.svg",
                                                            color: AppColors
                                                                .whiteColor,
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
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: AppColors.primaryColor,
                              borderRadius: BorderRadius.circular(5)),
                          child: Padding(
                            padding: const EdgeInsets.all(9),
                            child: Center(
                              child: Text(
                                "Add Feedback",
                                style: TextStyle(
                                    fontSize: 14, color: AppColors.whiteColor),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10, bottom: 10),
                    child: Divider(),
                  ),
                  ListView.separated(
                    itemCount: feedbackList.length,
                    padding: EdgeInsets.zero,
                    primary: false,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return RestaurantfeedbackWidget(
                          restaurantFeedbackModel: feedbackList[index]);
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: EdgeInsets.only(top: 10, bottom: 10),
                        child: Divider(),
                      );
                    },
                  ),
                  SizedBox(
                    height: 15,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
