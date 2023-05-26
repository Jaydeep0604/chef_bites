import 'package:chef_bites/main.dart';
import 'package:chef_bites/model/cart_model.dart';
import 'package:chef_bites/ui/check_out_screen.dart/check_out_screen.dart';
import 'package:chef_bites/ui/profile/my_profile_screen.dart';
import 'package:chef_bites/ui/search/search_screen.dart';
import 'package:chef_bites/utils/app_colors.dart';
import 'package:chef_bites/utils/functions.dart';
import 'package:chef_bites/widget/appbar/app_bar.dart';
import 'package:chef_bites/widget/appbar/common_appbar.dart';
import 'package:chef_bites/widget/cart_item_widget.dart';
import 'package:chef_bites/widget/custom_switch_widget.dart';
import 'package:chef_bites/widget/editText.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

class ViewCartScreen extends StatefulWidget {
  const ViewCartScreen({Key? key}) : super(key: key);
  static const viewCartScreen = "/viewcartscreen";

  @override
  State<ViewCartScreen> createState() => _ViewCartScreenState();
}

class _ViewCartScreenState extends State<ViewCartScreen> {
  bool delivery = true;
  bool pickup = false;
  int itemDefalutCount = 1;
  bool utensils = false;
  bool tip5 = false;
  bool tip10 = false;
  bool tip15 = false;
  bool tipOther = false;
  List<CartItemModel> pizzaList = [
    CartItemModel(
        id: "1",
        title: "Special Comdo",
        subTitle: "(1x) pepperoini pizza, (1x) Hawaiian Pizza Med",
        customised: true,
        price: "200",
        qty: ""),
    CartItemModel(
        id: "2",
        title: "BBQ Chicken Pizza Lg",
        subTitle: "Large 16, Cheese Bust",
        customised: false,
        price: "200",
        qty: "")
  ];
  onTaputensils() {
    setState(() {
      utensils = !utensils;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ThemedContainer.darkGradient(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: CustomAppBarWithBgColor(
          context: context,
          child: CommonAppBar(
            isNeedCenterTitle: "",
            isNeedLeading: false,
            isNeedAction: true,
            isNeedCenterTitleWidget: true,
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
            centerWidgte: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyProfileScreen(),
                  ),
                );
              },
              child: Row(
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
        bottomNavigationBar: pickup
            ? Container(
                height: 60,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: AppColors.whiteColor,
                    boxShadow: [
                      BoxShadow(
                          color: AppColors.shodowColor.withOpacity(0.2),
                          blurRadius: 5)
                    ],
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 20, right: 20, top: 10, bottom: 10),
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
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => CheckOutScreen(),
                                ),
                              );
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Continue to checkout",
                                  style: TextStyle(
                                      color: AppColors.whiteColor,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                SizedBox(
                                  height: 20,
                                  width: 20,
                                  child: SvgPicture.asset(
                                    "assets/icons/order_history.svg",
                                    fit: BoxFit.fill,
                                    color: AppColors.whiteColor,
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
              )
            : SizedBox(),
        body: SafeArea(
          child: ScrollConfiguration(
            behavior: NoGlow(),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                  child: Container(
                    height: 40,
                    color: AppColors.offwhiteColor,
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      children: [
                        Expanded(
                            child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Container(
                            color: delivery
                                ? AppColors.whiteColor
                                : AppColors.offwhiteColor,
                            padding: const EdgeInsets.all(5),
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  delivery = true;
                                  pickup = false;
                                });
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    "assets/icons/delivery.svg",
                                    color: delivery
                                        ? AppColors.blackColor
                                        : AppColors.blackColor.withOpacity(0.6),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "Delivery",
                                    style: TextStyle(
                                        color: delivery
                                            ? AppColors.blackColor
                                            : AppColors.blackColor
                                                .withOpacity(0.6),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )),
                        Expanded(
                            child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Container(
                            color: pickup
                                ? AppColors.whiteColor
                                : AppColors.offwhiteColor,
                            padding: const EdgeInsets.all(5),
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  delivery = false;
                                  pickup = true;
                                });
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    "assets/icons/pickup.svg",
                                    color: pickup
                                        ? AppColors.blackColor
                                        : AppColors.blackColor.withOpacity(0.6),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "Pickup",
                                    style: TextStyle(
                                        color: pickup
                                            ? AppColors.blackColor
                                            : AppColors.blackColor
                                                .withOpacity(0.6),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ))
                      ],
                    ),
                  ),
                ),
                if (delivery)
                  Expanded(
                    child: Center(
                      child: Text(
                        "No record found",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ),
                  ),
                if (pickup)
                  Expanded(
                    child: SingleChildScrollView(
                      padding: EdgeInsets.zero,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 20, right: 20, top: 20, bottom: 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "La Pino’z Pizza",
                                  style: TextStyle(
                                      color: AppColors.blackColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                ListView.separated(
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
                                        child: CartItemWidget(
                                            cartItemModel: pizzaList[index]));
                                  },
                                  separatorBuilder:
                                      (BuildContext context, int index) {
                                    return const SizedBox(
                                      height: 10,
                                    );
                                  },
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  children: [
                                    Container(
                                      height: 20,
                                      width: 20,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          border: Border.all(
                                              color: AppColors.primaryColor,
                                              width: 2)),
                                      child: Padding(
                                        padding: EdgeInsets.all(2),
                                        child: SvgPicture.asset(
                                          "assets/icons/ad.svg",
                                          color: AppColors.primaryColor,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    const Text(
                                      "Add items",
                                      style: TextStyle(
                                          color: AppColors.primaryColor,
                                          fontSize: 16),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Divider(),
                                const SizedBox(
                                  height: 20,
                                ),
                                const Text(
                                  "Add Note",
                                  style: TextStyle(
                                      color: AppColors.notificationTitleColor,
                                      fontSize: 12),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                EditText(
                                  // controller: UserNameCtr,
                                  filled: true,
                                  color: AppColors.offwhiteColor,
                                  textInputType: TextInputType.text,
                                  hint: "Add your note here",

                                  inputformtters: [
                                    LengthLimitingTextInputFormatter(150),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Divider()
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 20, right: 20, top: 10, bottom: 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Barbeque Nation",
                                  style: TextStyle(
                                      color: AppColors.blackColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                ListView.separated(
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
                                        child: CartItemWidget(
                                            cartItemModel: pizzaList[index]));
                                  },
                                  separatorBuilder:
                                      (BuildContext context, int index) {
                                    return const SizedBox(
                                      height: 10,
                                    );
                                  },
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  children: [
                                    Container(
                                      height: 20,
                                      width: 20,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          border: Border.all(
                                              color: AppColors.primaryColor,
                                              width: 2)),
                                      child: Padding(
                                        padding: EdgeInsets.all(2),
                                        child: SvgPicture.asset(
                                          "assets/icons/ad.svg",
                                          color: AppColors.primaryColor,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    const Text(
                                      "Add items",
                                      style: TextStyle(
                                          color: AppColors.primaryColor,
                                          fontSize: 16),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Divider(),
                                const SizedBox(
                                  height: 20,
                                ),
                                const Text(
                                  "Add Note",
                                  style: TextStyle(
                                      color: AppColors.notificationTitleColor,
                                      fontSize: 12),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                EditText(
                                  // controller: UserNameCtr,
                                  filled: true,
                                  color: AppColors.offwhiteColor,
                                  textInputType: TextInputType.text,
                                  hint: "Add your note here",

                                  inputformtters: [
                                    LengthLimitingTextInputFormatter(150),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Divider()
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 20, right: 20, top: 10, bottom: 10),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: const [
                                      Text(
                                        "Utensils",
                                        style: TextStyle(
                                            color: AppColors.blackColor,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "Include disposable utensils",
                                        style: TextStyle(
                                            color: AppColors
                                                .notificationTitleColor,
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  ),
                                ),
                                CustomSwitch(
                                  value: utensils,
                                  onChanged: (bool? value) {
                                    setState(
                                      () {
                                        utensils = value!;
                                      },
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 5, bottom: 5),
                            child: Divider(),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 20, right: 20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Add Tip",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: InkWell(
                                        onTap: () {
                                          setState(() {
                                            tip5 = !tip5;
                                            tip10 = false;
                                            tip15 = false;
                                            tipOther = false;
                                          });
                                        },
                                        child: Container(
                                          padding: EdgeInsets.only(
                                              top: 11, bottom: 11),
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            color: tip5
                                                ? AppColors.primaryColor
                                                : AppColors.whiteColor,
                                            border: Border.all(
                                                color: tip5
                                                    ? AppColors.primaryColor
                                                    : AppColors
                                                        .notificationTitleColor),
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),
                                          child: Text(
                                            "\$ 5",
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: tip5
                                                    ? AppColors.whiteColor
                                                    : AppColors
                                                        .notificationTitleColor),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      child: InkWell(
                                        onTap: () {
                                          setState(() {
                                            tip5 = false;
                                            tip10 = !tip10;
                                            tip15 = false;
                                            tipOther = false;
                                          });
                                        },
                                        child: Container(
                                          padding: EdgeInsets.only(
                                              top: 11, bottom: 11),
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            color: tip10
                                                ? AppColors.primaryColor
                                                : AppColors.whiteColor,
                                            border: Border.all(
                                                color: tip10
                                                    ? AppColors.primaryColor
                                                    : AppColors
                                                        .notificationTitleColor),
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),
                                          child: Text(
                                            "\$ 10",
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: tip10
                                                    ? AppColors.whiteColor
                                                    : AppColors
                                                        .notificationTitleColor),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      child: InkWell(
                                        onTap: () {
                                          setState(() {
                                            tip5 = false;
                                            tip10 = false;
                                            tip15 = !tip15;
                                            tipOther = false;
                                          });
                                        },
                                        child: Container(
                                          padding: EdgeInsets.only(
                                              top: 11, bottom: 11),
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            color: tip15
                                                ? AppColors.primaryColor
                                                : AppColors.whiteColor,
                                            border: Border.all(
                                                color: tip15
                                                    ? AppColors.primaryColor
                                                    : AppColors
                                                        .notificationTitleColor),
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),
                                          child: Text(
                                            "\$ 15",
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: tip15
                                                    ? AppColors.whiteColor
                                                    : AppColors
                                                        .notificationTitleColor),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      child: InkWell(
                                        onTap: () {
                                          setState(() {
                                            tip5 = false;
                                            tip10 = false;
                                            tip15 = false;
                                            tipOther = !tipOther;
                                          });
                                        },
                                        child: Container(
                                          padding: EdgeInsets.only(
                                              top: 11, bottom: 11),
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            color: tipOther
                                                ? AppColors.primaryColor
                                                : AppColors.whiteColor,
                                            border: Border.all(
                                                color: tipOther
                                                    ? AppColors.primaryColor
                                                    : AppColors
                                                        .notificationTitleColor),
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),
                                          child: Text(
                                            "Other",
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: tipOther
                                                    ? AppColors.whiteColor
                                                    : AppColors
                                                        .notificationTitleColor),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 10, bottom: 10),
                            child: Divider(),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: 20, right: 20, top: 10, bottom: 20),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      "Sub Total",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w800,
                                          fontSize: 14),
                                    ),
                                    Spacer(),
                                    Text(
                                      "\$ 200",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w800,
                                          fontSize: 14),
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
                                          fontWeight: FontWeight.w800,
                                          fontSize: 14),
                                    ),
                                    Spacer(),
                                    Text(
                                      "\$ 200",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w800,
                                          fontSize: 14),
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
                                          fontWeight: FontWeight.w800,
                                          fontSize: 14),
                                    ),
                                    Spacer(),
                                    Text(
                                      "\$ 200",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w800,
                                          fontSize: 14),
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
                                          fontWeight: FontWeight.w800,
                                          fontSize: 14),
                                    ),
                                    Spacer(),
                                    Text(
                                      "\$ 200",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w800,
                                          fontSize: 14),
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
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16),
                                    ),
                                    Spacer(),
                                    Text(
                                      "\$ 800",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16),
                                    )
                                  ],
                                ),
                              ],
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
      ),
    );
  }
}

class KSTheme {
  static ThemeData dark = ThemeData.dark().copyWith(
      primaryColorDark: AppColors.primaryColor,
      scaffoldBackgroundColor: Colors.transparent,
      brightness: Brightness.dark,
      hintColor: AppColors.notificationTitleColor,
      cursorColor: Colors.white,
      bottomNavigationBarTheme:
          ThemeData.dark().bottomNavigationBarTheme.copyWith(
                backgroundColor: AppColors.bottomBackgroundColor,
                selectedItemColor: Colors.white,
                unselectedItemColor: Color.fromARGB(255, 88, 88, 88),
              ),
      inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: AppColors.notificationTitleColor,
          labelStyle: TextStyle(
            color: Colors.black,
          ),
          // hintStyle: Theme.of(context).textTheme.bodyText1,
          // labelStyle: TextStyle(color: Colors.blueGrey),
          // label: widget.name != null ? Text(widget.name ?? "") : null,
          border: OutlineInputBorder(
            borderSide:
                BorderSide(color: AppColors.notificationTitleColor, width: 0.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: AppColors.notificationTitleColor, width: 0.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: AppColors.notificationTitleColor, width: 0.0),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: AppColors.notificationTitleColor, width: 0.0),
          ),
          errorBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: AppColors.notificationTitleColor, width: 0.0),
          )));

  static ThemeData light = ThemeData.light().copyWith(
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.whiteColor,
    hintColor: Colors.black,
    cursorColor: Colors.black,
    // highlightColor: Color(0xffffc600),
    // splashColor: const Color(0xffFFC600),
    textTheme: ThemeData.light().textTheme.copyWith(
          caption: TextStyle(
            color: Colors.black87,
          ),
          bodyText1: TextStyle(
            // fontFamily: KSMFontFamily.robotoRgular,
            fontSize: 14,
            color: Colors.black,
          ),
        ),
    bottomNavigationBarTheme: ThemeData.dark()
        .bottomNavigationBarTheme
        .copyWith(
            backgroundColor: Colors.white,
            selectedItemColor: Colors.black,
            unselectedItemColor: Color.fromARGB(255, 74, 74, 74)),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.whiteColor,
      labelStyle: TextStyle(color: Colors.black),
      // hintStyle: Theme.of(context).textTheme.bodyText1,
      // labelStyle: TextStyle(color: Colors.blueGrey),
      // label: widget.name != null ? Text(widget.name ?? "") : null,
      border: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.whiteColor, width: 0.0),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.whiteColor, width: 0.0),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.whiteColor, width: 0.0),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.whiteColor, width: 0.0),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.whiteColor, width: 0.0),
      ),
    ),
  );

  static const Gradient lightGradient = RadialGradient(
    colors: [
      Color.fromARGB(255, 4, 41, 54),
      Colors.black,
    ],
    center: Alignment.topCenter,
    stops: [0.000002, 1.3],
    focal: Alignment.topCenter,
    focalRadius: 0.000001,
    tileMode: TileMode.decal,
    radius: 0.6,
  );
  static const Gradient darkGradient = RadialGradient(
      colors: [
        Color.fromARGB(255, 2, 68, 94),
        Color.fromARGB(255, 2, 68, 94),
        Colors.black,
      ],
      center: Alignment.topCenter,
      stops: [0.01, 0.1, 1.3],
      focal: Alignment.topCenter,
      focalRadius: 0.000001,
      radius: 0.67,
      tileMode: TileMode.decal);
}

class ThemedContainer extends StatelessWidget {
  final Widget child;
  Gradient? _gradient;
  ThemedContainer({Key? key, required this.child, Gradient? gradient})
      : super(key: key) {
    this._gradient = gradient ?? KSTheme.lightGradient;
  }

  factory ThemedContainer.darkGradient({
    required Widget child,
    Key? key,
  }) {
    return ThemedContainer(
      child: child,
      gradient: KSTheme.darkGradient,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        color: Colors.black,
        gradient:
            MyApp.themeNotifier.value == ThemeMode.dark ? _gradient : null,
      ),
      child: child,
    );
  }
}
