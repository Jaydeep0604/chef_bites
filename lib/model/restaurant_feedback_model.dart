import 'package:syncfusion_flutter_sliders/sliders.dart';

class RestaurantFeedbackModel {
  String id;
  String title;
  String veg_nonVeg;
  String country_type;
  String member_type;
  double quality_of_food_rating;
  double food_packing_container_rating;
  double behaviour_of_staff_rating;
  String suggestion;
  RestaurantFeedbackModel(
      {required this.id,
      required this.title,
      required this.veg_nonVeg,
      required this.country_type,
      required this.member_type,
      required this.quality_of_food_rating,
      required this.food_packing_container_rating,
      required this.behaviour_of_staff_rating,
      required this.suggestion});
}
