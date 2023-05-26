import 'package:chef_bites/model/home_food_model.dart';
import 'package:chef_bites/navigator/tab_item.dart';
import 'package:chef_bites/ui/search/search_screen.dart';
import 'package:chef_bites/ui/view_cart/view_cart_screen.dart';
import 'package:chef_bites/utils/app_colors.dart';
import 'package:chef_bites/utils/functions.dart';
import 'package:chef_bites/utils/route_transition.dart';
import 'package:chef_bites/widget/appbar/common_appbar.dart';
import 'package:chef_bites/widget/editText.dart';
import 'package:chef_bites/widget/food_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

class FoodSelectScreen extends StatefulWidget {
  const FoodSelectScreen({Key? key}) : super(key: key);

  @override
  State<FoodSelectScreen> createState() => _FoodSelectScreenState();
}

class _FoodSelectScreenState extends State<FoodSelectScreen> {
  List<HomeFoodModel> recommendedList = [
    HomeFoodModel(
        id: "1",
        imgUrl: "assets/images/chinese.png",
        foodName: "Test Restro Name",
        vegOrNonveg: "Pure veg",
        foodCategories: "Asian",
        foodtype: "Family",
        discount: "40",
        upToPrice: "20",
        min_time: "25",
        max_time: "35",
        km: "",
        bestSeller: false),
    HomeFoodModel(
        id: "2",
        imgUrl: "assets/images/recommended.png",
        foodName: "Test Restro Name",
        vegOrNonveg: "Pure veg",
        foodCategories: "Asian",
        foodtype: "Family",
        discount: "40",
        upToPrice: "20",
        min_time: "25",
        max_time: "35",
        km: "",
        bestSeller: false),
    HomeFoodModel(
        id: "3",
        imgUrl: "assets/images/chinese.png",
        foodName: "Test Restro Name",
        vegOrNonveg: "Pure veg",
        foodCategories: "Asian",
        foodtype: "Family",
        discount: "40",
        upToPrice: "20",
        min_time: "25",
        max_time: "35",
        km: "",
        bestSeller: false),
    HomeFoodModel(
        id: "4",
        imgUrl: "assets/images/recommended.png",
        foodName: "Test Restro Name",
        vegOrNonveg: "Pure veg",
        foodCategories: "Asian",
        foodtype: "Family",
        discount: "40",
        upToPrice: "20",
        min_time: "25",
        max_time: "35",
        km: "",
        bestSeller: false),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            CommonAppBarWithSearchBar(
              isNeedLeading: false,
              isNeedAction: true,
              leadingIcon: InkWell(
                onTap: () {
                  Navigator.pop(context);
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) =>
                  //             NotificationScreen()));
                },
                child: Transform.scale(
                  scale: 0.7,
                  child: SvgPicture.asset(
                    "assets/icons/back.svg",
                    // color: AppColors.blackColor,
                  ),
                ),
              ),
              title: const Text(
                "Italian",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppColors.blackColor),
              ),
              action: InkWell(
                onTap: () {
                  globalNavigatorKey.currentState?.push(
                        SlideRightRoute(
                          page: const ViewCartScreen(),
                          settings: const RouteSettings(
                            name: ViewCartScreen.viewCartScreen,
                          ),
                        ),
                      );
                },
                child: Transform.scale(
                  scale: 0.5,
                  child: SvgPicture.asset(
                    "assets/icons/beg.svg",
                  ),
                ),
              ),
              bottom: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SearchScreen(),
                        ),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: InteractiveViewer(
                        child: Row(
                          children: [
                            SizedBox(
                              width: 10,
                            ),
                            SvgPicture.asset(
                              "assets/icons/search.svg",
                            ),
                            VerticalDivider(
                              indent: 7,
                              endIndent: 7,
                              thickness: 0.5,
                              color: AppColors.notificationTitleColor,
                            ),
                            Text(
                              "Search branch list here",
                              style: TextStyle(
                                  fontSize: 12,
                                  color: AppColors.notificationTitleColor
                                      .withOpacity(0.5)),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
            )
          ];
        },
        body: ScrollConfiguration(
          behavior: NoGlow(),
          child: SingleChildScrollView(
            child: SafeArea(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 15, right: 15, top: 20, bottom: 20),
                    child: ListView.separated(
                      scrollDirection: Axis.vertical,
                      primary: false,
                      shrinkWrap: true,
                      itemCount: recommendedList.length,
                      itemBuilder: (context, index) {
                        return FoodWidget(
                            homeFoodModel: recommendedList[index]);
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return const SizedBox(
                          height: 20,
                        );
                      },
                    ),
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
