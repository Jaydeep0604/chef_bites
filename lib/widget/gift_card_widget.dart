import 'package:chef_bites/model/gift_card_model.dart';
import 'package:chef_bites/utils/app_colors.dart';
import 'package:chef_bites/utils/functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class GiftCardActiveCardWidget extends StatefulWidget {
  GiftCardActiveCardWidget({Key? key, required this.giftCardModel})
      : super(key: key);
  GiftCardModel giftCardModel;

  @override
  State<GiftCardActiveCardWidget> createState() =>
      _GiftCardActiveCardWidgetState();
}

class _GiftCardActiveCardWidgetState extends State<GiftCardActiveCardWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (widget.giftCardModel.active == true)
          SizedBox(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                "Gift card ID",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 14),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              InkWell(
                                  onTap: () {
                                    showModalBottomSheet(
                                      isScrollControlled: true,
                                      backgroundColor: Colors.white,
                                      // isDismissible: false,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(20),
                                            topRight: Radius.circular(20)),
                                      ),
                                      context: context,
                                      builder: (context) {
                                        final MediaQueryData mediaQueryData =
                                            MediaQuery.of(context);
                                        return Padding(
                                          padding: mediaQueryData.viewInsets,
                                          child: ScrollConfiguration(
                                            behavior: NoGlow(),
                                            child: SingleChildScrollView(
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(20),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              "Gift Card Details",
                                                              style: TextStyle(
                                                                  fontSize: 16,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            ),
                                                            Text(
                                                              "QR Code",
                                                              style: TextStyle(
                                                                fontSize: 12,
                                                                color: AppColors.primaryColor
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                        Spacer(),
                                                        Container(
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  horizontal: 9,
                                                                  vertical: 6),
                                                          decoration: BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5),
                                                              border: Border.all(
                                                                  color: AppColors
                                                                      .primaryColor)),
                                                          child: Text(
                                                            "Send Gift Card",
                                                            style: TextStyle(
                                                                color: AppColors
                                                                    .primaryColor,
                                                                fontSize: 14),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                          top: 10, bottom: 10),
                                                      child: Divider(),
                                                    ),
                                                    Row(
                                                      children: [
                                                        Expanded(
                                                          child: Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                "Gift card ID",
                                                                style: TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    fontSize:
                                                                        14),
                                                              ),
                                                              Text(
                                                                "2425",
                                                                style: TextStyle(
                                                                    color: AppColors
                                                                        .notificationTitleColor,
                                                                    fontSize:
                                                                        12),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        Expanded(
                                                          child: Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                "Purchased date ",
                                                                style: TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    fontSize:
                                                                        14),
                                                              ),
                                                              Text(
                                                                "15 may 2023",
                                                                style: TextStyle(
                                                                    color: AppColors
                                                                        .notificationTitleColor,
                                                                    fontSize:
                                                                        12),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 20,
                                                    ),
                                                    Row(
                                                      children: [
                                                        Expanded(
                                                          child: Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                "Current balance",
                                                                style: TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    fontSize:
                                                                        14),
                                                              ),
                                                              Text(
                                                                "\$ 4.0",
                                                                style: TextStyle(
                                                                    color: AppColors
                                                                        .notificationTitleColor,
                                                                    fontSize:
                                                                        12),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        Expanded(
                                                          child: Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                "Purchased time",
                                                                style: TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    fontSize:
                                                                        14),
                                                              ),
                                                              Text(
                                                                "07:30 PM",
                                                                style: TextStyle(
                                                                    color: AppColors
                                                                        .notificationTitleColor,
                                                                    fontSize:
                                                                        12),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 20,
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 15,
                                                              bottom: 5),
                                                      child: Expanded(
                                                        child: Container(
                                                          height: 40,
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5),
                                                            gradient:
                                                                const LinearGradient(
                                                              colors: [
                                                                AppColors
                                                                    .primaryColor,
                                                                Color(
                                                                    0xFFFFC56B),
                                                              ],
                                                              begin: Alignment
                                                                  .centerLeft,
                                                              end: Alignment
                                                                  .centerRight,
                                                              tileMode: TileMode
                                                                  .repeated,
                                                            ),
                                                          ),
                                                          child: TextButton(
                                                            // style: TextButton.styleFrom(
                                                            //     backgroundColor: Colors.amber),
                                                            onPressed: () {
                                                              Navigator.pop(
                                                                  context);
                                                            },
                                                            child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Text(
                                                                  "Add Fund",
                                                                  style: TextStyle(
                                                                      color: AppColors
                                                                          .whiteColor,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                                ),
                                                                SizedBox(
                                                                  width: 10,
                                                                ),
                                                                SvgPicture
                                                                    .asset(
                                                                  "assets/icons/gif.svg",
                                                                  color: AppColors
                                                                      .whiteColor,
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                  child:
                                      SvgPicture.asset("assets/icons/info.svg"))
                            ],
                          ),
                          SizedBox(
                            height: 2,
                          ),
                          Text(
                            widget.giftCardModel.gift_card_id,
                            style: TextStyle(
                                fontSize: 12,
                                color: AppColors.notificationTitleColor),
                          ),
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: AppColors.primaryColor),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: 9, right: 9, top: 7, bottom: 7),
                          child: Text(
                            "Send Gift Card",
                            style: TextStyle(
                                fontSize: 14, color: AppColors.primaryColor),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Current balance",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 14),
                          ),
                          SizedBox(
                            height: 2,
                          ),
                          Text(
                            "\$ ${widget.giftCardModel.current_balance}",
                            style: TextStyle(
                                fontSize: 12,
                                color: AppColors.notificationTitleColor),
                          ),
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        showModalBottomSheet(
                            context: context,
                            backgroundColor: Colors.transparent,
                            builder: (context) {
                              return Container(
                                decoration: BoxDecoration(
                                  color: AppColors.whiteColor,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      topRight: Radius.circular(20)),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(20),
                                  child: SizedBox(
                                      height: 320,
                                      width: 320,
                                      child: Image.asset(
                                        "assets/images/qr_code.png",
                                        fit: BoxFit.fill,
                                      )),
                                ),
                              );
                            });
                      },
                      child: Text(
                        "QR Code",
                        style: TextStyle(
                            fontSize: 12, color: AppColors.primaryColor),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10, bottom: 10),
                  child: Divider(),
                )
              ],
            ),
          ),
      ],
    );
  }
}

