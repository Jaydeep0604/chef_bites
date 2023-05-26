import 'package:chef_bites/utils/app_colors.dart';
import 'package:chef_bites/utils/functions.dart';
import 'package:chef_bites/widget/appbar/common_appbar.dart';
import 'package:chef_bites/widget/editText.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen>
    with SingleTickerProviderStateMixin {
  var _scrollController;
  @override
  void initState() {
    super.initState();

    _scrollController = ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    List<String> recentlySearchedList = [
      "KFC",
      "Italian",
      "Pizza",
      "Chef Bites",
      "Fried Spring Roll",
    ];

    return Scaffold(
      body: ScrollConfiguration(
        behavior: NoGlow(),
        child: NestedScrollView(
          controller: _scrollController,
          headerSliverBuilder: ((context, innerBoxIsScrolled) {
            return [
              CommonAppBarSearchBar(
                  isNeedLeading: false,
                  isNeedAction: true,
                  title: InkWell(
                    //  onTap: () {
                    // globalNavigatorKey.currentState?.push(
                    //   SlideRightRoute(
                    //     page: const MyProfileScreen(),
                    //     settings: const RouteSettings(
                    //       name: MyProfileScreen.myProfileScreen,
                    //     ),
                    //   ),
                    // );
                    //  },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
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
                          crossAxisAlignment: CrossAxisAlignment.start,
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
                      Navigator.pop(context);
                    },
                    child: Transform.scale(
                      scale: 0.5,
                      child: SvgPicture.asset("assets/icons/cencel.svg"),
                    ),
                  ),
                  bottom: EditText(
                    color: AppColors.whiteColor,
                    filled: true,
                    prefixIcon: SvgPicture.asset(
                      "assets/icons/search.svg",
                    ),
                    hint: "Search branch list here",
                  )),
            ];
          }),
          body: ScrollConfiguration(
            behavior: NoGlow(),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, top: 20),
                    child: Text(
                      "Recently Searched",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 27,
                    child: ListView.separated(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      scrollDirection: Axis.horizontal,
                      itemCount: recentlySearchedList.length,
                      itemBuilder: (context, index) {
                        return Container(
                          decoration: BoxDecoration(
                              color: AppColors.offwhiteColor,
                              borderRadius: BorderRadius.circular(5)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            child: Text(
                              recentlySearchedList[index],
                              style: TextStyle(
                                color: AppColors.notificationTitleColor,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(
                          width: 10,
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
