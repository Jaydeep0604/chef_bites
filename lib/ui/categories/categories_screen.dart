import 'package:chef_bites/model/food_categories_model.dart';
import 'package:chef_bites/navigator/tab_item.dart';
import 'package:chef_bites/ui/base/base.dart';
import 'package:chef_bites/ui/search/search_screen.dart';
import 'package:chef_bites/ui/view_cart/view_cart_screen.dart';
import 'package:chef_bites/utils/app_colors.dart';
import 'package:chef_bites/utils/functions.dart';
import 'package:chef_bites/utils/route_transition.dart';
import 'package:chef_bites/widget/appbar/common_appbar.dart';
import 'package:chef_bites/widget/editText.dart';
import 'package:chef_bites/widget/food_categories_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({Key? key}) : super(key: key);
  static const categoriesScreen = "/categoriesscreen";

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  var _scrollController;
  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  List<FoodCategoriesModel> allFoodCategoriese = [
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
        // backgroundColor: AppColors.blackColor,
        body: NestedScrollView(
          controller: _scrollController,
          headerSliverBuilder: ((context, innerBoxIsScrolled) {
            return [
              CommonAppBarWithSearchBar(
                isNeedLeading: false,
                isNeedAction: true,
                leadingIcon: InkWell(
                  onTap: () {
                    //  Base.openDrawer(context);
                    Navigator.pop(context);
                  },
                  child: Transform.scale(
                    scale: 0.7,
                    child: SvgPicture.asset(
                      "assets/icons/back.svg",
                    ),
                  ),
                ),
                title: Row(
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
                          child: SvgPicture.asset("assets/icons/location.svg"),
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
                              color: AppColors.headingFontColor, fontSize: 13),
                        )
                      ],
                    ),
                  ],
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
          }),
          body: ScrollConfiguration(
            behavior: NoGlow(),
            child: Column(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GridView.count(
                        primary: false,
                        shrinkWrap: true,
                        //childAspectRatio: 1,
                        crossAxisCount: 3,
                        crossAxisSpacing: 12,
                        mainAxisSpacing: 12,
                        children:
                            List.generate(allFoodCategoriese.length, (index) {
                          return FoodCategoriesWidget(
                              foodCategoriesModel: allFoodCategoriese[index]);
                        })),
                  ),
                ),
              ],
            ),
          ),
          ),
      ),
    );
  }
}
