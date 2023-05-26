import 'package:chef_bites/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CbToast {
  static final CbToast instance = CbToast._internal();
  factory CbToast() {
    return instance;
  }
  CbToast._internal();
  showErrorMessage(BuildContext context, String msg) {
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        "$msg",
        textAlign: TextAlign.center,
        style: TextStyle(color: AppColors.whiteColor, fontSize: 12),
      ),
      backgroundColor: AppColors.toastErrorColor,
      behavior: SnackBarBehavior.floating,
      elevation: 10,
      duration: Duration(milliseconds: 2500),
      dismissDirection: DismissDirection.horizontal,
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
    ));
  }

  successMessage(BuildContext context, String msg) {
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        "$msg",
        textAlign: TextAlign.center,
        style: TextStyle(color: AppColors.whiteColor, fontSize: 12),
      ),
      backgroundColor: Color(0xFF64AF25),
      behavior: SnackBarBehavior.floating,
      elevation: 10,
      duration: Duration(milliseconds: 2500),
      dismissDirection: DismissDirection.horizontal,
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
    ));
  }

  simpleMessage(BuildContext context, String msg) {
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        "$msg",
        textAlign: TextAlign.center,
        style: TextStyle(color: AppColors.whiteColor, fontSize: 12),
      ),
      backgroundColor: AppColors.toastErrorColor,
      behavior: SnackBarBehavior.floating,
      elevation: 10,
      duration: Duration(milliseconds: 2500),
      dismissDirection: DismissDirection.horizontal,
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
    ));
  }
}
