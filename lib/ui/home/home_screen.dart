import 'package:chef_bites/model/food_categories_model.dart';
import 'package:chef_bites/model/home_food_model.dart';
import 'package:chef_bites/navigator/tab_item.dart';
import 'package:chef_bites/ui/base/base.dart';
import 'package:chef_bites/ui/categories/categories_screen.dart';
import 'package:chef_bites/ui/home/food_item_detail_screen.dart';
import 'package:chef_bites/ui/home/food_select_screen.dart';
import 'package:chef_bites/ui/notification/notification_screen.dart';
import 'package:chef_bites/ui/profile/my_profile_screen.dart';
import 'package:chef_bites/ui/search/search_screen.dart';
import 'package:chef_bites/ui/view_cart/view_cart_screen.dart';
import 'package:chef_bites/utils/app_colors.dart';
import 'package:chef_bites/utils/functions.dart';
import 'package:chef_bites/utils/route_transition.dart';
import 'package:chef_bites/widget/appbar/common_appbar.dart';
import 'package:chef_bites/widget/editText.dart';
import 'package:chef_bites/widget/food_categories_widget.dart';
import 'package:chef_bites/widget/home_food_widget.dart';
import 'package:chef_bites/widget/list_container_widget.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const homeScreen = '/';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  var _scrollController;

  @override
  void initState() {
    super.initState();

    _scrollController = ScrollController();
  }

  List<dynamic> imgList = [
    "assets/images/offer1.png",
    "assets/images/offer1.png",
    "assets/images/offer1.png",
    "assets/images/offer1.png",
    "assets/images/offer1.png"
  ];
  int page = 0;

  bool allList = true;
  bool newList = false;
  bool mostPopularList = false;
  bool familyFriendlyList = false;
  bool vagenList = false;
  bool glutenFreeList = false;
  void all() {
    setState(() {
      allList = true;
      newList = false;
      mostPopularList = false;
      familyFriendlyList = false;
      vagenList = false;
      glutenFreeList = false;
    });
  }

  void _new() {
    setState(() {
      allList = false;
      newList = true;
      mostPopularList = false;
      familyFriendlyList = false;
      vagenList = false;
      glutenFreeList = false;
    });
  }

  void mostPopular() {
    setState(() {
      allList = false;
      newList = false;
      mostPopularList = true;
      familyFriendlyList = false;
      vagenList = false;
      glutenFreeList = false;
    });
  }

  void familyFriendly() {
    setState(() {
      allList = false;
      newList = false;
      mostPopularList = false;
      familyFriendlyList = true;
      vagenList = false;
      glutenFreeList = false;
    });
  }

  void vagen() {
    setState(() {
      allList = false;
      newList = false;
      mostPopularList = false;
      familyFriendlyList = false;
      vagenList = true;
      glutenFreeList = false;
    });
  }

  void glutenFree() {
    setState(() {
      allList = false;
      newList = false;
      mostPopularList = false;
      familyFriendlyList = false;
      vagenList = false;
      glutenFreeList = true;
    });
  }

  List<HomeFoodModel> recommendedList = [
    HomeFoodModel(
        id: "1",
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
  List<HomeFoodModel> mostPopulerList = [
    HomeFoodModel(
        id: "1",
        imgUrl: "assets/images/most_popular.png",
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
        imgUrl: "assets/images/most_popular.png",
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
        imgUrl: "assets/images/most_popular.png",
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
        imgUrl: "assets/images/most_popular.png",
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
  List<HomeFoodModel> chineseList = [
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
  ];
  List<HomeFoodModel> italianList = [
    HomeFoodModel(
        id: "1",
        imgUrl: "assets/images/italian.png",
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
        imgUrl: "assets/images/italian.png",
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
        imgUrl: "assets/images/italian.png",
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
        imgUrl: "assets/images/italian.png",
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

  List<FoodCategoriesModel> foodCountyCategoriese = [
    FoodCategoriesModel(
        id: "1", name: "Italian", imgUrl: "assets/images/pizza.png"),
    FoodCategoriesModel(
        id: "2", name: "Asian", imgUrl: "assets/images/asian.png"),
    FoodCategoriesModel(
        id: "3", name: "Japanese", imgUrl: "assets/images/japanese.png"),
    FoodCategoriesModel(
        id: "4", name: "Chinese", imgUrl: "assets/images/c_chinese.png"),
    FoodCategoriesModel(
        id: "5", name: "American", imgUrl: "assets/images/american.png"),
    FoodCategoriesModel(
        id: "6",
        name: "Mediterranean",
        imgUrl: "assets/images/mediterranean.png"),
  ];
  List<FoodCategoriesModel> foodTypeCategoriese = [
    FoodCategoriesModel(
        id: "1", name: "Pizza", imgUrl: "assets/images/pizza.png"),
    FoodCategoriesModel(
        id: "2", name: "Burger", imgUrl: "assets/images/burger.png"),
    FoodCategoriesModel(id: "3", name: "BBQ", imgUrl: "assets/images/bbq.png"),
    FoodCategoriesModel(
        id: "4", name: "Pasta", imgUrl: "assets/images/pasta.png"),
    FoodCategoriesModel(
        id: "5", name: "Tacos", imgUrl: "assets/images/tacos.png"),
    FoodCategoriesModel(
        id: "6", name: "Chicken", imgUrl: "assets/images/chicken.png"),
  ];
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus!.unfocus();
      },
      child: Scaffold(
        extendBody: true,
        backgroundColor: AppColors.whiteColor,
        body: ScrollConfiguration(
          behavior: NoGlow(),
          child: NestedScrollView(
            controller: _scrollController,
            headerSliverBuilder: ((context, innerBoxIsScrolled) {
              return [
                CommonAppBarWithSearchBar(
                  isNeedLeading: false,
                  isNeedAction: true,
                  leadingIcon: InkWell(
                    onTap: () {
                      // Base.openDrawer(context);
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => NotificationScreen(),
                      //   ),
                      // );
                      globalNavigatorKey.currentState?.push(
                        SlideRightRoute(
                          page: const NotificationScreen(),
                          settings: const RouteSettings(
                            name: NotificationScreen.notificationScreen,
                          ),
                        ),
                      );
                    },
                    child: Transform.scale(
                      scale: 0.5,
                      child: SvgPicture.asset(
                        "assets/icons/notification.svg",
                      ),
                    ),
                  ),
                  title: InkWell(
                    onTap: () {
                      globalNavigatorKey.currentState?.push(
                        SlideRightRoute(
                          page: const MyProfileScreen(),
                          settings: const RouteSettings(
                            name: MyProfileScreen.myProfileScreen,
                          ),
                        ),
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                            height: 30,
                            width: 30,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.primaryColor),
                            child: Padding(
                              padding: const EdgeInsets.all(6.0),
                              child:
                                  SvgPicture.asset("assets/icons/location.svg"),
                            )),
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text(
                                  "Home",
                                  style: TextStyle(
                                      color: AppColors.headingFontColor,
                                      fontSize: 12),
                                ),
                                Icon(
                                  Icons.arrow_drop_down,
                                  color: AppColors.headingFontColor,
                                )
                              ],
                            ),
                            const Text(
                              "F-89 address location...",
                              style: TextStyle(
                                  color: AppColors.headingFontColor,
                                  fontSize: 13),
                            )
                          ],
                        ),
                      ],
                    ),
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
                      //Navigator.pop(context);
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) =>
                      //             NotificationScreen()));
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
                                color: AppColors.notificationTitleColor.withOpacity(0.5)),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ];
            }),
            body: ScrollConfiguration(
              behavior: NoGlow(),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 15, right: 15, top: 10),
                      child: Row(
                        children: [
                          const Text(
                            "Categories",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                InkWell(
                                  onTap: () {
                                    // Navigator.pushNamed(context,
                                    //     CategoriesScreen.categoriesScreen);
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                CategoriesScreen()));
                                  },
                                  child: const Text(
                                    "See all",
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: AppColors.primaryColor),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 88,
                      child: ListView.separated(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        scrollDirection: Axis.horizontal,
                        itemCount: foodCountyCategoriese.length,
                        itemBuilder: (context, index) {
                          return FoodCategoriesWidget(
                              foodCategoriesModel:
                                  foodCountyCategoriese[index]);
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return const SizedBox(
                            width: 4,
                          );
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 88,
                      child: ListView.separated(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        scrollDirection: Axis.horizontal,
                        itemCount: foodTypeCategoriese.length,
                        itemBuilder: (context, index) {
                          return FoodCategoriesWidget(
                              foodCategoriesModel: foodTypeCategoriese[index]);
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return const SizedBox(
                            width: 4,
                          );
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    SizedBox(
                        height: 26,
                        width: MediaQuery.of(context).size.width,
                        child: ListView(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 15,
                          ),
                          scrollDirection: Axis.horizontal,
                          children: [
                            GestureDetector(
                              onTap: () {
                                all();
                              },
                              child: ListContainer(
                                listName: "All",
                                color: allList
                                    ? AppColors.primaryColor.withOpacity(0.2)
                                    : AppColors.offwhiteColor,
                                textColor: allList
                                    ? AppColors.primaryColor
                                    : Colors.black,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                _new();
                              },
                              child: ListContainer(
                                listName: "New",
                                color: newList
                                    ? AppColors.primaryColor.withOpacity(0.2)
                                    : AppColors.offwhiteColor,
                                textColor: newList
                                    ? AppColors.primaryColor
                                    : Colors.black,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                mostPopular();
                              },
                              child: ListContainer(
                                listName: "Most Popular",
                                color: mostPopularList
                                    ? AppColors.primaryColor.withOpacity(0.2)
                                    : AppColors.offwhiteColor,
                                textColor: mostPopularList
                                    ? AppColors.primaryColor
                                    : Colors.black,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                familyFriendly();
                              },
                              child: ListContainer(
                                listName: "Family Friendly",
                                color: familyFriendlyList
                                    ? AppColors.primaryColor.withOpacity(0.2)
                                    : AppColors.offwhiteColor,
                                textColor: familyFriendlyList
                                    ? AppColors.primaryColor
                                    : Colors.black,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                vagen();
                              },
                              child: ListContainer(
                                listName: "Vagen",
                                color: vagenList
                                    ? AppColors.primaryColor.withOpacity(0.2)
                                    : AppColors.offwhiteColor,
                                textColor: vagenList
                                    ? AppColors.primaryColor
                                    : Colors.black,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                glutenFree();
                              },
                              child: ListContainer(
                                listName: "gluten Free",
                                color: glutenFreeList
                                    ? AppColors.primaryColor.withOpacity(0.2)
                                    : AppColors.offwhiteColor,
                                textColor: glutenFreeList
                                    ? AppColors.primaryColor
                                    : Colors.black,
                              ),
                            )
                          ],
                        )),
                    const SizedBox(height: 15),
                    CarouselSlider.builder(
                      itemCount: imgList.length,
                      options: CarouselOptions(
                          height: 152,
                          scrollDirection: Axis.horizontal,
                          autoPlay: true,
                          onPageChanged: (index, reason) {
                            setState(() {
                              page = index;
                            });
                          }),
                      itemBuilder: (context, index, realIndex) {
                        return SizedBox(
                          height: 152,
                          width: 282,
                          child: Card(
                              child: ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: Image.asset(
                              imgList[index],
                              fit: BoxFit.fill,
                            ),
                          )),
                        );
                      },
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: indicators(imgList.length, page)),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15, right: 15),
                      child: Row(
                        children: [
                          const Text(
                            "Recommended",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            FoodSelectScreen()));
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: const [
                                  Text(
                                    "See all",
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: AppColors.primaryColor),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 235,
                      child: ListView.separated(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        scrollDirection: Axis.horizontal,
                        itemCount: recommendedList.length,
                        primary: false,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return HomeFoodWiget(
                              homeFoodModel: recommendedList[index]);
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return const SizedBox(
                            width: 10,
                          );
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 15,
                        right: 15,
                      ),
                      child: Row(
                        children: [
                          const Text(
                            "Most Popular",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => FoodSelectScreen(),
                                  ),
                                );
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: const [
                                  Text(
                                    "See all",
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: AppColors.primaryColor),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 235,
                      child: ListView.separated(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        scrollDirection: Axis.horizontal,
                        itemCount: mostPopulerList.length,
                        primary: false,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return HomeFoodWiget(
                              homeFoodModel: mostPopulerList[index]);
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return const SizedBox(
                            width: 10,
                          );
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15, right: 15),
                      child: Row(
                        children: [
                          const Text(
                            "Chinese",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => FoodSelectScreen(),
                                  ),
                                );
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: const [
                                  Text(
                                    "See all",
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: AppColors.primaryColor),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 235,
                      child: ListView.separated(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        scrollDirection: Axis.horizontal,
                        itemCount: chineseList.length,
                        primary: false,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return HomeFoodWiget(
                              homeFoodModel: chineseList[index]);
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return const SizedBox(
                            width: 10,
                          );
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15, right: 15),
                      child: Row(
                        children: [
                          const Text(
                            "Italian",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            FoodSelectScreen()));
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: const [
                                  Text(
                                    "See all",
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: AppColors.primaryColor),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 235,
                      child: ListView.separated(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        scrollDirection: Axis.horizontal,
                        itemCount: italianList.length,
                        primary: false,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return HomeFoodWiget(
                              homeFoodModel: italianList[index]);
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return const SizedBox(
                            width: 10,
                          );
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 80,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> indicators(imagesLength, currentIndex) {
    return List<Widget>.generate(imagesLength, (index) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 3),
        child: AnimatedSize(
          //vsync: this,
          duration: const Duration(microseconds: 100),
          curve: Curves.easeOut,
          child: Container(
            width: page == index ? 15 : 8,
            height: 8,
            margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 1.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: page == index
                    ? AppColors.primaryColor
                    : AppColors.offwhiteColor),
          ),
        ),
      );
    });
  }
  // List<Widget> indicators(imagesLength, currentIndex) {
  //   return List<Widget>.generate(imagesLength, (index) {
  //     return AnimatedContainer(
  //       duration: Duration(milliseconds: 1000),
  //       curve: Curves.fastOutSlowIn,
  //       child: Padding(
  //         padding: const EdgeInsets.symmetric(horizontal: 3),
  //         child: AnimatedContainer(
  //           duration: Duration(milliseconds: 200),
  //           curve: Curves.easeInOut,
  //           child: Container(
  //             width: page == index ? 15 : 8,
  //             height: 8,
  //             margin:
  //                 const EdgeInsets.symmetric(vertical: 10.0, horizontal: 1.0),
  //             decoration: BoxDecoration(
  //                 borderRadius: BorderRadius.circular(50),
  //                 color: page == index
  //                     ? AppColors.primaryColor
  //                     : AppColors.offwhiteColor),
  //           ),
  //         ),
  //       ),
  //     );
  //   });
  // }
}
