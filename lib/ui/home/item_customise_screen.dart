import 'package:chef_bites/model/food_categories_model.dart';
import 'package:chef_bites/model/rice_model.dart';
import 'package:chef_bites/utils/app_colors.dart';
import 'package:chef_bites/utils/functions.dart';
import 'package:chef_bites/widget/appbar/app_bar.dart';
import 'package:chef_bites/widget/appbar/common_appbar.dart';
import 'package:chef_bites/widget/choose_your_protein_widget.dart';
import 'package:chef_bites/widget/rice_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ItemCustomiseScreen extends StatefulWidget {
  const ItemCustomiseScreen({Key? key}) : super(key: key);

  @override
  State<ItemCustomiseScreen> createState() => _ItemCustomiseScreenState();
}

class _ItemCustomiseScreenState extends State<ItemCustomiseScreen> {
  List<FoodCategoriesModel> proteinList = [
    FoodCategoriesModel(
        id: "1",
        name: "Veggies + Guac",
        imgUrl: "assets/images/veggies_guac.png"),
    FoodCategoriesModel(
        id: "2", name: "Chicken", imgUrl: "assets/images/chicken.png"),
    FoodCategoriesModel(
        id: "3", name: "Spiced Tofu", imgUrl: "assets/images/spiced_tofu.png"),
    FoodCategoriesModel(
        id: "4", name: "Carnitas", imgUrl: "assets/images/tacos.png"),
    FoodCategoriesModel(
        id: "5", name: "Barbacoa", imgUrl: "assets/images/barbocoa.png"),
    FoodCategoriesModel(
        id: "6", name: "Steak", imgUrl: "assets/images/steak.png"),
  ];
  List<FoodCategoriesModel> riceTypeList = [
    FoodCategoriesModel(
        id: "1", name: "White Rice", imgUrl: "assets/images/whiyte_rise.png"),
    FoodCategoriesModel(
        id: "2", name: "Brown Rice", imgUrl: "assets/images/brown_rise.png"),
    FoodCategoriesModel(
        id: "3", name: "No Rice", imgUrl: "assets/images/no.png"),
  ];
  List<RiceModel> riceList = [
    RiceModel(
        id: "1",
        imgUrl: "assets/images/rice1.png",
        name: "Chips & Guacamole",
        added: false),
    RiceModel(
        id: "2",
        imgUrl: "assets/images/rice2.png",
        name: "Chips & Red Chili Salsa",
        added: false),
    RiceModel(
        id: "3",
        imgUrl: "assets/images/rice3.png",
        name: "Chips & Green Chili",
        added: false),
  ];
  bool isChecked = false;
  bool isChecked2 = false;
  int itemDefalutCount = 1;
  double itemDefaultPrice = 2.21;
  double newPrice = 0;
  price() {
    //setState(() {
    newPrice = itemDefaultPrice * itemDefaultPrice;
    // });
  }

  int selectedProtein = -1;
  int selectedRice = -1;

  proteinSelected(int index) {
    setState(() {
      selectedProtein = index;
    });
  }

  void clearProteinSelection() {
    setState(() {
      selectedProtein = -1;
    });
  }

