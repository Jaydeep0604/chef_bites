import 'package:flutter/material.dart';

class CartItemModel {
  String id;
  String title;
  String subTitle;
  bool customised;
  String price;
  String qty;
  CartItemModel(
      {required this.id,
      required this.title,
      required this.subTitle,
      required this.customised,
      required this.price,
      required this.qty});
}
