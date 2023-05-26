import 'package:chef_bites/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CustomSwitch extends StatefulWidget {
  CustomSwitch({Key? key, required this.value, required this.onChanged})
      : super(key: key);
  final bool value;
  final ValueChanged<bool> onChanged;

  @override
  State<CustomSwitch> createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.value == false
            ? widget.onChanged(true)
            : widget.onChanged(false);
      },
      child: Container(
        height: 25,
        width: 54,
        decoration: BoxDecoration(
          color: AppColors.offwhiteColor,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Padding(
          padding: const EdgeInsets.all(3),
          child: Row(
            children: [
              if (widget.value == false)
                Container(
                  height: 18,
                  width: 18,
                  decoration: BoxDecoration(
                    color: AppColors.notificationTitleColor,
                    shape: BoxShape.circle,
                  ),
                ),
              if (widget.value == false)
                Expanded(
                  child: Text(
                    "No",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: AppColors.notificationTitleColor),
                  ),
                ),
              if (widget.value == true)
                Expanded(
                  child: Text(
                    "Yes",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: AppColors.notificationTitleColor),
                  ),
                ),
              if (widget.value == true)
                Container(
                  height: 18,
                  width: 18,
                  decoration: BoxDecoration(
                    color: AppColors.notificationTitleColor,
                    shape: BoxShape.circle,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
