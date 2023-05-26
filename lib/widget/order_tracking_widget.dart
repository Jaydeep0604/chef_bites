import 'package:chef_bites/model/cart_model.dart';
import 'package:chef_bites/utils/app_colors.dart';
import 'package:flutter/material.dart';

class OrderTrackingWidget extends StatefulWidget {
  OrderTrackingWidget({Key? key, required this.cartItemModel})
      : super(key: key);
  CartItemModel cartItemModel;

  @override
  State<OrderTrackingWidget> createState() => _OrderTrackingWidgetState();
}

class _OrderTrackingWidgetState extends State<OrderTrackingWidget> {
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
                  widget.cartItemModel.title,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                ),
                Text(
                  widget.cartItemModel.subTitle,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                      color: AppColors.notificationTitleColor),
                ),
                SizedBox(
                  height: 2,
                ),
                Text(
                  "\$ ${widget.cartItemModel.price}",
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
              "${widget.cartItemModel.qty} Qty",
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
