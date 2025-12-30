import 'package:flutter/material.dart';

class CouponSection extends StatelessWidget {
  final VoidCallback? onApply;

  const CouponSection({super.key, this.onApply});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const Icon(
                Icons.local_offer_outlined,
                size: 24,
                color: Colors.black,
              ), // Or use a custom coupon SVG/Icon
              const SizedBox(width: 12),
              const Text(
                "Apply Coupons",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          InkWell(
            onTap: onApply,
            child: const Text(
              "Select",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.pinkAccent,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
