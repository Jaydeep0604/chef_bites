import 'package:chef_bites/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DrawerListTile extends StatefulWidget {
  DrawerListTile({
    Key? key,
    this.leading,
    this.title,
    this.onTap,
  }) : super(key: key);
  String? leading;
  String? title;
  // Widget? onTap;
  final GestureTapCallback? onTap;
  @override
  State<DrawerListTile> createState() => _DrawerListTileState();
}

class _DrawerListTileState extends State<DrawerListTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Container(
          //  height: 38,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              //color: AppColors.offwhiteColor,
              borderRadius: BorderRadius.circular(5)),
          child: Center(
            child: Row(
              children: [
                const SizedBox(
                  width: 10,
                ),
                Container(
                  height: 35,
                  width: 35,
                  decoration: BoxDecoration(
                      color: AppColors.offwhiteColor,
                      borderRadius: BorderRadius.circular(50)),
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: SvgPicture.asset(
                      "${widget.leading}",
                      fit: BoxFit.fill,
                      color: AppColors.notificationTitleColor,
                      height: 18,
                      width: 18,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Text(
                  "${widget.title}",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColors.notificationTitleColor),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
