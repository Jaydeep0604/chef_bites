import 'package:chef_bites/utils/app_colors.dart';
import 'package:flutter/material.dart';

class RatingBarWidget extends StatefulWidget {
  RatingBarWidget({Key? key, required this.label}) : super(key: key);
  double label;

  @override
  State<RatingBarWidget> createState() => _RatingBarWidgetState();
}

class _RatingBarWidgetState extends State<RatingBarWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.end,
      children: List<Widget>.generate(5, (index) {
        if (index < widget.label) {
          // if the index is less than the label, return a filled star icon
          return Icon(
            Icons.star,
            color: AppColors.primaryColor,
            size: 20,
          );
        } else {
          // otherwise, return an empty star icon
          return Icon(
            Icons.star_border,
            color: AppColors.primaryColor,
            size: 20,
          );
        }
      }),
    );
  }
}
