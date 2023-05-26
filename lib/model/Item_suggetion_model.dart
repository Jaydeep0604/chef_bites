class ItemSuggetionModel {
  String id;
  String imgUrl;
  String title;
  String subTitle;
  String Price;
  bool customised;
  bool added;
  bool liked;
  ItemSuggetionModel(
      {required this.id,
      required this.imgUrl,
      required this.title,
      required this.subTitle,
      required this.Price,
      required this.customised,
      required this.added,
      required this.liked});
}
