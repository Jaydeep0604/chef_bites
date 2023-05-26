import 'package:chef_bites/model/Item_suggetion_model.dart';
import 'package:chef_bites/model/home_food_model.dart';
import 'package:chef_bites/navigator/tab_item.dart';
import 'package:chef_bites/ui/base/base.dart';
import 'package:chef_bites/ui/home/home_screen.dart';
import 'package:chef_bites/utils/app_colors.dart';
import 'package:chef_bites/utils/functions.dart';
import 'package:chef_bites/widget/appbar/app_bar.dart';
import 'package:chef_bites/widget/appbar/common_appbar.dart';
import 'package:chef_bites/widget/food_widget.dart';
import 'package:chef_bites/widget/item_suggetion_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MyFavoritesScreen extends StatefulWidget {
  const MyFavoritesScreen({Key? key}) : super(key: key);
  static const myFavoritesScreen = '/myfavoritesscreen';

  @override
  State<MyFavoritesScreen> createState() => _MyFavoritesScreenState();
}

class _MyFavoritesScreenState extends State<MyFavoritesScreen> {
  bool restaurant = true;
  bool food = false;
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

  List<ItemSuggetionModel> itemSuggetionlist = [
    ItemSuggetionModel(
        id: "1",
        imgUrl: "assets/images/pizza_sub.png",
        title: "Margherita Pizza",
        subTitle: "Lorem Ipsum is simply dummy text of the...",
        Price: "2.21",
        customised: false,
        added: true,
        liked: true),
    ItemSuggetionModel(
        id: "2",
        imgUrl: "assets/images/pizza_sub.png",
        title: "Margherita Pizza",
        subTitle: "Lorem Ipsum is simply dummy text of the...",
        Price: "2.21",
        customised: false,
        added: true,
        liked: true),
    ItemSuggetionModel(
        id: "3",
        imgUrl: "assets/images/pizza_sub.png",
        title: "Margherita Pizza",
        subTitle: "Lorem Ipsum is simply dummy text of the...",
        Price: "2.21",
        customised: false,
        added: true,
        liked: true),
    ItemSuggetionModel(
        id: "4",
        imgUrl: "assets/images/pizza_sub.png",
        title: "Margherita Pizza",
        subTitle: "Lorem Ipsum is simply dummy text of the...",
        Price: "2.21",
        customised: false,
        added: true,
        liked: true),
    ItemSuggetionModel(
        id: "5",
        imgUrl: "assets/images/pizza_sub.png",
        title: "Margherita Pizza",
        subTitle: "Lorem Ipsum is simply dummy text of the...",
        Price: "2.21",
        customised: false,
        added: true,
        liked: true),
    ItemSuggetionModel(
        id: "6",
        imgUrl: "assets/images/pizza_sub.png",
        title: "Margherita Pizza",
        subTitle: "Lorem Ipsum is simply dummy text of the...",
        Price: "2.21",
        customised: false,
        added: true,
        liked: true)
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWithBgColor(
        context: context,
        child: CommonAppBar(
          isNeedCenterTitle: "My Favorites",
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
              Navigator.popUntil(context, ModalRoute.withName('/'));

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
                          color: restaurant
                              ? AppColors.whiteColor
                              : AppColors.offwhiteColor,
                          padding: const EdgeInsets.all(5),
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                restaurant = true;
                                food = false;
                              });
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  "assets/icons/restaurant.svg",
                                  color: restaurant
                                      ? AppColors.blackColor
                                      : AppColors.blackColor.withOpacity(0.6),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "Restaurant",
                                  style: TextStyle(
                                      color: restaurant
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
                            color: food
                                ? AppColors.whiteColor
                                : AppColors.offwhiteColor,
                            padding: const EdgeInsets.all(5),
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  restaurant = false;
                                  food = true;
                                });
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    "assets/icons/food.svg",
                                    color: food
                                        ? AppColors.blackColor
                                        : AppColors.blackColor.withOpacity(0.6),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "Food",
                                    style: TextStyle(
                                        color: food
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
              if (restaurant)
                Padding(
                  padding: const EdgeInsets.only(
                      left: 15, right: 15, top: 20, bottom: 20),
                  child: ListView.separated(
                    scrollDirection: Axis.vertical,
                    primary: false,
                    shrinkWrap: true,
                    itemCount: recommendedList.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                          onTap: () {
                            // globalNavigatorKey.currentState?.push(
                            //     SlideRightRoute(
                            //         page: EventDetailsScreen(),
                            //         settings: RouteSettings(
                            //             name: EventDetailsScreen
                            //                 .eventDetailsScreen)));
                          },
                          child: FoodWidget(
                              homeFoodModel: recommendedList[index]));
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return const SizedBox(
                        height: 20,
                      );
                    },
                  ),
                ),
              if (food)
                Padding(
                  padding: const EdgeInsets.only(
                      left: 15, right: 15, top: 20, bottom: 20),
                  child: ListView.separated(
                    scrollDirection: Axis.vertical,
                    primary: false,
                    shrinkWrap: true,
                    itemCount: itemSuggetionlist.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                          onTap: () {
                            // selected(index);
                          },
                          child: ItemSuggetionWidget(
                              itemSuggetionModel: itemSuggetionlist[index]));
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return const SizedBox(
                        width: 10,
                      );
                    },
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
