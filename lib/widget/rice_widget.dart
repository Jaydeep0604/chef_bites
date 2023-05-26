import 'package:chef_bites/model/rice_model.dart';
import 'package:chef_bites/utils/app_colors.dart';
import 'package:flutter/material.dart';

class RiceWidget extends StatefulWidget {
  RiceWidget({Key? key, required this.riceModel}) : super(key: key);
  RiceModel riceModel;
  @override
  State<RiceWidget> createState() => _RiceWidgetState();
}

class _RiceWidgetState extends State<RiceWidget> {
  int selectedIndex = 0;

  selected(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 125,
      width: 93,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        children: [
          SizedBox(
            height: 93,
            width: 93,
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Image.asset(
                    widget.riceModel.imgUrl,
                    fit: BoxFit.fill,
                  ),
                ),
                Container(
                  height: 93,
                  width: 93,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: AppColors.notificationTitleColor.withOpacity(0.1),
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Checkbox(
                      activeColor: AppColors.primaryColor,
                      side: const BorderSide(
                          color: AppColors.primaryColor, width: 1.6),
                      value: isChecked,
                      onChanged: (bool? value) {
                        setState(() {
                          isChecked = value!;
                        });
                      }),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            widget.riceModel.name,
            style: const TextStyle(fontSize: 12),
          )
        ],
      ),
    );
  }
}
