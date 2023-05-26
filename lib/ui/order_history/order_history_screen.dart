import 'dart:ui';

import 'package:chef_bites/model/cart_model.dart';
import 'package:chef_bites/model/order_history_model.dart';
import 'package:chef_bites/utils/app_colors.dart';
import 'package:chef_bites/utils/functions.dart';
import 'package:chef_bites/widget/appbar/app_bar.dart';
import 'package:chef_bites/widget/appbar/common_appbar.dart';
import 'package:chef_bites/widget/order_history_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class OrderHistoryScreen extends StatefulWidget {
  const OrderHistoryScreen({Key? key}) : super(key: key);

  @override
  State<OrderHistoryScreen> createState() => _OrderHistoryScreenState();
}

class _OrderHistoryScreenState extends State<OrderHistoryScreen> {
  List<OrderHistoryModel> orderHistoryList = [
    OrderHistoryModel(
      id: "1",
      imgUrl: "assets/images/branch1.png",
      title: "La Pino'z Pizza",
      veg_or_nonVeg: "Pure veg",
      country_type: "Asian",
      member_type: "Family",
      price: "200",
      date: "20 Feb 2023 at 09:30 PM",
      orderHistoryDetail: [
        OrderHistoryDetail(
          id: "1",
          title: "Veggie Delight Pizza",
          subTitle: "(1x) Veggie Delight Pizza Med",
          price: "200",
          qty: "1",
        ),
        OrderHistoryDetail(
          id: "2",
          title: "Pepperoni Pizza",
          subTitle: "(1x) Pepperoni Pizza Med",
          price: "200",
          qty: "1",
        ),
      ],
    ),
    OrderHistoryModel(
      id: "2",
      imgUrl: "assets/images/branch1.png",
      title: "La Pino'z Pizza",
      veg_or_nonVeg: "Pure veg",
      country_type: "Asian",
      member_type: "Family",
      price: "200",
      date: "20 Feb 2023 at 09:30 PM",
      orderHistoryDetail: [
        OrderHistoryDetail(
          id: "1",
          title: "Veggie Delight Pizza",
          subTitle: "(1x) Veggie Delight Pizza Med",
          price: "200",
          qty: "1",
        ),
        OrderHistoryDetail(
          id: "2",
          title: "Pepperoni Pizza",
          subTitle: "(1x) Pepperoni Pizza Med",
          price: "200",
          qty: "1",
        ),
      ],
    ),
  ];

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWithBgColor(
        context: context,
        child: CommonAppBar(
          isNeedCenterTitle: "Orders History",
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
              // Navigator.pop(context);
            },
            child: Transform.scale(
              scale: 0.6,
              child: SvgPicture.asset(
                "assets/icons/profile.svg",
              ),
            ),
          ),
        ),
      ),
      body: ScrollConfiguration(
        behavior: NoGlow(),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: ListView.separated(
                  scrollDirection: Axis.vertical,
                  primary: false,
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  itemCount: orderHistoryList.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                        onTap: () {
                          // selected(index);
                        },
                        child: OrderHistoryWidget(
                            orderHistoryModel: orderHistoryList[index]));
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(
                      height: 10,
                    );
                  },
                ),
              ),
              SizedBox(height: 60,)
            ],
          ),
        ),
      ),
    );
  }
}
