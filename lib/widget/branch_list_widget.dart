import 'package:chef_bites/model/branch_list_model.dart';
import 'package:chef_bites/utils/app_colors.dart';
import 'package:flutter/material.dart';

class BranchListWidget extends StatefulWidget {
  BranchListWidget({Key? key, required this.branchListModel}) : super(key: key);
  BranchListModel branchListModel;

  @override
  State<BranchListWidget> createState() => _BranchListWidgetState();
}

class _BranchListWidgetState extends State<BranchListWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5), color: AppColors.whiteColor),
      width: MediaQuery.of(context).size.width,
      child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: SizedBox(
                height: 100,
                width: 100,
                child: Image.asset(widget.branchListModel.imgUrl),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.branchListModel.name,
                      style: (const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColors.blackColor,
                          fontSize: 14)),
                    ),
                    Text(
                      widget.branchListModel.address,
                      style: (const TextStyle(
                          color: AppColors.notificationTextColor,
                          fontSize: 12)),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: const [
                        Text(
                          "Open",
                          style: (TextStyle(
                              fontWeight: FontWeight.bold,
                              color: AppColors.notificationTitleColor,
                              fontSize: 14)),
                        ),
                        Expanded(
                          child: Text(
                            "Contact no.",
                            textAlign: TextAlign.end,
                            style: (TextStyle(
                                fontWeight: FontWeight.bold,
                                color: AppColors.notificationTitleColor,
                                fontSize: 14)),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(widget.branchListModel.time1,
                            style: (const TextStyle(
                                color: AppColors.notificationTextColor,
                                fontSize: 12))),
                        Expanded(
                          child: Text(widget.branchListModel.contactNo,
                              textAlign: TextAlign.end,
                              style: (const TextStyle(
                                  color: AppColors.notificationTextColor,
                                  fontSize: 12))),
                        ),
                      ],
                    ),
                    Text(widget.branchListModel.time2,
                        style: (const TextStyle(
                            color: AppColors.notificationTextColor,
                            fontSize: 12))),
                  ],
                ),
              ),
            )
          ]),
    );
  }
}
