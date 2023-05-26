import 'package:chef_bites/model/notification_model.dart';
import 'package:chef_bites/utils/app_colors.dart';
import 'package:flutter/material.dart';

class NotificationWidget extends StatefulWidget {
  NotificationWidget({Key? key, required this.notificationModel})
      : super(key: key);
  NotificationModel notificationModel;

  @override
  State<NotificationWidget> createState() => _NotificationWidgetState();
}

class _NotificationWidgetState extends State<NotificationWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
                // color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(50)),
            child: Image.asset(
              "${widget.notificationModel.imgUrl}",
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Text(
              "${widget.notificationModel.notificationText}",
              style: const TextStyle(
                  fontSize: 12, color: AppColors.notificationTextColor),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "${widget.notificationModel.time}",
                style: const TextStyle(
                    fontSize: 10, color: AppColors.notificationTextColor),
              ),
              const SizedBox(
                height: 1,
              ),
              Transform.scale(
                scale: 0.8,
                child: Image.asset("assets/icons/more.png"))
            ],
          ),
          const SizedBox(
            width: 5,
          ),
        ],
      ),
    );
  }
}