class ProductDetailModel {
  final String id;
  final List<String> images;
  final String title;
  final String subtitle;
  final double rating;
  final int reviewCount;
  final double price;
  final double originalPrice;
  final int discountPercentage;
  final String description;
  final List<ProductSize> availableSizes;

  ProductDetailModel({
    required this.id,
    required this.images,
    required this.title,
    required this.subtitle,
    required this.rating,
    required this.reviewCount,
    required this.price,
    required this.originalPrice,
    required this.discountPercentage,
    required this.description,
    required this.availableSizes,
  });
}

class ProductSize {
  final String label;
  final bool isSelected;
  final bool isAvailable;

  ProductSize({
    required this.label,
    this.isSelected = false,
    this.isAvailable = true,
  });

  ProductSize copyWith({String? label, bool? isSelected, bool? isAvailable}) {
    return ProductSize(
      label: label ?? this.label,
      isSelected: isSelected ?? this.isSelected,
      isAvailable: isAvailable ?? this.isAvailable,
    );
  }
}

class SimilarProduct {
  final String id;
  final String image;
  final String title;
  final String subtitle;
  final double price;
  final double rating;
  final int reviewCount;

  SimilarProduct({
    required this.id,
    required this.image,
    required this.title,
    required this.subtitle,
    required this.price,
    required this.rating,
    required this.reviewCount,
  });
}