class GiftCardRedeemedWidget extends StatefulWidget {
  GiftCardRedeemedWidget({Key? key, required this.giftCardModel})
      : super(key: key);
  GiftCardModel giftCardModel;

  @override
  State<GiftCardRedeemedWidget> createState() => _GiftCardRedeemedWidgetState();
}

class _GiftCardRedeemedWidgetState extends State<GiftCardRedeemedWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (widget.giftCardModel.redeemed == true)
          SizedBox(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                "Gift card ID",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 14),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              InkWell(
                                  onTap: () {
                                    showModalBottomSheet(
                                        isScrollControlled: true,
                                        backgroundColor: Colors.white,
                                        // isDismissible: false,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(20),
                                              topRight: Radius.circular(20)),
                                        ),
                                        context: context,
                                        builder: (context) {
                                          final MediaQueryData mediaQueryData =
                                              MediaQuery.of(context);
                                          return Padding(
                                            padding: mediaQueryData.viewInsets,
                                            child: ScrollConfiguration(
                                              behavior: NoGlow(),
                                              child: SingleChildScrollView(
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(20),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        "Gift Card Details",
                                                        style: TextStyle(
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                top: 10,
                                                                bottom: 10),
                                                        child: Divider(),
                                                      ),
                                                      Row(
                                                        children: [
                                                          Expanded(
                                                            child: Column(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  "Gift card ID",
                                                                  style: TextStyle(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      fontSize:
                                                                          14),
                                                                ),
                                                                Text(
                                                                  "2425",
                                                                  style: TextStyle(
                                                                      color: AppColors
                                                                          .notificationTitleColor,
                                                                      fontSize:
                                                                          12),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Expanded(
                                                            child: Column(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  "Purchased date ",
                                                                  style: TextStyle(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      fontSize:
                                                                          14),
                                                                ),
                                                                Text(
                                                                  "15 may 2023",
                                                                  style: TextStyle(
                                                                      color: AppColors
                                                                          .notificationTitleColor,
                                                                      fontSize:
                                                                          12),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(height: 20,),
                                                      Row(
                                                        children: [
                                                          Expanded(
                                                            child: Column(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  "Purchased time",
                                                                  style: TextStyle(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      fontSize:
                                                                          14),
                                                                ),
                                                                Text(
                                                                  "07:30 PM",
                                                                  style: TextStyle(
                                                                      color: AppColors
                                                                          .notificationTitleColor,
                                                                      fontSize:
                                                                          12),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                top: 10,
                                                                bottom: 10),
                                                        child: Divider(),
                                                      ),
                                                      Text(
                                                        "Transaction History",
                                                        style: TextStyle(
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                      SizedBox(height: 20,),
                                                      Row(
                                                        children: [
                                                          Expanded(
                                                            child: Column(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  "Restaurant address",
                                                                  style: TextStyle(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      fontSize:
                                                                          14),
                                                                ),
                                                                Text(
                                                                  "Restaurant address here",
                                                                  style: TextStyle(
                                                                      color: AppColors
                                                                          .notificationTitleColor,
                                                                      fontSize:
                                                                          12),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Expanded(
                                                            child: Column(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  "Order ",
                                                                  style: TextStyle(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      fontSize:
                                                                          14),
                                                                ),
                                                                Text(
                                                                  "#9607",
                                                                  style: TextStyle(
                                                                      color: AppColors
                                                                          .notificationTitleColor,
                                                                      fontSize:
                                                                          12),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(height: 20,),
                                                      Row(
                                                        children: [
                                                          Expanded(
                                                            child: Column(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  "Date",
                                                                  style: TextStyle(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      fontSize:
                                                                          14),
                                                                ),
                                                                Text(
                                                                  "10 may 2023",
                                                                  style: TextStyle(
                                                                      color: AppColors
                                                                          .notificationTitleColor,
                                                                      fontSize:
                                                                          12),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Expanded(
                                                            child: Column(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  "Time",
                                                                  style: TextStyle(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      fontSize:
                                                                          14),
                                                                ),
                                                                Text(
                                                                  "10:30 PM",
                                                                  style: TextStyle(
                                                                      color: AppColors
                                                                          .notificationTitleColor,
                                                                      fontSize:
                                                                          12),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(height: 20,),
                                                      Row(
                                                        children: [
                                                          Expanded(
                                                            child: Column(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  "Redeemed Amount",
                                                                  style: TextStyle(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      fontSize:
                                                                          14),
                                                                ),
                                                                Text(
                                                                  "50",
                                                                  style: TextStyle(
                                                                      color: AppColors
                                                                          .notificationTitleColor,
                                                                      fontSize:
                                                                          12),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Expanded(
                                                            child: Column(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  "Current balance",
                                                                  style: TextStyle(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      fontSize:
                                                                          14),
                                                                ),
                                                                Text(
                                                                  "\$ 20",
                                                                  style: TextStyle(
                                                                      color: AppColors
                                                                          .notificationTitleColor,
                                                                      fontSize:
                                                                          12),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(height: 20,),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                top: 15,
                                                                bottom: 5),
                                                        child: Expanded(
                                                          child: Container(
                                                            height: 40,
                                                            decoration:
                                                                BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5),
                                                              gradient:
                                                                  const LinearGradient(
                                                                colors: [
                                                                  AppColors
                                                                      .primaryColor,
                                                                  Color(
                                                                      0xFFFFC56B),
                                                                ],
                                                                begin: Alignment
                                                                    .centerLeft,
                                                                end: Alignment
                                                                    .centerRight,
                                                                tileMode: TileMode
                                                                    .repeated,
                                                              ),
                                                            ),
                                                            child: TextButton(
                                                              // style: TextButton.styleFrom(
                                                              //     backgroundColor: Colors.amber),
                                                              onPressed: () {
                                                                Navigator.pop(
                                                                    context);
                                                              },
                                                              child: Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Text(
                                                                    "Add Fund",
                                                                    style: TextStyle(
                                                                        color: AppColors
                                                                            .whiteColor,
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                  SizedBox(
                                                                    width: 10,
                                                                  ),
                                                                  SvgPicture
                                                                      .asset(
                                                                    "assets/icons/gif.svg",
                                                                    color: AppColors
                                                                        .whiteColor,
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          );
                                        });
                                  },
                                  child:
                                      SvgPicture.asset("assets/icons/info.svg"))
                            ],
                          ),
                          SizedBox(
                            height: 2,
                          ),
                          Text(
                            widget.giftCardModel.gift_card_id,
                            style: TextStyle(
                                fontSize: 12,
                                color: AppColors.notificationTitleColor),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Current balance",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 14),
                          ),
                          SizedBox(
                            height: 2,
                          ),
                          Text(
                            "\$ ${widget.giftCardModel.current_balance}",
                            style: TextStyle(
                                fontSize: 12,
                                color: AppColors.notificationTitleColor),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10, bottom: 10),
                  child: Divider(),
                )
              ],
            ),
          ),
      ],
    );
  }
}
