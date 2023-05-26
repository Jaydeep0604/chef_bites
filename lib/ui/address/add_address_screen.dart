import 'dart:async';

import 'package:chef_bites/model/address_model.dart';
import 'package:chef_bites/ui/base/base.dart';
import 'package:chef_bites/utils/app_colors.dart';
import 'package:chef_bites/utils/functions.dart';
import 'package:chef_bites/widget/appbar/app_bar.dart';
import 'package:chef_bites/widget/appbar/common_appbar.dart';
import 'package:chef_bites/widget/editText.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddAddressScreen extends StatefulWidget {
  const AddAddressScreen({Key? key}) : super(key: key);
  static const addAddressscreen='/addaddressscreen';

  @override
  State<AddAddressScreen> createState() => _AddAddressScreenState();
}

class _AddAddressScreenState extends State<AddAddressScreen> {
  Set<Marker> markers = Set.from([]);
  Completer<GoogleMapController> _controller = Completer();
  final _formKey = GlobalKey<FormState>();
  addMarker(LatLng latLng) {
    markers.add(
      Marker(
        markerId: MarkerId("SELF"),
        position: latLng,
        // infoWindow: InfoWindow(title: "${widget.title}"),
      ),
    );
  }

  bool home = true;
  bool office = false;
  bool other = false;
  @override
  void initState() {
    super.initState();
  }

  void selectHome() {
    setState(() {
      home = true;
      office = false;
      other = false;
    });
  }

  void selectOffice() {
    setState(() {
      home = false;
      office = true;
      other = false;
    });
  }

  void selectOther() {
    setState(() {
      home = false;
      office = false;
      other = true;
    });
  }

  bool Bhome = true;
  bool Boffice = false;
  bool Bother = false;