  riceSelected(int index) {
    setState(() {
      selectedRice = index;
    });
  }
  void clearRiseSelection() {
    setState(() {
      selectedRice = -1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomAppBarWithoutBgColor(
        context: context,
        child: CommonAppBar(
          isNeedCenterTitle: "",
          isNeedLeading: false,
          isNeedAction: false,
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
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            "Add to Cart",
                            style: TextStyle(
                                color: AppColors.whiteColor,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Icon(
                            Icons.arrow_right_alt,
                            color: AppColors.notificationTitleColor,
                          )
                        ],
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
      body: ScrollConfiguration(
        behavior: NoGlow(),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 307,
                width: MediaQuery.of(context).size.width,
                child: Image.asset(
                  "assets/images/customise_food.png",
                  fit: BoxFit.fill,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 35),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Cheese Corn Pizza",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,",
                      style: TextStyle(fontSize: 10),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Text(
                          "\$${itemDefaultPrice}",
                          style: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                        Expanded(
                            child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            GestureDetector(
                              onTap: () {
                                if (itemDefalutCount > 1)
                                  setState(() {
                                    if (itemDefalutCount < 1) {
                                      itemDefalutCount = 1;
                                    } else
                                      itemDefalutCount--;
                                  });
                              },
                              child: Container(
                                height: 25,
                                width: 25,
                                decoration: BoxDecoration(
                                    color: AppColors.primaryColor,
                                    borderRadius: BorderRadius.circular(50)),
                                child: const Center(
                                    child: Icon(
                                  Icons.horizontal_rule,
                                  color: AppColors.whiteColor,
                                  size: 18,
                                )),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 15, right: 15),
                              child: Text("${itemDefalutCount}"),
                            ),
                            GestureDetector(
                              onTap: () {
                                //  if (itemDefalutCount > 1)
                                setState(() {
                                  if (itemDefalutCount > 8) {
                                    itemDefalutCount = 9;
                                  } else
                                    itemDefalutCount++;
                                });
                              },
                              child: Container(
                                height: 25,
                                width: 25,
                                decoration: BoxDecoration(
                                    color: AppColors.primaryColor,
                                    borderRadius: BorderRadius.circular(50)),
                                child: const Center(
                                    child: Icon(
                                  Icons.add,
                                  color: AppColors.whiteColor,
                                  size: 18,
                                )),
                              ),
                            )
                          ],
                        ))
                      ],
                    ),
                    const Divider(),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 15, top: 10, bottom: 5),
                      child: Row(
                        children: const [
                          Text("Special Request ",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold)),
                          Text("(on the side)",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: AppColors.notificationTitleColor)),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Checkbox(
                          activeColor: AppColors.primaryColor,
                          side: BorderSide(color: AppColors.primaryColor),
                          value: isChecked,
                          onChanged: (bool? value) {
                            setState(() {
                              this.isChecked = value!;
                            });
                          },
                        ),
                        const Text("Salsa Verde",
                            style: TextStyle(
                                fontSize: 16,
                                color: AppColors.notificationTitleColor)),
                      ],
                    ),
                    Row(
                      children: [
                        Checkbox(
                          activeColor: AppColors.primaryColor,
                          side: const BorderSide(color: AppColors.primaryColor),
                          value: isChecked2,
                          onChanged: (bool? value) {
                            setState(() {
                              this.isChecked2 = value!;
                            });
                          },
                        ),
                        const Text("Salsa Verde 1",
                            style: TextStyle(
                                fontSize: 16,
                                color: AppColors.notificationTitleColor)),
                      ],
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 15, top: 10, bottom: 5),
                      child: Row(
                        children: const [
                          Text("Allergens",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold)),
                          Expanded(
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: Icon(
                                Icons.keyboard_arrow_up_outlined,
                                color: AppColors.notificationTitleColor,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SvgPicture.asset("assets/icons/fish.svg"),
                              const SizedBox(
                                width: 10,
                              ),
                              const Text("Fish")
                            ],
                          ),
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SvgPicture.asset("assets/icons/wheat.svg"),
                              const SizedBox(
                                width: 10,
                              ),
                              const Text("wheat")
                            ],
                          ),
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SvgPicture.asset("assets/icons/milk.svg"),
                              const SizedBox(
                                width: 10,
                              ),
                              const Text("Milk")
                            ],
                          ),
                        ),
                      ],
                    ),
                    Divider(),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 15,
                        top: 20,
                      ),
                      child: Row(
                        children: const [
                          Text("Choose Your Protein",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold)),
                          Expanded(
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: Icon(
                                Icons.keyboard_arrow_up_outlined,
                                color: AppColors.notificationTitleColor,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 15,
                        top: 20,
                      ),
                      child: GridView.builder(
                        shrinkWrap: true,
                        primary: false,
                        padding: EdgeInsets.zero,
                        scrollDirection: Axis.vertical,
                        itemCount: proteinList.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                crossAxisSpacing: 12.0,
                                mainAxisSpacing: 10.0),
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              if (selectedProtein == index) {
                                // If the selected item is tapped again, clear the selection
                                clearProteinSelection();
                              } else {
                                // If a different item is tapped, update the selection
                                proteinSelected(index);
                              }
                            },
                            child: ChooseYourProteinWidget(
                                borderColor: selectedProtein == index
                                    ? AppColors.primaryColor
                                    : Colors.transparent,
                                bgColor: selectedProtein == index
                                    ? AppColors.primaryColor.withOpacity(0.12)
                                    : AppColors.offwhiteColor,
                                foodCategoriesModel: proteinList[index]),
                          );
                        },
                      ),
                    ),
                    Divider(),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 15,
                        top: 20,
                      ),
                      child: Row(
                        children: const [
                          Text("Choose Your Rice",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold)),
                          Expanded(
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: Icon(
                                Icons.keyboard_arrow_up_outlined,
                                color: AppColors.notificationTitleColor,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 15,
                        top: 20,
                      ),
                      child: GridView.builder(
                        shrinkWrap: true,
                        primary: false,
                        padding: EdgeInsets.zero,
                        scrollDirection: Axis.vertical,
                        itemCount: riceTypeList.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                crossAxisSpacing: 12.0,
                                mainAxisSpacing: 10.0),
                        itemBuilder: (context, index) {
                          return GestureDetector(
                              onTap: () {
                                if (selectedRice == index) {
                                // If the selected item is tapped again, clear the selection
                                clearRiseSelection();
                              } else {
                                // If a different item is tapped, update the selection
                                riceSelected(index);
                              }
                              },
                              child: ChooseYourProteinWidget(
                                  borderColor: selectedRice == index
                                      ? AppColors.primaryColor
                                      : Colors.transparent,
                                  bgColor: selectedRice == index
                                      ? AppColors.primaryColor.withOpacity(0.12)
                                      : AppColors.offwhiteColor,
                                  foodCategoriesModel: riceTypeList[index]));
                        },
                      ),
                    ),
                    Divider(),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 15,
                        top: 20,
                      ),
                      child: Row(
                        children: const [
                          Text("Choose Your Rice",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold)),
                          Expanded(
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: Icon(
                                Icons.keyboard_arrow_up_outlined,
                                color: AppColors.notificationTitleColor,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 15, top: 20, bottom: 15),
                      child: GridView.builder(
                        shrinkWrap: true,
                        primary: false,
                        padding: EdgeInsets.zero,
                        scrollDirection: Axis.vertical,
                        itemCount: riceList.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                childAspectRatio: 0.7,
                                crossAxisSpacing: 12.0,
                                mainAxisSpacing: 10.0),
                        itemBuilder: (context, index) {
                          return GestureDetector(
                              onTap: () {
                                // selected(index);
                              },
                              child: RiceWidget(riceModel: riceList[index]));
                        },
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
