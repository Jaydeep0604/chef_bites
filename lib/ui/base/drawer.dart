import 'package:chef_bites/ui/address/address_screen.dart';
import 'package:chef_bites/ui/branch/branch_list_screen.dart';
import 'package:chef_bites/ui/notification/notification_screen.dart';
import 'package:chef_bites/ui/profile/my_profile_screen.dart';
import 'package:chef_bites/utils/app_colors.dart';
import 'package:chef_bites/utils/functions.dart';
import 'package:chef_bites/widget/drawer_list_tile_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CBDrawer extends StatefulWidget {
  const CBDrawer({Key? key}) : super(key: key);

  @override
  State<CBDrawer> createState() => _CBDrawerState();
}

class _CBDrawerState extends State<CBDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
        topRight: Radius.circular(50),
        bottomRight: Radius.circular(50),
      )),
      child: Column(
        children: [
          SizedBox(
            height: 150,
            child: Stack(
              children: [
                DrawerHeader(
                  decoration: const BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius:
                          BorderRadius.only(topRight: Radius.circular(50))),
                  child: Container(
                    padding: EdgeInsets.only(left: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () {
                            // Navigator.pop(context);
                            // navigatorKeys[Base.getCurrentTab(context)]
                            //     ?.currentState
                            //     ?.pushNamed(ProfileScreen.profileScreen);
                          },
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(40),
                              child: SvgPicture.asset(
                                "assets/icons/profile.svg",
                                width: 90,
                                height: 90,
                                fit: BoxFit.cover,
                              )),
                        ),
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.only(left: 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  alignment: Alignment.centerLeft,
                                  child: const Text(
                                    "Ashfak Sayem",
                                    textAlign: TextAlign.start,
                                    maxLines: 1,
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        color: Colors.black,
                                        overflow: TextOverflow.ellipsis),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 15, top: 30),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        height: 45,
                        width: 45,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: AppColors.whiteColor),
                        child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: SvgPicture.asset("assets/icons/close.svg"),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              padding: const EdgeInsets.only(
                  top: 10, bottom: 10, left: 20, right: 20),
              child: ScrollConfiguration(
                behavior: NoGlow(),
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    DrawerListTile(
                      leading: "assets/icons/branch.svg",
                      title: "Select Branch",
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => BranchListScreen()));
                        //       // navigatorKeys[Base.getCurrentTab(context)]
                        //       //     ?.currentState
                        //       //     ?.pushNamed(ProfileScreen.profileScreen);
                      },
                    ),
                    DrawerListTile(
                      leading: "assets/icons/notification.svg",
                      title: "Notification",
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => NotificationScreen()));
                        // navigatorKeys[Base.getCurrentTab(context)]
                        //     ?.currentState
                        //     ?.pushNamed(ProfileScreen.profileScreen);
                      },
                    ),
                    DrawerListTile(
                      leading: "assets/icons/drawer_profile.svg",
                      title: "My Profile",
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MyProfileScreen()));
                        //       // navigatorKeys[Base.getCurrentTab(context)]
                        //       //     ?.currentState
                        //       //     ?.pushNamed(ProfileScreen.profileScreen);
                      },
                    ),
                    DrawerListTile(
                      leading: "assets/icons/location.svg",
                      title: "My Address",
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AddressScreen()));
                        //       // navigatorKeys[Base.getCurrentTab(context)]
                        //       //     ?.currentState
                        //       //     ?.pushNamed(ProfileScreen.profileScreen);
                      },
                    ),
                    DrawerListTile(
                      leading: "assets/icons/my_order.svg",
                      title: "My Orders",
                      onTap: () {
                        //       Navigator.pop(context);
                        //       // navigatorKeys[Base.getCurrentTab(context)]
                        //       //     ?.currentState
                        //       //     ?.pushNamed(ProfileScreen.profileScreen);
                      },
                    ),
                    DrawerListTile(
                      leading: "assets/icons/table.svg",
                      title: "Table Reservation",
                      onTap: () {
                        //       Navigator.pop(context);
                        //       // navigatorKeys[Base.getCurrentTab(context)]
                        //       //     ?.currentState
                        //       //     ?.pushNamed(ProfileScreen.profileScreen);
                      },
                    ),
                    DrawerListTile(
                      leading: "assets/icons/table.svg",
                      title: "My Reservation",
                      onTap: () {
                        //       Navigator.pop(context);
                        //       // navigatorKeys[Base.getCurrentTab(context)]
                        //       //     ?.currentState
                        //       //     ?.pushNamed(ProfileScreen.profileScreen);
                      },
                    ),
                    DrawerListTile(
                      leading: "assets/icons/favorites.svg",
                      title: "My Favorites",
                      onTap: () {
                        //       Navigator.pop(context);
                        //       // navigatorKeys[Base.getCurrentTab(context)]
                        //       //     ?.currentState
                        //       //     ?.pushNamed(ProfileScreen.profileScreen);
                      },
                    ),
                    DrawerListTile(
                      leading: "assets/icons/gif.svg",
                      title: "Gift Cards",
                      onTap: () {
                        //       Navigator.pop(context);
                        //       // navigatorKeys[Base.getCurrentTab(context)]
                        //       //     ?.currentState
                        //       //     ?.pushNamed(ProfileScreen.profileScreen);
                      },
                    ),
                    DrawerListTile(
                      leading: "assets/icons/drawer_refer.svg",
                      title: "Refer & Earn",
                      onTap: () {
                        //       Navigator.pop(context);
                        //       // navigatorKeys[Base.getCurrentTab(context)]
                        //       //     ?.currentState
                        //       //     ?.pushNamed(ProfileScreen.profileScreen);
                      },
                    ),
                    DrawerListTile(
                      leading: "assets/icons/loyalty_point.svg",
                      title: "Reward/Loyalty Points",
                      onTap: () {
                        //       Navigator.pop(context);
                        //       // navigatorKeys[Base.getCurrentTab(context)]
                        //       //     ?.currentState
                        //       //     ?.pushNamed(ProfileScreen.profileScreen);
                      },
                    ),
                    DrawerListTile(
                      leading: "assets/icons/feedback.svg",
                      title: "Restaurant Feedback",
                      onTap: () {
                        //       Navigator.pop(context);
                        //       // navigatorKeys[Base.getCurrentTab(context)]
                        //       //     ?.currentState
                        //       //     ?.pushNamed(ProfileScreen.profileScreen);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
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
                  //     backgroundColor: AppColors.primaryColor,
                  //     shape: RoundedRectangleBorder(
                  //       borderRadius: BorderRadius.circular(5),
                  //     )),
                  onPressed: () {
                    // Navigator.pop(context);
                    // showLogoutDialog(context).then((value) {
                    //   if (value != null) {
                    //     if (value) {
                    //       //userStateContainerState.logOutUser().then((value) {
                    //       if (value) {
                    //         // sharedStore.closeSession();
                    //         // userStateContainerState.updateUser(
                    //         //     userResponseModel: null);
                    //         // userStateContainerState
                    //         //     .updateLoggedStatus(false)

                    //         Navigator.pushReplacementNamed(
                    //           context,
                    //           LoginScreen.loginScreen,
                    //         );
                    //       }
                    //       //});
                    //     }
                    //   }
                    // });
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Log Out ",
                        style: TextStyle(color: Colors.white),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      SvgPicture.asset(
                        "assets/icons/login_submit.svg",
                        color: Colors.white,
                      ),
                    ],
                  )),
            ),
          )
        ],
      ),
    );
  }
}

