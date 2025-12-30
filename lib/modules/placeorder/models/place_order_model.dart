class BagItemModel {
  final String image;
  final String title;
  final String subtitle;
  final String size;
  final int quantity;
  final String deliveryDate; // e.g. "Delivery by 10 May 2XXX"

  BagItemModel({
    required this.image,
    required this.title,
    required this.subtitle,
    required this.size,
    required this.quantity,
    required this.deliveryDate,
  });
}

class PaymentDetailsModel {
  final double orderAmounts;
  final double convenience;
  final double deliveryFee;
  final double orderTotal;

  PaymentDetailsModel({
    required this.orderAmounts,
    required this.convenience,
    required this.deliveryFee,
    required this.orderTotal,
  });
}
