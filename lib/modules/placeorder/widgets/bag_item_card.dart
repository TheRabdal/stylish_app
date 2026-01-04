import 'package:flutter/material.dart';
import '../models/place_order_model.dart';

class BagItemCard extends StatelessWidget {
  final BagItemModel item;

  const BagItemCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: Image.asset(
              item.image,
              width: 100,
              height: 120,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  width: 100,
                  height: 120,
                  color: Colors.grey[200],
                  child: const Icon(Icons.broken_image, color: Colors.grey),
                );
              },
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  item.subtitle,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.black54, // Checked Single-Breasted Blazer
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    _buildDropdown("Size", item.size),
                    const SizedBox(width: 12),
                    _buildDropdown("Qty", item.quantity.toString()),
                  ],
                ),
                const SizedBox(height: 12),
                RichText(
                  text: TextSpan(
                    text: "Delivery by ",
                    style: const TextStyle(fontSize: 12, color: Colors.black87),
                    children: [
                      TextSpan(
                        text: item.deliveryDate.replaceAll("Delivery by ", ""),
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDropdown(String label, String value) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "$label $value",
            style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
          ),
          const SizedBox(width: 4),
          const Icon(Icons.keyboard_arrow_down, size: 16),
        ],
      ),
    );
  }
}
