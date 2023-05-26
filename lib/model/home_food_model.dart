class HomeFoodModel {
  String id;
  String imgUrl;
  String foodName;
  String vegOrNonveg;
  String foodCategories;
  String foodtype;
  String discount;
  String upToPrice;
  String min_time;
  String max_time;
  String km;
  bool bestSeller;
  HomeFoodModel(
      {required this.id,
      required this.imgUrl,
      required this.foodName,
      required this.vegOrNonveg,
      required this.foodCategories,
      required this.foodtype,
      required this.discount,
      required this.upToPrice,
      required this.min_time,
      required this.max_time,
      required this.km,
      required this.bestSeller});
}
