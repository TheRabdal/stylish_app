class Product {
  final String image;
  final String name;
  final String description;
  final String price;
  final String oldPrice;
  final String discount;
  final int rating;
  final int reviewCount;
  final double? height;

  const Product({
    required this.image,
    required this.name,
    required this.description,
    required this.price,
    required this.oldPrice,
    required this.discount,
    required this.rating,
    required this.reviewCount,
    this.height,
  });
}
