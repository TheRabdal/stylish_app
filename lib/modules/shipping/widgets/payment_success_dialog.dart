import 'package:flutter/material.dart';

class PaymentSuccessDialog extends StatelessWidget {
  const PaymentSuccessDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.1),
              blurRadius: 10,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 16),
            // Custom Icon Stack
            Stack(
              alignment: Alignment.center,
              children: [
                // Background dots (simplified representation)
                Positioned(
                  top: 0,
                  right: 10,
                  child: _buildDot(Colors.pinkAccent.withValues(alpha: 0.3), 8),
                ),
                Positioned(
                  bottom: 0,
                  left: 10,
                  child: _buildDot(
                    Colors.pinkAccent.withValues(alpha: 0.3),
                    10,
                  ),
                ),
                Positioned(
                  top: 10,
                  left: 0,
                  child: _buildDot(Colors.pinkAccent.withValues(alpha: 0.2), 6),
                ),
                // Main Star/Badge Shape
                Container(
                  width: 80,
                  height: 80,
                  decoration: const BoxDecoration(
                    color: Color(0xFFF95B5B), // Pinkish Red
                    shape: BoxShape
                        .circle, // Simplified to circle for standard look, use CustomPainter for jagged edge if strictly required
                  ),
                  child: const Icon(Icons.check, color: Colors.white, size: 48),
                ),
              ],
            ),
            const SizedBox(height: 24),
            const Text(
              "Payment done successfully.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildDot(Color color, double size) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
    );
  }
}
