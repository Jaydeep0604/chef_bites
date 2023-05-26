import 'package:chef_bites/model/cart_model.dart';
import 'package:chef_bites/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CartItemWidget extends StatefulWidget {
  CartItemWidget({Key? key, required this.cartItemModel}) : super(key: key);
  CartItemModel cartItemModel;

  @override
  State<CartItemWidget> createState() => _CartItemWidgetState();
}

class _CartItemWidgetState extends State<CartItemWidget> {
  int itemDefalutCount = 1;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: SizedBox(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        widget.cartItemModel.title,
                        style: const TextStyle(
                            fontSize: 14, color: AppColors.blackColor),
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                      if (widget.cartItemModel.customised == true)
                        Expanded(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              SvgPicture.asset("assets/icons/customise.svg"),
                              const SizedBox(
                                width: 10,
                              ),
                              SvgPicture.asset("assets/icons/edit.svg"),
                            ],
                          ),
                        ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 100),
                    child: Text(
                      widget.cartItemModel.subTitle,
                      style: const TextStyle(
                          fontSize: 12,
                          color: AppColors.notificationTitleColor),
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        "\$ ${widget.cartItemModel.price}",
                        style: const TextStyle(
                            fontSize: 16,
                            color: AppColors.blackColor,
                            fontWeight: FontWeight.bold),
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            GestureDetector(
                              onTap: () {
                                if (itemDefalutCount > 1) {
                                  setState(() {
                                    if (itemDefalutCount < 1) {
                                      itemDefalutCount = 1;
                                    } else
                                      itemDefalutCount--;
                                  });
                                }
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
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
