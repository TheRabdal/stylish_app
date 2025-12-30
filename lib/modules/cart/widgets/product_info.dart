import 'package:flutter/material.dart';
import '../models/product_detail_model.dart';

class ProductInfo extends StatelessWidget {
  final ProductDetailModel product;

  const ProductInfo({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          product.title,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          product.subtitle,
          style: const TextStyle(fontSize: 14, color: Colors.black54),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            // Rating stars
            ...List.generate(5, (index) {
              if (index < product.rating.floor()) {
                return const Icon(Icons.star, color: Colors.amber, size: 18);
              } else if (index < product.rating && product.rating % 1 != 0) {
                return const Icon(
                  Icons.star_half,
                  color: Colors.amber,
                  size: 18,
                );
              } else {
                return const Icon(
                  Icons.star_border,
                  color: Colors.grey,
                  size: 18,
                );
              }
            }),
            const SizedBox(width: 8),
            Text(
              "${formatNumber(product.reviewCount)}",
              style: const TextStyle(color: Colors.grey, fontSize: 12),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Text(
              "₹${product.originalPrice.toStringAsFixed(0)}",
              style: const TextStyle(
                decoration: TextDecoration.lineThrough,
                color: Colors.grey,
                fontSize: 14,
              ),
            ),
            const SizedBox(width: 8),
            Text(
              "₹${product.price.toStringAsFixed(0)}",
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(width: 8),
            Text(
              "${product.discountPercentage}% Off",
              style: const TextStyle(
                color: Colors.pinkAccent,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        const Text(
          "Product Details",
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 4),
        RichText(
          text: TextSpan(
            text: product.description.length > 150
                ? product.description.substring(0, 150)
                : product.description,
            style: const TextStyle(
              color: Colors.black87,
              fontSize: 12,
              height: 1.5,
            ),
            children: [
              if (product.description.length > 150)
                const TextSpan(
                  text: " ...More",
                  style: TextStyle(color: Colors.pinkAccent),
                ),
            ],
          ),
        ),
      ],
    );
  }

  String formatNumber(int number) {
    return number.toString().replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
      (Match m) => '${m[1]},',
    );
  }
}
