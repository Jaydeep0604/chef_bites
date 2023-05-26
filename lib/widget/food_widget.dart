import 'package:chef_bites/model/home_food_model.dart';
import 'package:chef_bites/navigator/tab_item.dart';
import 'package:chef_bites/ui/home/food_item_detail_screen.dart';
import 'package:chef_bites/utils/app_colors.dart';
import 'package:chef_bites/utils/route_transition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class FoodWidget extends StatefulWidget {
  FoodWidget({Key? key, required this.homeFoodModel}) : super(key: key);
  HomeFoodModel homeFoodModel;
  @override
  State<FoodWidget> createState() => _FoodWidgetState();
}

class _FoodWidgetState extends State<FoodWidget> {
  bool like = false;
  liked() {
    setState(() {
      like = !like;
      // if (save)
      //   EbToast.instance.simpleMessage(context, "Event saved successfully");
      // if (!save)
      //   EbToast.instance.simpleMessage(context, "Event removed successfully");
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        globalNavigatorKey.currentState?.push(
          SlideRightRoute(
            page: const FoodItemDetailScreen(),
            settings: const RouteSettings(
                name: FoodItemDetailScreen.foofItemDetailScreen),
          ),
        );
      },
      onDoubleTap: () {
        setState(() {
          like = true;
        });
      },
      child: Container(
        height: 218,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Image.asset(
                    widget.homeFoodModel.imgUrl,
                    height: 218,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.fill,
                  ),
                ),
                SizedBox(
                  height: 218,
                  width: MediaQuery.of(context).size.width,
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Image.asset("assets/images/bottom_shaddow.png",
                          height: 58,
                          width: MediaQuery.of(context).size.width,
                          fit: BoxFit.fill),
                    ),
                  ),
                ),
                SizedBox(
                  height: 218,
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10, bottom: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.homeFoodModel.foodName,
                                style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.whiteColor),
                              ),
                              const SizedBox(
                                height: 3,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    widget.homeFoodModel.vegOrNonveg,
                                    style: const TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.whiteColor),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(3),
                                    child: Container(
                                      width: 3,
                                      height: 3,
                                      decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: AppColors.whiteColor),
                                    ),
                                  ),
                                  Text(
                                    widget.homeFoodModel.foodtype,
                                    style: const TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.whiteColor),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(3),
                                    child: Container(
                                      width: 3,
                                      height: 3,
                                      decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: AppColors.whiteColor),
                                    ),
                                  ),
                                  Text(
                                    widget.homeFoodModel.foodCategories,
                                    style: const TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.whiteColor),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Container(
                      height: 21,
                      width: 88,
                      decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              AppColors.primaryColor,
                              Color(0xFFFFC56B),
                            ],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            // stops: [1,1.1],
                            tileMode: TileMode.repeated,
                          ),
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(50),
                              bottomRight: Radius.circular(50))),
                      child: const Center(
                          child: Text(
                        "Promoted",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: AppColors.whiteColor),
                      )),
                    ),
                    Expanded(
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
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
