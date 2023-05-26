import 'package:chef_bites/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CustomAppBarWithoutBgColor extends PreferredSize {
  final Widget child;
  final BuildContext context;
  CustomAppBarWithoutBgColor({required this.child, required this.context})
      : super(
            child: child,
            preferredSize: Size.fromHeight(
                MediaQuery.of(context).padding.top + kToolbarHeight));

  @override
  Size get preferredSize =>
      Size.fromHeight(MediaQuery.of(context).padding.top + kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
            // color: AppColors.offwhiteColor,
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20))),
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        height: preferredSize.height,
        alignment: Alignment.center,
        child: child);
  }
}

class CustomAppBarWithBgColor extends PreferredSize {
  final Widget child;
  final BuildContext context;
  CustomAppBarWithBgColor({required this.child, required this.context})
      : super(
            child: child,
            preferredSize: Size.fromHeight(
                MediaQuery.of(context).padding.top + kToolbarHeight));

  @override
  Size get preferredSize =>
      Size.fromHeight(MediaQuery.of(context).padding.top + kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: AppColors.whiteColor,
            boxShadow: [
              BoxShadow(
                  blurRadius: 5, color: AppColors.shodowColor.withOpacity(0.2))
            ],
            borderRadius: const BorderRadius.only(
                // bottomLeft: Radius.circular(20),
                // bottomRight: Radius.circular(20)
                )),
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        height: preferredSize.height,
        alignment: Alignment.center,
        child: child);
  }
}
