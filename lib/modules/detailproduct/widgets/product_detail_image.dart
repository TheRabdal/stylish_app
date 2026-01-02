import 'package:flutter/material.dart';

class ProductDetailImage extends StatelessWidget {
  final String imageUrl;

  const ProductDetailImage({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 290,
      width: double.infinity,
      margin: const EdgeInsets.only(top: 16), // Add top margin for spacing
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20), // Rounded corners all around
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: imageUrl.startsWith('assets')
            ? Image.asset(imageUrl, fit: BoxFit.cover)
            : Image.network(imageUrl, fit: BoxFit.cover),
      ),
    );
  }
}
