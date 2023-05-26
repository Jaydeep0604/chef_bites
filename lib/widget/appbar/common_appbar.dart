import 'package:chef_bites/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CommonAppBar extends StatefulWidget {
  final GlobalKey<ScaffoldState>? scaffoldkey;
  final bool isNeedAction;
  final bool isNeedLeading;
  final String isNeedCenterTitle;
  final bool isNeedCenterTitleWidget;
  final Widget? leadingIcon;
  final GlobalKey? globalKey;
  final Widget? action;
  final Widget? centerWidgte;
  CommonAppBar(
      {required this.isNeedCenterTitle,
      this.isNeedLeading = false,
      this.isNeedAction = false,
      this.isNeedCenterTitleWidget = false,
      this.leadingIcon,
      Key? key,
      this.scaffoldkey,
      this.action,
      this.centerWidgte,
      this.globalKey})
      : super(key: key);

  @override
  _CommonAppBarState createState() => _CommonAppBarState();
}

class _CommonAppBarState extends State<CommonAppBar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          widget.isNeedLeading
              ? SizedBox(
                  width: 50,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(50),
                      onTap: () => Navigator.pop(context),
                      child: const Icon(
                        Icons.arrow_back,
                        color: Colors.black,
                        size: 30,
                      ),
                    ),
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                        // boxShadow: [
                        //   BoxShadow(
                        //       blurRadius: 8,
                        //       color: AppColors.shodowColor.withOpacity(0.3)),
                        // ],
                        borderRadius: BorderRadius.circular(50),
                        color: AppColors.whiteColor),
                    child: widget.leadingIcon != null
                        ? widget.leadingIcon!
                        : const SizedBox(
                            width: 40,
                          ),
                  ),
                ),
          if (widget.isNeedCenterTitle != "")
            Expanded(
              child: SizedBox(
                child: Padding(
                  padding: const EdgeInsets.only(left: 0),
                  child: Text(widget.isNeedCenterTitle.toString(),
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .headline6!
                          .copyWith(color: Colors.black, fontSize: 16)

                      // style: TextStyle(
                      //     color: Colors.white,
                      //     fontWeight: FontWeight.bold,
                      //     ),
                      ),
                ),
              ),
            ),
          if (widget.isNeedCenterTitleWidget == true)
            Expanded(
              child: SizedBox(
                child: Padding(
                  padding: const EdgeInsets.only(left: 0),
                  child: widget.centerWidgte,
                ),
              ),
            ),
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                  // boxShadow: [
                  //   BoxShadow(
                  //       blurRadius: 8,
                  //       color: AppColors.shodowColor.withOpacity(0.3)),
                  // ],
                  borderRadius: BorderRadius.circular(50),
                  color: widget.isNeedAction
                      ? AppColors.whiteColor
                      : Colors.transparent),
              child: widget.isNeedAction
                  ? widget.action!
                  // child: UserCircleAvatar(
                  //   scaffoldKey: widget.scaffoldkey,
                  //   globalKey: widget.globalKey,
                  // )
                  // )
                  : const SizedBox(width: 40),
            ),
          )
        ],
      ),
    );
  }
}

class CommonAppBarWithSearchBar extends StatefulWidget {
  final GlobalKey<ScaffoldState>? scaffoldkey;
  final bool isNeedAction;
  final bool isNeedLeading;
  final Widget? title;
  // bool isNeedCenterTitle;
  final Widget? leadingIcon;
  final GlobalKey? globalKey;
  final Widget? action;
  final Widget? bottom;
  CommonAppBarWithSearchBar(
      {Key? key,
      //required this.isNeedCenterTitle,
      this.isNeedLeading = false,
      this.isNeedAction = false,
      this.title,
      this.leadingIcon,
      this.scaffoldkey,
      this.action,
      this.globalKey,
      this.bottom})
      : super(key: key);

  @override
  State<CommonAppBarWithSearchBar> createState() =>
      _CommonAppBarWithSearchBarState();
}

class _CommonAppBarWithSearchBarState extends State<CommonAppBarWithSearchBar> {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: true,
      pinned: true,
      forceElevated: true,
      snap: false,
      automaticallyImplyLeading: false,
      toolbarHeight: 80,
      titleSpacing: 1,
      expandedHeight: 110,
      // flexibleSpace: Placeholder(),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20))),
      elevation: 3,
      backgroundColor: AppColors.whiteColor,
      title: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.all(0.0),
          child: Container(
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                widget.isNeedLeading
                    ? SizedBox(
                        width: 50,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            // borderRadius: BorderRadius.circular(50),
                            onTap: () => Navigator.pop(context),
                            child: SvgPicture.asset(
                              "assets/icons/back.svg",
                              color: AppColors.headingFontColor,
                            ),
                          ),
                        ),
                      )
                    : Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: const BoxDecoration(
                              // boxShadow: [
                              //   BoxShadow(
                              //       blurRadius: 8,
                              //       color:
                              //           AppColors.shodowColor.withOpacity(0.3)),
                              // ],
                              //borderRadius: BorderRadius.circular(50),
                              color: AppColors.whiteColor),
                          child: widget.leadingIcon != null
                              ? widget.leadingIcon!
                              : const SizedBox(
                                  width: 40,
                                ),
                        ),
                      ),
                // if (widget.isNeedCenterTitle != null)
                Expanded(
                  child: SizedBox(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      child: Center(child: widget.title)),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: const BoxDecoration(
                        // boxShadow: [
                        //   BoxShadow(
                        //       blurRadius: 8,
                        //       color: AppColors.shodowColor.withOpacity(0.3)),
                        // ],
                        //borderRadius: BorderRadius.circular(50),
                        color: AppColors.whiteColor),
                    child: widget.isNeedAction
                        ? widget.action!
                        : const SizedBox(width: 40),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      bottom: AppBar(
        automaticallyImplyLeading: false,
        titleSpacing: 0,
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Container(
          height: 60,
          decoration: const BoxDecoration(
              color: AppColors.whiteColor,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30))),
          child: Padding(
            padding:
                const EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 10),
            child: Container(
                decoration: BoxDecoration(
                    border: Border.all(
                        color: AppColors.shodowColor.withOpacity(0.2)),
                    borderRadius: BorderRadius.circular(10)),
                child: widget.bottom),
          ),
        ),
      ),
    );
  }
}

