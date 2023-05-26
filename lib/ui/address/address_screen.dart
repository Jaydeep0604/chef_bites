import 'package:chef_bites/model/address_model.dart';
import 'package:chef_bites/ui/account/account_screen.dart';
import 'package:chef_bites/ui/address/add_address_screen.dart';
import 'package:chef_bites/ui/base/base.dart';
import 'package:chef_bites/ui/base/drawer.dart';
import 'package:chef_bites/utils/app_colors.dart';
import 'package:chef_bites/utils/functions.dart';
import 'package:chef_bites/widget/address_widget.dart';
import 'package:chef_bites/widget/appbar/app_bar.dart';
import 'package:chef_bites/widget/appbar/common_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AddressScreen extends StatefulWidget {
  const AddressScreen({Key? key}) : super(key: key);
  static const addressScreen='/addressscreen';

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  List<AddressModel> addressList = [
    AddressModel(
        id: "1",
        addressType: "Home",
        address:
            "Reference site about Lorem Ipsum, giving information on its origins, as well as a random Lipsum generator."),
    AddressModel(
        id: "2",
        addressType: "Office",
        address:
            "Reference site about Lorem Ipsum, giving information on its origins, as well as a random Lipsum generator."),
    AddressModel(
        id: "3",
        addressType: "Other",
        address:
            "Reference site about Lorem Ipsum, giving information on its origins, as well as a random Lipsum generator."),
  ];
  final _scaffoldkey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldkey,
      backgroundColor: AppColors.offwhiteColor,
      appBar: CustomAppBarWithBgColor(
        context: context,
        child: CommonAppBar(
          isNeedCenterTitle: "Manage Address",
          isNeedLeading: false,
          isNeedAction: true,
          leadingIcon: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AccountScreen(),
                ),
              );
              //Base.openDrawer(context);
            },
            child: Transform.scale(
              scale: 0.6,
              child: SvgPicture.asset(
                "assets/icons/profile.svg",
              ),
            ),
          ),
          action: InkWell(
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
        ),
      ),
      body: ScrollConfiguration(
        behavior: NoGlow(),
        child: SafeArea(
            child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                    color: AppColors.whiteColor,
                    borderRadius: BorderRadius.circular(10)),
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: SizedBox(
                        height: 35,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Align(
                                alignment: Alignment.topCenter,
                                child: SvgPicture.asset(
                                    "assets/icons/current_location.svg")),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    "Current Location",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                        color: AppColors.primaryColor),
                                  ),
                                  Text(
                                    "Current will be show here",
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: AppColors.notificationTextColor),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                                height: 35,
                                child: SvgPicture.asset(
                                    "assets/icons/right_arrow.svg")),
                          ],
                        ),
                      ),
                    ),
                    const Divider(),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AddAddressScreen()));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset("assets/icons/ad.svg"),
                          const SizedBox(
                            width: 10,
                          ),
                          const Expanded(
                            child: Text(
                              "Add Address",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: AppColors.primaryColor),
                            ),
                          ),
                          SvgPicture.asset("assets/icons/right_arrow.svg")
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                    color: AppColors.whiteColor,
                    borderRadius: BorderRadius.circular(10)),
                width: MediaQuery.of(context).size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        "Saved Address",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            color: AppColors.notificationTitleColor,
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: ListView.separated(
                        scrollDirection: Axis.vertical,
                        itemCount: addressList.length,
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
                              child: AddressWidget(
                                  addressModel: addressList[index]));
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return Divider();
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        )),
      ),
    );
  }
}
