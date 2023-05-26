import 'package:chef_bites/model/order_history_model.dart';
import 'package:chef_bites/utils/app_colors.dart';
import 'package:chef_bites/widget/order_history_sub_widget.dart';
import 'package:flutter/material.dart';

class OrderHistoryWidget extends StatefulWidget {
  OrderHistoryWidget({
    Key? key,
    required this.orderHistoryModel,
  }) : super(key: key);
  OrderHistoryModel orderHistoryModel;

  @override
  State<OrderHistoryWidget> createState() => _OrderHistoryWidgetState();
}

class _OrderHistoryWidgetState extends State<OrderHistoryWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 78,
                width: 78,
                child: Image.asset(
                  widget.orderHistoryModel.imgUrl,
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.orderHistoryModel.title,
                    style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: AppColors.blackColor),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        widget.orderHistoryModel.veg_or_nonVeg,
                        style: const TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            color: AppColors.notificationTitleColor),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(3),
                        child: Container(
                          width: 3,
                          height: 3,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.blackColor),
                        ),
                      ),
                      Text(
                        widget.orderHistoryModel.country_type,
                        style: const TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            color: AppColors.notificationTitleColor),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(3),
                        child: Container(
                          width: 3,
                          height: 3,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.blackColor),
                        ),
                      ),
                      Text(
                        widget.orderHistoryModel.member_type,
                        style: const TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            color: AppColors.notificationTitleColor),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    onTap: () {},
                    borderRadius: BorderRadius.circular(5),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.primaryColor),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(9.0),
                          child: Text(
                            "Repeat Order",
                            style: TextStyle(
                              color: AppColors.primaryColor,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
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
          ListView.separated(
            scrollDirection: Axis.vertical,
            primary: false,
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            itemCount: widget.orderHistoryModel.orderHistoryDetail!.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  // selected(index);
                },
                child: OrderHistorySubWidget(
                  orderHistoryDetail:
                      widget.orderHistoryModel.orderHistoryDetail![index],
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(
                child: Divider(),
              );
            },
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
                "\$${widget.orderHistoryModel.price}",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Expanded(child: SizedBox()),
              Text(
                widget.orderHistoryModel.date,
                style: TextStyle(
                    color: AppColors.notificationTitleColor, fontSize: 12),
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
        ],
      ),
    );
  }
}
