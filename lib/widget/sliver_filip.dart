import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class SliverFilip extends SingleChildRenderObjectWidget {
  SliverFilip({Widget? child, Key? key}) : super(child: child, key: key);
  @override
  RenderObject createRenderObject(BuildContext context) {
    return RenderSliverFilip();
  }
}

class RenderSliverFilip extends RenderSliverSingleBoxAdapter {
  RenderSliverFilip({
    RenderBox? child,
  }) : super(child: child);
  @override
  void performLayout() {
    if (child == null) {
      geometry = SliverGeometry.zero;
      return;
    }
    final SliverConstraints constraints = this.constraints;
    child!.layout(constraints.asBoxConstraints(), parentUsesSize: true);
    final double childExtent;
    switch (constraints.axis) {
      case Axis.horizontal:
        childExtent = child!.size.width;
        break;
      case Axis.vertical:
        childExtent = child!.size.height;
        break;
    }
    assert(childExtent != null);
    final isOdd = constraints.scrollOffset.toInt().isOdd;
    // final double paintedChildSize =
    //     calculatePaintOffset(constraints, from: 0.0, to: childExtent);
    // final double cacheExtent =
    //     calculateCacheOffset(constraints, from: 0.0, to: childExtent);

    // assert(paintedChildSize.isFinite);
    // assert(paintedChildSize >= 0.0);
    geometry = SliverGeometry(
      scrollExtent: 150,
      paintExtent: 50,
      // cacheExtent: cacheExtent,
      paintOrigin: constraints.scrollOffset,
      maxPaintExtent: 50,
      // hitTestExtent: paintedChildSize,
      // hasVisualOverflow: childExtent > constraints.remainingPaintExtent ||
      //     constraints.scrollOffset > 0.0,
    );
    setChildParentData(child!, constraints, geometry!);
  }
}

/*
how to use 
sliver[
  sliverFilip(---);
]
          second way of set bottom search bar
          */
          // SliverFilip(
          //   child: Container(
          //     height: 60,
          //     decoration: const BoxDecoration(
          //         color: AppColors.offwhiteColor,
          //         borderRadius: BorderRadius.only(
          //             bottomLeft: Radius.circular(30),
          //             bottomRight: Radius.circular(30))),
          //     child: Padding(
          //       padding: const EdgeInsets.only(
          //           left: 20, right: 20, top: 10, bottom: 10),
          //       child: EditText(
          //         // controller: UserNameCtr,
          //         textInputType: TextInputType.text,
          //         hint: "Search...",
          //         prefixIcon: SvgPicture.asset(
          //           "assets/icons/search.svg",
          //         ),
          //         inputformtters: [
          //           LengthLimitingTextInputFormatter(30),
          //           FilteringTextInputFormatter(RegExp(r'[a-zA-Z]'), allow: true),
          //           LengthLimitingTextInputFormatter(27)
          //         ],
          //         // validator: (value) {
          //         //   if (value?.trimLeft().trimRight().isEmpty ??
          //         //       true) {
          //         //     return "Please enter Username";
          //         //   }
          //         //   if (value != null && value.length < 3) {
          //         //     return "Username must be minimum 3 characters";
          //         //   }
          //         //   return null;
          //         // },
          //       ),
          //     ),
          //   ),
          // ),