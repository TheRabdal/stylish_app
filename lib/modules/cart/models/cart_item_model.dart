class CartItem {
  final String image;
  final String title;
  final String variations;
  final String size;
  final int qty;
  final String deliveryDate;
  final double price;
  final double oldPrice;
  final String discount;

  CartItem({
    required this.image,
    required this.title,
    required this.variations,
    required this.size,
    required this.qty,
    required this.deliveryDate,
    required this.price,
    required this.oldPrice,
    required this.discount,
  });
  CartItem copyWith({
    String? image,
    String? title,
    String? variations,
    String? size,
    int? qty,
    String? deliveryDate,
    double? price,
    double? oldPrice,
    String? discount,
  }) {
    return CartItem(
      image: image ?? this.image,
      title: title ?? this.title,
      variations: variations ?? this.variations,
      size: size ?? this.size,
      qty: qty ?? this.qty,
      deliveryDate: deliveryDate ?? this.deliveryDate,
      price: price ?? this.price,
      oldPrice: oldPrice ?? this.oldPrice,
      discount: discount ?? this.discount,
    );
  }
}
