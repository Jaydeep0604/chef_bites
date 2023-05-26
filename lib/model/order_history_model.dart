class OrderHistoryModel {
  String id;
  String imgUrl;
  String title;
  String veg_or_nonVeg;
  String country_type;
  String member_type;
  String price;
  String date;
  List<OrderHistoryDetail>? orderHistoryDetail;

  OrderHistoryModel({
    required this.id,
    required this.imgUrl,
    required this.title,
    required this.veg_or_nonVeg,
    required this.country_type,
    required this.member_type,
    required this.price,
    required this.date,
    required this.orderHistoryDetail,
  });
}

class OrderHistoryDetail {
  String id;
  String title;
  String subTitle;
  String price;
  String qty;
  OrderHistoryDetail({
    required this.id,
    required this.title,
    required this.subTitle,
    required this.price,
    required this.qty,
  });
}