class CommonAppBarWithoutBgColor extends StatefulWidget {
  final GlobalKey<ScaffoldState>? scaffoldkey;
  final bool isNeedAction;
  final bool isNeedLeading;
  final String isNeedCenterTitle;
  final Widget? leadingIcon;
  final GlobalKey? globalKey;
  final Widget? action;
  CommonAppBarWithoutBgColor(
      {required this.isNeedCenterTitle,
      this.isNeedLeading = false,
      this.isNeedAction = false,
      this.leadingIcon,
      Key? key,
      this.scaffoldkey,
      this.action,
      this.globalKey})
      : super(key: key);

  @override
  _CommonAppBarWithoutBgColorState createState() =>
      _CommonAppBarWithoutBgColorState();
}

class _CommonAppBarWithoutBgColorState
    extends State<CommonAppBarWithoutBgColor> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          widget.isNeedLeading
              ? SizedBox(
                  width: 50,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(50),
                      onTap: () => Navigator.pop(context),
                      child: const Icon(
                        Icons.arrow_back,
                        color: Colors.black,
                        size: 30,
                      ),
                    ),
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                        // boxShadow: [
                        //   BoxShadow(
                        //       blurRadius: 8,
                        //       color: AppColors.shodowColor.withOpacity(0.3)),
                        // ],
                        //borderRadius: BorderRadius.circular(50),
                        color: AppColors.whiteColor),
                    child: widget.leadingIcon != null
                        ? widget.leadingIcon!
                        : const SizedBox(
                            width: 40,
                          ),
                  ),
                ),
          if (widget.isNeedCenterTitle != null)
            Expanded(
              child: SizedBox(
                child: Padding(
                  padding: const EdgeInsets.only(left: 0),
                  child: Text(widget.isNeedCenterTitle.toString(),
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .headline6!
                          .copyWith(color: Colors.black, fontSize: 16)

                      // style: TextStyle(
                      //     color: Colors.white,
                      //     fontWeight: FontWeight.bold,
                      //     ),
                      ),
                ),
              ),
            ),
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                  // boxShadow: [
                  //   BoxShadow(
                  //       blurRadius: 8,
                  //       color: AppColors.shodowColor.withOpacity(0.3)),
                  // ],
                  //borderRadius: BorderRadius.circular(50),
                  color: AppColors.whiteColor),
              child: widget.isNeedAction
                  ? widget.action!
                  // child: UserCircleAvatar(
                  //   scaffoldKey: widget.scaffoldkey,
                  //   globalKey: widget.globalKey,
                  // )
                  // )
                  : const SizedBox(width: 40),
            ),
          )
        ],
      ),
    );
  }
}

class CommonAppBarSearchBar extends StatefulWidget {
  final GlobalKey<ScaffoldState>? scaffoldkey;
  final bool isNeedAction;
  final bool isNeedLeading;
  final Widget? title;
  // bool isNeedCenterTitle;
  final Widget? leadingIcon;
  final GlobalKey? globalKey;
  final Widget? action;
  final Widget? bottom;
  CommonAppBarSearchBar(
      {Key? key,
      //required this.isNeedCenterTitle,
      this.isNeedLeading = false,
      this.isNeedAction = false,
      this.title,
      this.leadingIcon,
      this.scaffoldkey,
      this.action,
      this.globalKey,
      this.bottom})
      : super(key: key);

  @override
  State<CommonAppBarSearchBar> createState() => _CommonAppBarSearchBarState();
}

class _CommonAppBarSearchBarState extends State<CommonAppBarSearchBar> {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: true,
      pinned: true,
      forceElevated: true,
      snap: false,
      automaticallyImplyLeading: false,
      toolbarHeight: 80,
      titleSpacing: 1,
      expandedHeight: 110,
      // flexibleSpace: Placeholder(),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20))),
      elevation: 3,
      backgroundColor: AppColors.whiteColor,
      title: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Container(
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 20,
              ),
              Expanded(
                child: Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: widget.title),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: const BoxDecoration(
                      // boxShadow: [
                      //   BoxShadow(
                      //       blurRadius: 8,
                      //       color: AppColors.shodowColor.withOpacity(0.3)),
                      // ],
                      //borderRadius: BorderRadius.circular(50),
                      color: AppColors.whiteColor),
                  child: widget.isNeedAction
                      ? widget.action!
                      : const SizedBox(width: 40),
                ),
              )
            ],
          ),
        ),
      ),
      bottom: AppBar(
        automaticallyImplyLeading: false,
        titleSpacing: 0,
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Container(
          height: 60,
          decoration: const BoxDecoration(
              color: AppColors.whiteColor,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30))),
          child: Padding(
            padding:
                const EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 10),
            child: Container(
                decoration: BoxDecoration(
                    border: Border.all(
                        color: AppColors.shodowColor.withOpacity(0.2)),
                    borderRadius: BorderRadius.circular(10)),
                child: widget.bottom),
          ),
        ),
      ),
    );
  }
}
