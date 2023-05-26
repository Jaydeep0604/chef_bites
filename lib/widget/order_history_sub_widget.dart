import 'package:chef_bites/model/order_history_model.dart';
import 'package:chef_bites/utils/app_colors.dart';
import 'package:flutter/material.dart';

class OrderHistorySubWidget extends StatefulWidget {
  OrderHistorySubWidget({Key? key, required this.orderHistoryDetail})
      : super(key: key);
  OrderHistoryDetail? orderHistoryDetail;

  @override
  State<OrderHistorySubWidget> createState() => _OrderHistorySubWidgetState();
}

class _OrderHistorySubWidgetState extends State<OrderHistorySubWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.orderHistoryDetail!.title,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                ),
                Text(
                  widget.orderHistoryDetail!.subTitle,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                      color: AppColors.notificationTitleColor),
                ),
                SizedBox(
                  height: 2,
                ),
                Text(
                  "\$ ${widget.orderHistoryDetail!.price}",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                )
              ],
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Expanded(
            flex: 1,
            child: Text(
              "${widget.orderHistoryDetail!.qty} Qty",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 12, color: AppColors.notificationTitleColor),
            ),
          )
        ],
      ),
    );
  }
}
