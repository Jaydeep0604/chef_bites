import 'package:chef_bites/model/food_categories_model.dart';
import 'package:chef_bites/ui/home/food_select_screen.dart';
import 'package:chef_bites/utils/app_colors.dart';
import 'package:flutter/material.dart';

class FoodCategoriesWidget extends StatefulWidget {
  FoodCategoriesWidget({Key? key, required this.foodCategoriesModel})
      : super(key: key);
  FoodCategoriesModel foodCategoriesModel;

  @override
  State<FoodCategoriesWidget> createState() => _FoodCategoriesWidgetState();
}

class _FoodCategoriesWidgetState extends State<FoodCategoriesWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => FoodSelectScreen()));
      },
      child: Container(
        // color: AppColors.offwhiteColor,
        height: 88,
        width: 70,
        child: Column(
          children: [
            const SizedBox(
              height: 5,
            ),
            Container(
              height: 62,
              width: 62,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 5,
                        color: AppColors.shodowColor.withOpacity(0.3))
                  ],
                  borderRadius: BorderRadius.circular(50),
                  color: AppColors.whiteColor),
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Image.asset(
                  widget.foodCategoriesModel.imgUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              widget.foodCategoriesModel.name,
              style: const TextStyle(fontSize: 10),
            )
          ],
        ),
      ),
    );
  }
}
