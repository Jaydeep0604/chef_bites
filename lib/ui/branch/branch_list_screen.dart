import 'package:chef_bites/main.dart';
import 'package:chef_bites/model/branch_list_model.dart';
import 'package:chef_bites/ui/base/base.dart';
import 'package:chef_bites/ui/search/search_screen.dart';
import 'package:chef_bites/utils/app_colors.dart';
import 'package:chef_bites/utils/functions.dart';
import 'package:chef_bites/widget/appbar/app_bar.dart';
import 'package:chef_bites/widget/appbar/common_appbar.dart';
import 'package:chef_bites/widget/branch_list_widget.dart';
import 'package:chef_bites/widget/editText.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

class BranchListScreen extends StatefulWidget {
  const BranchListScreen({Key? key}) : super(key: key);

  @override
  State<BranchListScreen> createState() => _BranchListScreenState();
}

class _BranchListScreenState extends State<BranchListScreen>
    with SingleTickerProviderStateMixin {
  var _scrollController;

  @override
  void initState() {
    super.initState();

    _scrollController = ScrollController();
  }

  List<BranchListModel> branchList = [
    BranchListModel(
        id: "1",
        imgUrl: "assets/images/branch1.png",
        name: "Pizza R Us",
        address: "Reference site about Lorem Ipsum, giving",
        open: true,
        time1: "00:00 to 15:06",
        time2: "15:06 to 23:59",
        contactNo: "6955 258 354"),
    BranchListModel(
        id: "1",
        imgUrl: "assets/images/branch2.png",
        name: "Pizza R Us",
        address: "Reference site about Lorem Ipsum, giving",
        open: true,
        time1: "00:00 to 15:06",
        time2: "15:06 to 23:59",
        contactNo: "6955 258 354"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: false,
      backgroundColor: AppColors.offwhiteColor,
      body: ScrollConfiguration(
        behavior: NoGlow(),
        child: SafeArea(
          child: NestedScrollView(
            controller: _scrollController,
            headerSliverBuilder: ((context, innerBoxIsScrolled) {
              return [
                CommonAppBarWithSearchBar(
                  isNeedLeading: false,
                  isNeedAction: true,
                  leadingIcon: InkWell(
                    onTap: () {
                      //  Base.openDrawer(context);
                    },
                    child: Transform.scale(
                      scale: 0.5,
                      child: SvgPicture.asset(
                        "assets/icons/profile.svg",
                      ),
                    ),
                  ),
                  title: const Text(
                    "Branch List",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: AppColors.blackColor,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  action: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) =>
                      //             NotificationScreen()));
                    },
                    child: Transform.scale(
                      scale: 0.6,
                      child: SvgPicture.asset(
                        "assets/icons/back.svg",
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
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Container(
                      decoration: BoxDecoration(
                          color: AppColors.whiteColor,
                          borderRadius: BorderRadius.circular(5)),
                      padding: const EdgeInsets.all(10),
                      child: ListView.separated(
                        scrollDirection: Axis.vertical,
                        itemCount: branchList.length,
                        primary: false,
                        shrinkWrap: true,
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
                              child: BranchListWidget(
                                  branchListModel: branchList[index]));
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return const Divider();
                        },
                      ),
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
