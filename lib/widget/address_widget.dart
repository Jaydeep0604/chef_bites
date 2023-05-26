import 'package:chef_bites/model/address_model.dart';
import 'package:chef_bites/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AddressWidget extends StatefulWidget {
  AddressWidget({Key? key, required this.addressModel}) : super(key: key);
  AddressModel addressModel;

  @override
  State<AddressWidget> createState() => _AddressWidgetState();
}

class _AddressWidgetState extends State<AddressWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.addressModel.addressType.contains('Home'))
            SizedBox(
                height: 18,
                child: SvgPicture.asset(
                  "assets/icons/add_hone.svg",
                  color: AppColors.notificationTitleColor,
                  fit: BoxFit.fill,
                )),
          if (widget.addressModel.addressType.contains('Office'))
            SizedBox(
                height: 18,
                child: SvgPicture.asset(
                  "assets/icons/office.svg",
                  fit: BoxFit.fill,
                )),
          if(widget.addressModel.addressType.contains('Other'))
          SizedBox(
              height: 18,
              child: SvgPicture.asset(
                "assets/icons/location.svg",
                color: AppColors.notificationTitleColor,
                fit: BoxFit.fill,
              )),
          const SizedBox(
            width: 10,
          ),
          Expanded(
              child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                      child: Text(
                    widget.addressModel.addressType,
                    style: const TextStyle(
                        color: AppColors.blackColor,
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  )),
                  SizedBox(
                      height: 14,
                      child: SvgPicture.asset(
                        "assets/icons/edit.svg",
                        fit: BoxFit.fill,
                      )),
                  const SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                      height: 14,
                      child: SvgPicture.asset(
                        "assets/icons/delete.svg",
                        fit: BoxFit.fill,
                      )),
                  const SizedBox(
                    width: 5,
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                widget.addressModel.address,
                style: const TextStyle(
                  color: AppColors.notificationTextColor,
                  fontSize: 12,
                ),
              )
            ],
          ))
        ],
      ),
    );
  }
}
