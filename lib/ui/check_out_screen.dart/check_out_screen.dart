import 'dart:async';

import 'package:chef_bites/ui/base/base.dart';
import 'package:chef_bites/utils/app_colors.dart';
import 'package:chef_bites/utils/cb_toast.dart';
import 'package:chef_bites/widget/appbar/app_bar.dart';
import 'package:chef_bites/widget/appbar/common_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CheckOutScreen extends StatefulWidget {
  const CheckOutScreen({Key? key}) : super(key: key);

  @override
  State<CheckOutScreen> createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends State<CheckOutScreen> {
  Set<Marker> markers = Set.from([]);
  Completer<GoogleMapController> _controller = Completer();
  addMarker(LatLng latLng) {
    markers.add(
      Marker(
        markerId: MarkerId("SELF"),
        position: latLng,
        // infoWindow: InfoWindow(title: "${widget.title}"),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWithBgColor(
        context: context,
        child: CommonAppBar(
          isNeedCenterTitle: "Checkout",
          isNeedLeading: false,
          isNeedAction: true,
          isNeedCenterTitleWidget: false,
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
      bottomNavigationBar: Container(
        height: 60,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: AppColors.whiteColor,
            boxShadow: [
              BoxShadow(
                  color: AppColors.shodowColor.withOpacity(0.2), blurRadius: 5)
            ],
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30))),
        child: Padding(
          padding:
              const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
          child: Row(
            children: [
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
                      Navigator.pushNamedAndRemoveUntil(
                          context, Base.base, (route) => false);
                      CbToast.instance
                          .successMessage(context, "Order successfull");
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Order with",
                          style: TextStyle(
                              color: AppColors.whiteColor,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        SizedBox(
                          child: Row(
                            children: [
                              SizedBox(
                                height: 15,
                                width: 15,
                                child: SvgPicture.asset(
                                  "assets/icons/apple.svg",
                                  fit: BoxFit.fill,
                                  color: AppColors.whiteColor,
                                ),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "Pay",
                                style: TextStyle(
                                    color: AppColors.whiteColor,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 254,
              child: GoogleMap(
                zoomControlsEnabled: false,
                indoorViewEnabled: true,
                myLocationButtonEnabled: true,
                myLocationEnabled: true,
                markers: markers,
                onTap: (latlng) {
                  if (markers.isNotEmpty) {
                    markers.clear();
                  }
                  addMarker(latlng);
                },
                initialCameraPosition: const CameraPosition(
                  target: LatLng(10.648591418478, 78.40906685608),
                  zoom: 12,
                ),
                onMapCreated: (GoogleMapController controller) {
                  _controller.complete(controller);
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Picking up",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Upper West Side ",
                            style: TextStyle(
                                fontWeight: FontWeight.w800, fontSize: 14),
                          ),
                          Text(
                            "2030 Broadway, New York, NY, 10023",
                            style: TextStyle(
                                fontWeight: FontWeight.w800,
                                fontSize: 14,
                                color: AppColors.notificationTitleColor),
                          )
                        ],
                      ),
                      Spacer(),
                      Icon(
                        Icons.keyboard_arrow_right,
                        color: AppColors.notificationTitleColor,
                      )
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 10,
                      bottom: 10,
                    ),
                    child: Divider(),
                  ),
                  Row(
                    children: [
                      Text(
                        "Picking Time",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      Spacer(),
                      SvgPicture.asset("assets/icons/pickup.svg"),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "7-17 min",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 10,
                      bottom: 10,
                    ),
                    child: Divider(),
                  ),
                  Row(
                    children: [
                      Text(
                        "Payment Method",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      Spacer(),
                      Icon(
                        Icons.keyboard_arrow_down,
                        color: AppColors.notificationTitleColor,
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      SvgPicture.asset("assets/icons/apple_pay_logo.svg"),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Apple Pay",
                        style: TextStyle(
                            color: AppColors.notificationTitleColor,
                            fontSize: 14),
                      )
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 10,
                      bottom: 10,
                    ),
                    child: Divider(),
                  ),
                  Row(
                    children: [
                      Text(
                        "Add a promo",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      Spacer(),
                      Icon(
                        Icons.keyboard_arrow_right,
                        color: AppColors.notificationTitleColor,
                      )
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 10,
                      bottom: 10,
                    ),
                    child: Divider(),
                  ),
                  Row(
                    children: [
                      Text(
                        "Order Summary",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      Spacer(),
                      Icon(
                        Icons.keyboard_arrow_down,
                        color: AppColors.notificationTitleColor,
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            "Sub Total",
                            style: TextStyle(
                                fontWeight: FontWeight.w800, fontSize: 14),
                          ),
                          Spacer(),
                          Text(
                            "\$ 200",
                            style: TextStyle(
                                fontWeight: FontWeight.w800, fontSize: 14),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Text(
                            "After Discount",
                            style: TextStyle(
                                fontWeight: FontWeight.w800, fontSize: 14),
                          ),
                          Spacer(),
                          Text(
                            "\$ 200",
                            style: TextStyle(
                                fontWeight: FontWeight.w800, fontSize: 14),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Text(
                            "Tax",
                            style: TextStyle(
                                fontWeight: FontWeight.w800, fontSize: 14),
                          ),
                          Spacer(),
                          Text(
                            "\$ 200",
                            style: TextStyle(
                                fontWeight: FontWeight.w800, fontSize: 14),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Text(
                            "Total Due",
                            style: TextStyle(
                                fontWeight: FontWeight.w800, fontSize: 14),
                          ),
                          Spacer(),
                          Text(
                            "\$ 200",
                            style: TextStyle(
                                fontWeight: FontWeight.w800, fontSize: 14),
                          )
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10, bottom: 10),
                        child: Divider(),
                      ),
                      Row(
                        children: [
                          Text(
                            "Total Payable Amount",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                          Spacer(),
                          Text(
                            "\$ 800",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
