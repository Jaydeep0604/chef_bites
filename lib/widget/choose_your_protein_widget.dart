import 'package:chef_bites/model/food_categories_model.dart';
import 'package:flutter/material.dart';

class ChooseYourProteinWidget extends StatefulWidget {
  ChooseYourProteinWidget(
      {Key? key,
      required this.foodCategoriesModel,
      required this.bgColor,
      required this.borderColor})
      : super(key: key);
  FoodCategoriesModel foodCategoriesModel;
  Color bgColor;
  Color borderColor;

  @override
  State<ChooseYourProteinWidget> createState() =>
      _ChooseYourProteinWidgetState();
}

class _ChooseYourProteinWidgetState extends State<ChooseYourProteinWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 89,
      width: 92,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: widget.borderColor),
          color: widget.bgColor),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
                height: 30,
                child: Image.asset(widget.foodCategoriesModel.imgUrl)),
            
            Padding(
              padding: const EdgeInsets.only(top: 10,left: 7,right: 7),
              child: Text(
                widget.foodCategoriesModel.name,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 12),
              ),
            )
          ],
        ),
      ),
    );
  }
}
