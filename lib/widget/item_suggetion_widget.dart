import 'package:chef_bites/model/Item_suggetion_model.dart';
import 'package:chef_bites/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ItemSuggetionWidget extends StatefulWidget {
  ItemSuggetionWidget({Key? key, required this.itemSuggetionModel})
      : super(key: key);

  ItemSuggetionModel itemSuggetionModel;
  @override
  State<ItemSuggetionWidget> createState() => _ItemSuggetionWidgetState();
}

class _ItemSuggetionWidgetState extends State<ItemSuggetionWidget> {
  bool like = false;
  bool add = false;
  liked() {
    setState(() {
      widget.itemSuggetionModel.liked = !widget.itemSuggetionModel.liked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110,
      width: 272,
      child: Stack(
        children: [
          SizedBox(
            height: 110,
            width: 272,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SizedBox(
                    height: 100,
                    width: 100,
                    child: Stack(
                      children: [
                        Image.asset(
                          widget.itemSuggetionModel.imgUrl,
                          fit: BoxFit.fill,
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: Padding(
                            padding: const EdgeInsets.all(4),
                            child: GestureDetector(
                                onTap: liked,
                                child: widget.itemSuggetionModel.liked
                                    ? const Icon(
                                        Icons.favorite,
                                        color: AppColors.primaryColor,
                                      )
                                    : Icon(
                                        Icons.favorite,
                                        color: AppColors.offwhiteColor
                                            .withOpacity(0.5),
                                      )),
                          ),
                        ),
                      ],
                    )),
                const SizedBox(
                  width: 8,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 3,
                      ),
                      Text(
                        widget.itemSuggetionModel.title,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 14),
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      Text(
                        widget.itemSuggetionModel.subTitle,
                        style: const TextStyle(fontSize: 10),
                      ),
                      const SizedBox(
                        height: 13,
                      ),
                      if (widget.itemSuggetionModel.customised == true)
                        SizedBox(
                          height: 15,
                          child: SvgPicture.asset(
                            "assets/icons/customise.svg",
                            fit: BoxFit.fill,
                          ),
                        ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        "\$${widget.itemSuggetionModel.Price}",
                        style: const TextStyle(
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 14),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  width: 35,
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  add = !add;
                });
              },
              child: Padding(
                padding: const EdgeInsets.all(1),
                child: Container(
                    height: 35,
                    width: 35,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 5,
                              color: AppColors.shodowColor.withOpacity(0.1))
                        ],
                        color:
                            add ? AppColors.primaryColor : AppColors.whiteColor,
                        borderRadius: BorderRadius.circular(50)),
                    child: add
                        ? const Center(
                            child: Text(
                              "1",
                              style: TextStyle(
                                  color: AppColors.whiteColor,
                                  fontWeight: FontWeight.bold),
                            ),
                          )
                        : const Center(child: Icon(Icons.add))),
              ),
            ),
          )
        ],
      ),
    );
  }
}
