import 'dart:async';

import 'package:chef_bites/model/cart_model.dart';
import 'package:chef_bites/navigator/tab_item.dart';
import 'package:chef_bites/ui/base/base.dart';
import 'package:chef_bites/utils/app_colors.dart';
import 'package:chef_bites/utils/functions.dart';
import 'package:chef_bites/widget/appbar/app_bar.dart';
import 'package:chef_bites/widget/appbar/common_appbar.dart';
import 'package:chef_bites/widget/order_tracking_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:another_stepper/another_stepper.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({Key? key}) : super(key: key);
  static const orderScreen = "/orderscreen";

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
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

  List<CartItemModel> pizzaList = [
    CartItemModel(
        id: "1",
        title: "Special Comdo",
        subTitle: "(1x) pepperoini pizza, (1x) Hawaiian Pizza Med",
        customised: true,
        price: "200",
        qty: "1"),
    CartItemModel(
        id: "2",
        title: "BBQ Chicken Pizza Lg",
        subTitle: "Large 16, Cheese Bust",
        customised: false,
        price: "200",
        qty: "1")
  ];
  List<StepperData> stepperData = [
    StepperData(
        title: StepperText(
          "Ordered",
          textStyle: const TextStyle(
              color: AppColors.notificationTitleColor, fontSize: 16),
        ),
        iconWidget: Container(
          //padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.all(
                Radius.circular(30),
              ),
              boxShadow: [
                BoxShadow(
                    blurRadius: 4,
                    color: AppColors.primaryColor.withOpacity(0.4),
                    spreadRadius: 4)
              ]),
        )),
    StepperData(
        title: StepperText(
          "Food being prepared",
          textStyle: const TextStyle(
              color: AppColors.notificationTitleColor, fontSize: 16),
        ),
        iconWidget: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.all(
                Radius.circular(30),
              ),
              boxShadow: [
                BoxShadow(
                    blurRadius: 4,
                    color: AppColors.primaryColor.withOpacity(0.4),
                    spreadRadius: 4)
              ]),
        )),
    StepperData(
        title: StepperText(
          "Ready for pickup",
          textStyle: const TextStyle(
              color: AppColors.notificationTitleColor, fontSize: 16),
        ),
        iconWidget: Container(
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.all(
                Radius.circular(30),
              ),
              boxShadow: [
                BoxShadow(
                    blurRadius: 4,
                    color: AppColors.primaryColor.withOpacity(0.4),
                    spreadRadius: 4)
              ]),
        )),
    StepperData(
        title: StepperText("Order picked up",
            textStyle: const TextStyle(
                color: AppColors.notificationTitleColor, fontSize: 16)),
        iconWidget: Container(
          padding: const EdgeInsets.all(8),
          decoration: const BoxDecoration(
              color: AppColors.whiteColor,
              borderRadius: BorderRadius.all(Radius.circular(30))),
        )),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWithBgColor(
        context: context,
        child: CommonAppBar(
          isNeedCenterTitle: "Order Tracking",
          isNeedLeading: false,
          isNeedAction: false,
          leadingIcon: GestureDetector(
            onTap: () async {
              bool isPop = await navigatorKey[Base.getCurrentTab(context)]!
                  .currentState!
                  .maybePop();
              if (!isPop) {
                Base.switchTab(context, MyTabItem.home);
              }
            },
            child: Transform.scale(
              scale: 0.7,
              child: SvgPicture.asset(
                "assets/icons/back.svg",
              ),
            ),
          ),
          // action: GestureDetector(
          //   onTap: () {
          //     Navigator.pushNamedAndRemoveUntil(
          //         context, Base.base, (route) => false);
          //   },
          //   child: Transform.scale(
          //     scale: 0.6,
          //     child: SvgPicture.asset(
          //       "assets/icons/home_icon.svg",
          //     ),
          //   ),
          // ),
        ),
      ),
      body: ScrollConfiguration(
        behavior: NoGlow(),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        "La Pino’z Pizza",
                        style:
                            TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "Order ID",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 14),
                        ),
                        Text(
                          "84739463723231273",
                          style: TextStyle(fontSize: 12),
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Divider(),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: ListView.separated(
                    scrollDirection: Axis.vertical,
                    primary: false,
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    itemCount: pizzaList.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                          onTap: () {
                            // selected(index);
                          },
                          child: OrderTrackingWidget(
                              cartItemModel: pizzaList[index]));
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return const SizedBox(
                        child: Divider(),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  child: Divider(),
                ),
                Text(
                  "Restaurant name",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  child: Divider(),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: ListView.separated(
                    scrollDirection: Axis.vertical,
                    primary: false,
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    itemCount: pizzaList.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                          onTap: () {
                            // selected(index);
                          },
                          child: OrderTrackingWidget(
                              cartItemModel: pizzaList[index]));
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return const SizedBox(
                        child: Divider(),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.offwhiteColor),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 25,top: 10),
                    child: AnotherStepper(
                      stepperList: stepperData,
                      stepperDirection: Axis.vertical,
                      iconWidth: 16,
                      iconHeight: 16,
                      activeBarColor: AppColors.primaryColor,
                      inActiveBarColor: AppColors.notificationTitleColor,
                      inverted: false,
                      verticalGap: 20,
                      activeIndex: 2,
                      barThickness: 1,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 285,
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
                      zoom: 14,
                    ),
                    onMapCreated: (GoogleMapController controller) {
                      _controller.complete(controller);
                    },
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
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
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Call Restaurant",
                            style: TextStyle(color: Colors.white),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          SvgPicture.asset(
                            "assets/icons/dail.svg",
                            color: AppColors.whiteColor,
                          ),
                        ],
                      )),
                ),
                SizedBox(
                  height: 70,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