  List<AddressModel> addressList = [
    AddressModel(
        id: "1",
        addressType: "Home",
        address:
            "Home, Reference site about Lorem Ipsum, giving information on its origins, as well as a random Lipsum generator."),
    AddressModel(
        id: "2",
        addressType: "Office",
        address:
            "Office, Reference site about Lorem Ipsum, giving information on its origins, as well as a random Lipsum generator."),
    AddressModel(
        id: "3",
        addressType: "Other",
        address:
            "Other, Reference site about Lorem Ipsum, giving information on its origins, as well as a random Lipsum generator."),
  ];
  GlobalKey<ScaffoldState> _scaffoldkey=GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldkey,
      backgroundColor: AppColors.offwhiteColor,
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: CustomAppBarWithBgColor(
        context: context,
        child: CommonAppBar(
          isNeedCenterTitle: "Current Location",
          isNeedLeading: false,
          isNeedAction: true,
          leadingIcon: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: GestureDetector(
              onTap: () {
                // Base.openDrawer(context);
                Navigator.pop(context);
              },
              child: Transform.scale(
                scale: 0.8,
                child: SvgPicture.asset(
                  "assets/icons/back.svg",
                ),
              ),
            ),
          ),
          action: InkWell(
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
        height: 210,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            )),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Your Location",
                  style: TextStyle(
                      fontSize: 19,
                      color: AppColors.blackColor,
                      fontWeight: FontWeight.bold)),
              const SizedBox(
                height: 12,
              ),
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      selectHome();
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: home
                              ? AppColors.primaryColor.withOpacity(0.2)
                              : AppColors.offwhiteColor,
                          borderRadius: BorderRadius.circular(5)),
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text(
                          "Home",
                          style: TextStyle(
                              fontSize: 14,
                              color: home
                                  ? AppColors.primaryColor
                                  : AppColors.notificationTitleColor),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  InkWell(
                    onTap: () {
                      selectOffice();
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: office
                              ? AppColors.primaryColor.withOpacity(0.2)
                              : AppColors.offwhiteColor,
                          borderRadius: BorderRadius.circular(5)),
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text(
                          "Office",
                          style: TextStyle(
                              fontSize: 14,
                              color: office
                                  ? AppColors.primaryColor
                                  : AppColors.notificationTitleColor),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  InkWell(
                    onTap: () {
                      selectOther();
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: other
                              ? AppColors.primaryColor.withOpacity(0.2)
                              : AppColors.offwhiteColor,
                          borderRadius: BorderRadius.circular(5)),
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text(
                          "Other",
                          style: TextStyle(
                              fontSize: 14,
                              color: other
                                  ? AppColors.primaryColor
                                  : AppColors.notificationTitleColor),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              ListView.separated(
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
                      child: Column(
                        children: [
                          if (home)
                            HomeAddress(addressModel: addressList[index]),
                          if (office)
                            OfficeAddress(addressModel: addressList[index]),
                          if (other)
                            OtherAddress(addressModel: addressList[index]),
                        ],
                      ));
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox();
                },
              ),
              const SizedBox(
                height: 10,
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
                    // style: TextButton.styleFrom(
                    //     backgroundColor: Colors.amber),
                    onPressed: () {
                      showModalBottomSheet<void>(
                        isScrollControlled: true,
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0)),
                        context: context,
                        builder: (BuildContext context) {
                          return StatefulBuilder(builder:
                              (BuildContext context, StateSetter setState) {
                            void selectBHome() {
                              setState(() {
                                Bhome = true;
                                Boffice = false;
                                Bother = false;
                              });
                            }

                            void selectBOffice() {
                              setState(() {
                                Bhome = false;
                                Boffice = true;
                                Bother = false;
                              });
                            }

                            void selectBOther() {
                              setState(() {
                                Bhome = false;
                                Boffice = false;
                                Bother = true;
                              });
                            }

                            return ScrollConfiguration(
                                behavior: NoGlow(),
                                child: Theme(
                                  data: Theme.of(context)
                                      .copyWith(canvasColor: Colors.white),
                                  child: Material(
                                    borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(20.0),
                                        topRight: Radius.circular(20.0)),
                                    child: Container(
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 15, horizontal: 0),
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.565,
                                      child: Padding(
                                        padding: const EdgeInsets.all(15),
                                        child: Form(
                                          key: _formKey,
                                          child: Column(
                                            children: [
                                              // Image.asset(
                                              //     'assets/bottom-divider.png'),
                                              const SizedBox(
                                                height: 15,
                                              ),
                                              const Align(
                                                  alignment: Alignment.topLeft,
                                                  child: Text(
                                                    'Enter Complete Location',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 19),
                                                  )),
                                              const SizedBox(
                                                height: 15,
                                              ),
                                              const Align(
                                                  alignment: Alignment.topLeft,
                                                  child: Text(
                                                    'Save address as*',
                                                    style: TextStyle(
                                                        color: AppColors
                                                            .notificationTitleColor,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 14),
                                                  )),
                                              const SizedBox(
                                                height: 12,
                                              ),
                                              Row(
                                                children: [
                                                  GestureDetector(
                                                    onTap: () {
                                                      selectBHome();
                                                    },
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                          color: Bhome
                                                              ? AppColors
                                                                  .primaryColor
                                                                  .withOpacity(
                                                                      0.2)
                                                              : AppColors
                                                                  .offwhiteColor,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5)),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(4.0),
                                                        child: Text(
                                                          "Home",
                                                          style: TextStyle(
                                                              fontSize: 14,
                                                              color: Bhome
                                                                  ? AppColors
                                                                      .primaryColor
                                                                  : AppColors
                                                                      .notificationTitleColor),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    width: 10,
                                                  ),
                                                  GestureDetector(
                                                    onTap: () {
                                                      selectBOffice();
                                                    },
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                          color: Boffice
                                                              ? AppColors
                                                                  .primaryColor
                                                                  .withOpacity(
                                                                      0.2)
                                                              : AppColors
                                                                  .offwhiteColor,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5)),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(4.0),
                                                        child: Text(
                                                          "Office",
                                                          style: TextStyle(
                                                              fontSize: 14,
                                                              color: Boffice
                                                                  ? AppColors
                                                                      .primaryColor
                                                                  : AppColors
                                                                      .notificationTitleColor),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    width: 10,
                                                  ),
                                                  InkWell(
                                                    onTap: () {
                                                      selectBOther();
                                                    },
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                          color: Bother
                                                              ? AppColors
                                                                  .primaryColor
                                                                  .withOpacity(
                                                                      0.2)
                                                              : AppColors
                                                                  .offwhiteColor,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5)),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(4.0),
                                                        child: Text(
                                                          "Other",
                                                          style: TextStyle(
                                                              fontSize: 14,
                                                              color: Bother
                                                                  ? AppColors
                                                                      .primaryColor
                                                                  : AppColors
                                                                      .notificationTitleColor),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    width: 10,
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              if (Bhome)
                                                EditText(
                                                  // controller: firstNameCtre,
                                                  textInputType:
                                                      TextInputType.text,
                                                  hint: "House Number",
                                                  prefixIcon: SvgPicture.asset(
                                                    "assets/icons/my_home.svg",
                                                    color: AppColors
                                                        .notificationTextColor,
                                                  ),
                                                  inputformtters: [
                                                    LengthLimitingTextInputFormatter(
                                                        30),
                                                    LengthLimitingTextInputFormatter(
                                                        27)
                                                  ],
                                                  // validator: (value) {
                                                  //   if (value
                                                  //           ?.trimLeft()
                                                  //           .trimRight()
                                                  //           .isEmpty ??
                                                  //       true) {
                                                  //     return "Please enter House Number";
                                                  //   }
                                                  //   // if (value != null &&
                                                  //   //     value.length < 1) {
                                                  //   //   return "Username must be minimum 1 characters";
                                                  //   // }
                                                  //   return null;
                                                  // },
                                                ),
                                              if (Boffice)
                                                EditText(
                                                  // controller: firstNameCtre,
                                                  textInputType:
                                                      TextInputType.text,
                                                  hint: "Office Number",
                                                  prefixIcon: SvgPicture.asset(
                                                    "assets/icons/office.svg",
                                                    color: AppColors
                                                        .notificationTextColor,
                                                  ),
                                                  inputformtters: [
                                                    LengthLimitingTextInputFormatter(
                                                        30),
                                                    LengthLimitingTextInputFormatter(
                                                        27)
                                                  ],
                                                  // validator: (value) {
                                                  //   if (value
                                                  //           ?.trimLeft()
                                                  //           .trimRight()
                                                  //           .isEmpty ??
                                                  //       true) {
                                                  //     return "Please enter Office Number";
                                                  //   }
                                                  //   // if (value != null &&
                                                  //   //     value.length < 1) {
                                                  //   //   return "Username must be minimum 1 characters";
                                                  //   // }
                                                  //   return null;
                                                  // },
                                                ),
                                              if (Bother)
                                                EditText(
                                                  // controller: firstNameCtre,
                                                  textInputType:
                                                      TextInputType.text,
                                                  hint: "Number",
                                                  prefixIcon: SvgPicture.asset(
                                                    "assets/icons/building.svg",
                                                    color: AppColors
                                                        .notificationTextColor,
                                                  ),
                                                  inputformtters: [
                                                    LengthLimitingTextInputFormatter(
                                                        30),
                                                    LengthLimitingTextInputFormatter(
                                                        27)
                                                  ],
                                                  // validator: (value) {
                                                  //   if (value
                                                  //           ?.trimLeft()
                                                  //           .trimRight()
                                                  //           .isEmpty ??
                                                  //       true) {
                                                  //     return "Please enter Number";
                                                  //   }
                                                  //   // if (value != null &&
                                                  //   //     value.length < 1) {
                                                  //   //   return "Username must be minimum 1 characters";
                                                  //   // }
                                                  //   return null;
                                                  // },
                                                ),
                                              const SizedBox(
                                                height: 7,
                                              ),
                                              EditText(
                                                // controller: firstNameCtre,
                                                textInputType:
                                                    TextInputType.number,
                                                hint: "Floor",
                                                prefixIcon: SvgPicture.asset(
                                                  "assets/icons/building.svg",
                                                  color: AppColors
                                                      .notificationTextColor,
                                                ),
                                                inputformtters: [
                                                  LengthLimitingTextInputFormatter(
                                                      2),
                                                ],
                                                // validator: (value) {
                                                //   if (value
                                                //           ?.trimLeft()
                                                //           .trimRight()
                                                //           .isEmpty ??
                                                //       true) {
                                                //     return "Please enter Floor Number";
                                                //   }
                                                //   // if (value != null &&
                                                //   //     value.length < 1) {
                                                //   //   return "Username must be minimum 1 characters";
                                                //   // }
                                                //   return null;
                                                // },
                                              ),
                                              const SizedBox(
                                                height: 7,
                                              ),
                                              EditText(
                                                // controller: firstNameCtre,
                                                textInputType:
                                                    TextInputType.text,
                                                hint:
                                                    "Tower / Block (opptional)",
                                                prefixIcon: SvgPicture.asset(
                                                  "assets/icons/building.svg",
                                                  color: AppColors
                                                      .notificationTextColor,
                                                ),
                                                inputformtters: [
                                                  LengthLimitingTextInputFormatter(
                                                      30),
                                                  LengthLimitingTextInputFormatter(
                                                      27)
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 7,
                                              ),
                                              EditText(
                                                // controller: firstNameCtre,
                                                textInputType:
                                                    TextInputType.text,
                                                hint:
                                                    "Near Landmark (opptional)",
                                                prefixIcon: SvgPicture.asset(
                                                  "assets/icons/location.svg",
                                                  color: AppColors
                                                      .notificationTextColor,
                                                ),
                                                inputformtters: [
                                                  LengthLimitingTextInputFormatter(
                                                      30),
                                                  LengthLimitingTextInputFormatter(
                                                      27)
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 30,
                                              ),
                                              Container(
                                                height: 40,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                  gradient:
                                                      const LinearGradient(
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
                                                    onPressed: () {
                                                      if (_formKey.currentState!
                                                          .validate())
                                                        Navigator.pushReplacement(
                                                            context,
                                                            MaterialPageRoute(
                                                                builder:
                                                                    (context) =>
                                                                        AddAddressScreen()));
                                                    },
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        const Text(
                                                          "Save Address",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white),
                                                        ),
                                                        const SizedBox(
                                                          width: 10,
                                                        ),
                                                        SvgPicture.asset(
                                                          "assets/icons/location.svg",
                                                          color: Colors.white,
                                                        ),
                                                      ],
                                                    )),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ));
                          });
                        },
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Enter Complete Location",
                          style: TextStyle(color: Colors.white),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        SvgPicture.asset("assets/icons/location.svg"),
                      ],
                    )),
              ),
            ],
          ),
        ),
      ),
      body: Stack(
        children: [
          GoogleMap(
            zoomControlsEnabled: false,
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
              target: LatLng(0.0, 0.0),
              zoom: 1,
            ),
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
          ),
        ],
      ),
    );
  }
}

