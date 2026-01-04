class AddressModel {
  final String title;
  final String addressLine;
  final String contactNumber;

  AddressModel({
    required this.title,
    required this.addressLine,
    required this.contactNumber,
  });
}

class CheckoutItemModel {
  final String image;
  final String title;
  final List<String> variations;
  final double rating;
  final double price;
  final double originalPrice;
  final int discountPercentage;
  final int quantity;

  CheckoutItemModel({
    required this.image,
    required this.title,
    required this.variations,
    required this.rating,
    required this.price,
    required this.originalPrice,
    required this.discountPercentage,
    this.quantity = 1,
  });
}
