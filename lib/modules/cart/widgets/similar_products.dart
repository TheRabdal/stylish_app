import 'package:flutter/material.dart';
import '../models/product_detail_model.dart';
// Note: We might want to reuse the ProductCard from homepage if it matches,
// but to ensure strict adherence to this specific design and isolation, I'll create a local one or use a consistent design.
// The image shows "Similar To 282+ Items" with Sort/Filter buttons and then a Grid/List.
// I will implement a simpler horizontal or grid version as a widget.

class SimilarProducts extends StatelessWidget {
  final List<SimilarProduct> products;

  const SimilarProducts({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Similar To",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  "282+ Items",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Row(
              children: [
                OutlinedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.sort, size: 16, color: Colors.black),
                  label: const Text(
                    "Sort",
                    style: TextStyle(color: Colors.black),
                  ),
                  style: OutlinedButton.styleFrom(
                    minimumSize: const Size(0, 32),
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                  ),
                ),
                const SizedBox(width: 8),
                OutlinedButton.icon(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.filter_list,
                    size: 16,
                    color: Colors.black,
                  ),
                  label: const Text(
                    "Filter",
                    style: TextStyle(color: Colors.black),
                  ),
                  style: OutlinedButton.styleFrom(
                    minimumSize: const Size(0, 32),
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                  ),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 16),
        // Displaying 2 items side-by-side as in the screenshot
        Row(
          children: products.take(2).map((product) {
            return Expanded(
              child: Padding(
                padding: const EdgeInsets.only(right: 12.0),
                child: _buildProductCard(product),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildProductCard(SimilarProduct product) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.network(
            product.image,
            height: 150,
            width: double.infinity,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                height: 150,
                color: Colors.grey[200],
                child: const Icon(Icons.broken_image, color: Colors.grey),
              );
            },
          ),
        ),
        const SizedBox(height: 8),
        Text(
          product.title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        Text(
          product.subtitle,
          style: const TextStyle(color: Colors.grey, fontSize: 12),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 4),
        Text(
          "₹${product.price.toStringAsFixed(0).replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},')}",
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
        ),
        const SizedBox(height: 4),
        Row(
          children: [
            ...List.generate(5, (index) {
              if (index < product.rating.floor()) {
                return const Icon(Icons.star, color: Colors.amber, size: 12);
              } else {
                return const Icon(
                  Icons.star_border,
                  color: Colors.grey,
                  size: 12,
                );
              }
            }),
            const SizedBox(width: 4),
            Text(
              "${product.reviewCount}",
              style: const TextStyle(color: Colors.grey, fontSize: 10),
            ),
          ],
        ),
      ],
    );
  }
}
