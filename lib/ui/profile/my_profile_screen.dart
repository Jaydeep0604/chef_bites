import 'package:chef_bites/model/address_model.dart';
import 'package:chef_bites/navigator/tab_item.dart';
import 'package:chef_bites/ui/address/add_address_screen.dart';
import 'package:chef_bites/ui/base/base.dart';
import 'package:chef_bites/ui/profile/edit_profile_screen.dart';
import 'package:chef_bites/utils/app_colors.dart';
import 'package:chef_bites/utils/functions.dart';
import 'package:chef_bites/utils/route_transition.dart';
import 'package:chef_bites/widget/address_widget.dart';
import 'package:chef_bites/widget/appbar/app_bar.dart';
import 'package:chef_bites/widget/appbar/common_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MyProfileScreen extends StatefulWidget {
  const MyProfileScreen({Key? key}) : super(key: key);
  static const myProfileScreen = "/myprofilescreen";

  @override
  State<MyProfileScreen> createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> {
  String? phoneCtr, emailCtr;

  @override
  void initState() {
    super.initState();
    phoneCtr = "+91 9486 258 357";
    emailCtr = "Testmail@gmail.com";
  }

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: CustomAppBarWithBgColor(
        context: context,
        child: CommonAppBar(
          isNeedCenterTitle: "My Profile",
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
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text(
                    "User Name",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        color: AppColors.blackColor,
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const EditProfileScreen()));
                  },
                  child: const Padding(
                    padding: EdgeInsets.only(left: 10, top: 2),
                    child: Text(
                      "Testmail@gmail.com",
                      style: TextStyle(
                          fontSize: 12,
                          color: AppColors.notificationTextColor,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Divider(),
                const SizedBox(
                  height: 10,
                ),
                const Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    "Account Information",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        color: AppColors.blackColor,
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const EditProfileScreen()));
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 5,vertical: 12),
                          decoration: BoxDecoration(
                            color: AppColors.offwhiteColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child:IntrinsicHeight(
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 15,height: 15,
                                ),
                                SvgPicture.asset(
                                  "assets/icons/dail.svg",
                                  fit: BoxFit.fill,
                                ),
                                VerticalDivider(
                                  // indent: 1,
                                  // endIndent: 1,
                                  thickness: 0.5,
                                  color: AppColors.notificationTitleColor,
                                ),
                                Text(
                                  "${phoneCtr}",
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: AppColors.notificationTitleColor),
                                )
                              ],
                            ),
                          ),
                          
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const EditProfileScreen()));
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 5,vertical: 12),
                          decoration: BoxDecoration(
                            color: AppColors.offwhiteColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: IntrinsicHeight(
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 10,height: 10,
                                ),
                                SvgPicture.asset(
                                  "assets/icons/email.svg",
                                  fit: BoxFit.fill,
                                ),
                                VerticalDivider(
                                  // indent: 1,
                                  // endIndent: 1,
                                  thickness: 0.5,
                                  color: AppColors.notificationTitleColor,
                                ),
                                Text(
                                  "${emailCtr}",
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: AppColors.notificationTitleColor),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Divider(),
                const SizedBox(
                  height: 19,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text(
                    "My Addresses",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        color: AppColors.blackColor,
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Column(
                    children: [
                      InkWell(
                        onTap: () {
                          globalNavigatorKey.currentState?.push(
                            SlideRightRoute(
                              page: const AddAddressScreen(),
                              settings: const RouteSettings(
                                name: AddAddressScreen.addAddressscreen,
                              ),
                            ),
                          );
                        },
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
                                          color:
                                              AppColors.notificationTextColor),
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
                      const SizedBox(
                        height: 5,
                      ),
                      const Divider(),
                      InkWell(
                        onTap: () {
                          globalNavigatorKey.currentState?.push(SlideRightRoute(
                              page: const AddAddressScreen(),
                              settings: const RouteSettings(
                                  name: AddAddressScreen.addAddressscreen)));
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
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                const Divider(),
                const SizedBox(
                  height: 20,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text(
                    "Saved Address",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        color: AppColors.blackColor,
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, top: 14),
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
                          child:
                              AddressWidget(addressModel: addressList[index]));
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return Divider();
                    },
                  ),
                ),
                SizedBox(
                  height: 30,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
