import 'package:chef_bites/model/restaurant_feedback_model.dart';
import 'package:chef_bites/utils/app_colors.dart';
import 'package:chef_bites/widget/rating_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class RestaurantfeedbackWidget extends StatefulWidget {
  RestaurantfeedbackWidget({Key? key, required this.restaurantFeedbackModel})
      : super(key: key);
  RestaurantFeedbackModel restaurantFeedbackModel;

  @override
  State<RestaurantfeedbackWidget> createState() =>
      _RestaurantfeedbackWidgetState();
}

class _RestaurantfeedbackWidgetState extends State<RestaurantfeedbackWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  widget.restaurantFeedbackModel.title,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 14,
                child: SvgPicture.asset(
                  "assets/icons/edit.svg",
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              SizedBox(
                height: 14,
                child: SvgPicture.asset(
                  "assets/icons/delete.svg",
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(
                width: 5,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                widget.restaurantFeedbackModel.veg_nonVeg,
                style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: AppColors.notificationTitleColor),
              ),
              Padding(
                padding: const EdgeInsets.all(3),
                child: Container(
                  width: 3,
                  height: 3,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: AppColors.blackColor),
                ),
              ),
              Text(
                widget.restaurantFeedbackModel.country_type,
                style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: AppColors.notificationTitleColor),
              ),
              Padding(
                padding: const EdgeInsets.all(3),
                child: Container(
                  width: 3,
                  height: 3,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: AppColors.blackColor),
                ),
              ),
              Text(
                widget.restaurantFeedbackModel.member_type,
                style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: AppColors.notificationTitleColor),
              ),
            ],
          ),
          SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        "Quality of food",
                        style: TextStyle(
                            color: AppColors.notificationTitleColor,
                            fontSize: 14),
                      ),
                    ),
                    Container(
                        decoration: BoxDecoration(
                          color: AppColors.primaryColor.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(1.0),
                          child: RatingBarWidget(
                              label: widget.restaurantFeedbackModel
                                  .quality_of_food_rating),
                        ))
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5, bottom: 5),
                  child: Divider(),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        "Food packing container",
                        style: TextStyle(
                            color: AppColors.notificationTitleColor,
                            fontSize: 14),
                      ),
                    ),
                    Container(
                        decoration: BoxDecoration(
                          color: AppColors.primaryColor.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(1.0),
                          child: RatingBarWidget(
                              label: widget.restaurantFeedbackModel
                                  .food_packing_container_rating),
                        ))
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5, bottom: 5),
                  child: Divider(),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        "Behaviour of staff",
                        style: TextStyle(
                            color: AppColors.notificationTitleColor,
                            fontSize: 14),
                      ),
                    ),
                    Container(
                        decoration: BoxDecoration(
                          color: AppColors.primaryColor.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(1.0),
                          child: RatingBarWidget(
                              label: widget.restaurantFeedbackModel
                                  .behaviour_of_staff_rating),
                        ))
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5, bottom: 5),
                  child: Divider(),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 70),
                  child: Text(
                    "What should make you return more frequently to us?",
                    style: TextStyle(fontSize: 14),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Reference site about Lorem Ipsum,",
                  style: TextStyle(
                      fontSize: 12, color: AppColors.notificationTitleColor),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5, bottom: 5),
                  child: Divider(),
                ),
                Text(
                  "Suggestions",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(widget.restaurantFeedbackModel.suggestion,
                    style: TextStyle(
                        fontSize: 12, color: AppColors.notificationTitleColor))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
