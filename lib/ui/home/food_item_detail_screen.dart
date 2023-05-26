import 'package:carousel_slider/carousel_slider.dart';
import 'package:chef_bites/model/Item_suggetion_model.dart';
import 'package:chef_bites/ui/home/item_customise_screen.dart';
import 'package:chef_bites/ui/search/search_screen.dart';
import 'package:chef_bites/ui/view_cart/view_cart_screen.dart';
import 'package:chef_bites/utils/app_colors.dart';
import 'package:chef_bites/utils/functions.dart';
import 'package:chef_bites/widget/appbar/app_bar.dart';
import 'package:chef_bites/widget/appbar/common_appbar.dart';
import 'package:chef_bites/widget/item_suggetion_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class FoodItemDetailScreen extends StatefulWidget {
  const FoodItemDetailScreen({Key? key}) : super(key: key);
  static const foofItemDetailScreen = '/fooditemdetailsscreen';

  @override
  State<FoodItemDetailScreen> createState() => _FoodItemDetailScreenState();
}

class _FoodItemDetailScreenState extends State<FoodItemDetailScreen> {
  List<String> foodItemSuggetionList = [
    "Pizza Categories",
    "Recommended",
    "Burgers",
    "Pasta",
  ];
  int selectedIndex = 0;

  selected(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  bool like = false;
  bool add = false;
  liked() {
    setState(() {
      like = !like;
    });
  }

  List<ItemSuggetionModel> itemSuggetionlist = [
    ItemSuggetionModel(
        id: "1",
        imgUrl: "assets/images/pizza_sub.png",
        title: "Margherita Pizza",
        subTitle: "Lorem Ipsum is simply dummy text of the...",
        Price: "2.21",
        customised: false,
        added: true,
        liked: false),
    ItemSuggetionModel(
        id: "2",
        imgUrl: "assets/images/pizza_sub.png",
        title: "Margherita Pizza",
        subTitle: "Lorem Ipsum is simply dummy text of the...",
        Price: "2.21",
        customised: false,
        added: true,
        liked: false),
    ItemSuggetionModel(
        id: "3",
        imgUrl: "assets/images/pizza_sub.png",
        title: "Margherita Pizza",
        subTitle: "Lorem Ipsum is simply dummy text of the...",
        Price: "2.21",
        customised: false,
        added: true,
        liked: false),
    ItemSuggetionModel(
        id: "4",
        imgUrl: "assets/images/pizza_sub.png",
        title: "Margherita Pizza",
        subTitle: "Lorem Ipsum is simply dummy text of the...",
        Price: "2.21",
        customised: false,
        added: true,
        liked: false)
  ];
  List<ItemSuggetionModel> customiseditemlist = [
    ItemSuggetionModel(
        id: "1",
        imgUrl: "assets/images/pizza_sub.png",
        title: "Margherita Pizza",
        subTitle: "Lorem Ipsum is simply dummy text of the...",
        Price: "2.21",
        customised: true,
        added: true,
        liked: false),
    ItemSuggetionModel(
        id: "2",
        imgUrl: "assets/images/pizza_sub.png",
        title: "Margherita Pizza",
        subTitle: "Lorem Ipsum is simply dummy text of the...",
        Price: "2.21",
        customised: true,
        added: true,
        liked: false),
    ItemSuggetionModel(
        id: "3",
        imgUrl: "assets/images/pizza_sub.png",
        title: "Margherita Pizza",
        subTitle: "Lorem Ipsum is simply dummy text of the...",
        Price: "2.21",
        customised: true,
        added: true,
        liked: false),
    ItemSuggetionModel(
        id: "4",
        imgUrl: "assets/images/pizza_sub.png",
        title: "Margherita Pizza",
        subTitle: "Lorem Ipsum is simply dummy text of the...",
        Price: "2.21",
        customised: true,
        added: true,
        liked: false)
  ];
  List<dynamic> imgList = [
    "assets/images/lapinoz_detail.png",
    "assets/images/lapinoz_detail.png",
    "assets/images/lapinoz_detail.png",
    "assets/images/lapinoz_detail.png",
    "assets/images/lapinoz_detail.png"
  ];
  int page = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomAppBarWithoutBgColor(
        context: context,
        child: CommonAppBar(
          isNeedCenterTitle: "",
          isNeedLeading: false,
          isNeedAction: true,
          leadingIcon: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Transform.scale(
              scale: 0.6,
              child: SvgPicture.asset(
                "assets/icons/back.svg",
              ),
            ),
          ),
          action: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SearchScreen(),
                ),
              );
            },
            child: Transform.scale(
              scale: 0.6,
              child: SvgPicture.asset(
                "assets/icons/search.svg",
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 70,
        decoration: BoxDecoration(
            color: AppColors.whiteColor,
            boxShadow: [
              BoxShadow(
                  color: AppColors.shodowColor.withOpacity(0.2), blurRadius: 5)
            ],
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30))),
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding:
              const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
          child: Row(
            children: [
              Expanded(
                child: TextButton(
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          "assets/icons/beg.svg",
                          color: AppColors.notificationTitleColor,
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        const Text(
                          "1 Item Added",
                          style: TextStyle(
                              color: AppColors.notificationTitleColor),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        const Icon(
                          Icons.keyboard_arrow_up,
                          color: AppColors.notificationTitleColor,
                        )
                      ],
                    )),
              ),
              Expanded(
                child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    gradient: const LinearGradient(
                      colors: [
                        AppColors.primaryColor,
                        Color(0xFFFFC56B),
                      ],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      // stops: [1,1.1],
                      tileMode: TileMode.repeated,
                    ),
                  ),
                  child: TextButton(
                      // style: TextButton.styleFrom(
                      //     backgroundColor: Colors.amber),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ViewCartScreen()));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            "View Cart",
                            style: TextStyle(
                                color: AppColors.whiteColor,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Icon(
                            Icons.arrow_right_alt,
                            color: AppColors.notificationTitleColor,
                          )
                        ],
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
      body: ScrollConfiguration(
        behavior: NoGlow(),
        child: SingleChildScrollView(
            child: Column(
          children: [
            SizedBox(
              height: 440,
              width: MediaQuery.of(context).size.width,
              child: Stack(
                children: [
                  CarouselSlider.builder(
                    itemCount: imgList.length,
                    options: CarouselOptions(
                        height: 440,
                        viewportFraction: 1.0,
                        scrollDirection: Axis.horizontal,
                        autoPlay: true,
                        onPageChanged: (index, reason) {
                          setState(() {
                            page = index;
                          });
                        }),
                    itemBuilder: (context, index, realIndex) {
                      return SizedBox(
                        height: 440,
                        width: MediaQuery.of(context).size.width,
                        child: Card(
                            child: Image.asset(
                          imgList[index],
                          fit: BoxFit.fill,
                        )),
                      );
                    },
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: indicators(imgList.length, page)),
                  ),
                ],
              ),

              //Image.asset("assets/images/lapinoz_detail.png"),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: LinearGradient(colors: [
                      AppColors.primaryColor.withOpacity(0.1),
                      AppColors.primaryColor.withOpacity(0.05),
                      AppColors.whiteColor.withOpacity(0.0),
                      AppColors.whiteColor.withOpacity(0.0),
                    ])),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SvgPicture.asset(
                        "assets/icons/discount.svg",
                        color: AppColors.primaryColor,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        "40% Off up to \$20",
                        style: TextStyle(color: AppColors.primaryColor),
                      )
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 15, right: 15),
                  child: SizedBox(
                    height: 32,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: foodItemSuggetionList.length,
                      primary: false,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            selected(index);
                          },
                          child: IntrinsicWidth(
                            child: Column(
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 5, right: 10),
                                  child: Text(
                                    foodItemSuggetionList[index],
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                        color: selectedIndex == index
                                            ? AppColors.primaryColor
                                            : AppColors.notificationTitleColor
                                                .withOpacity(0.8)),
                                  ),
                                ),
                                Divider(
                                  thickness: 1,
                                  color: selectedIndex == index
                                      ? AppColors.primaryColor
                                      : AppColors.notificationTitleColor
                                          .withOpacity(0.8),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return const SizedBox();
                      },
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Row(
                    children: [
                      Container(
                        width: 3,
                        height: 11,
                        decoration: const BoxDecoration(
                            color: AppColors.blackColor,
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(10),
                                bottomRight: Radius.circular(10))),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        "Pizza Categories",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 110,
                  child: ListView.separated(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    scrollDirection: Axis.horizontal,
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
                Divider(),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Row(
                    children: [
                      Container(
                        width: 3,
                        height: 11,
                        decoration: const BoxDecoration(
                            color: AppColors.blackColor,
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(10),
                                bottomRight: Radius.circular(10))),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        "Burgers",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 110,
                  child: ListView.separated(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    scrollDirection: Axis.horizontal,
                    itemCount: customiseditemlist.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                          onTap: () {
                            // selected(index);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        ItemCustomiseScreen()));
                          },
                          child: ItemSuggetionWidget(
                              itemSuggetionModel: customiseditemlist[index]));
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return const SizedBox(
                        width: 10,
                      );
                    },
                  ),
                ),
                Divider(),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Row(
                    children: [
                      Container(
                        width: 3,
                        height: 11,
                        decoration: const BoxDecoration(
                            color: AppColors.blackColor,
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(10),
                                bottomRight: Radius.circular(10))),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        "Pasta",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 110,
                  child: ListView.separated(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    scrollDirection: Axis.horizontal,
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
                Divider(),
              ],
            ),
          ],
        )),
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
}
