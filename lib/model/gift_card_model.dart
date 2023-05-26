class GiftCardModel {
  String id;
  String gift_card_id;
  String current_balance;
  bool active;
  bool redeemed;
  GiftCardModel(
      {required this.id,
      required this.gift_card_id,
      required this.current_balance,
      required this.active,
      required this.redeemed});
}
