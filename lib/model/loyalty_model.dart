import 'package:flutter/material.dart';

class LoyaltyModel {
  String id;
  String imgUrl;
  bool liked;
  String title;
  String validOn;
  LoyaltyModel(
      {required this.id,
      required this.imgUrl,
      required this.liked,
      required this.title,
      required this.validOn});
}