class HomeAddress extends StatefulWidget {
  HomeAddress({Key? key, required this.addressModel}) : super(key: key);
  AddressModel addressModel;

  @override
  State<HomeAddress> createState() => _HomeAddressState();
}

class _HomeAddressState extends State<HomeAddress> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (widget.addressModel.addressType.contains('Home'))
          Container(
            child: Text(widget.addressModel.address),
          ),
      ],
    );
  }
}

class OfficeAddress extends StatefulWidget {
  OfficeAddress({Key? key, required this.addressModel}) : super(key: key);
  AddressModel addressModel;

  @override
  State<OfficeAddress> createState() => _OfficeAddressState();
}

class _OfficeAddressState extends State<OfficeAddress> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (widget.addressModel.addressType.contains('Office'))
          Container(
            child: Text(widget.addressModel.address),
          ),
      ],
    );
  }
}

class OtherAddress extends StatefulWidget {
  OtherAddress({Key? key, required this.addressModel}) : super(key: key);
  AddressModel addressModel;

  @override
  State<OtherAddress> createState() => _OtherAddressState();
}

class _OtherAddressState extends State<OtherAddress> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (widget.addressModel.addressType.contains('Other'))
          Container(
            child: Text(widget.addressModel.address),
          ),
      ],
    );
  }
}
