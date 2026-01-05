import 'package:stylish_app/packages/packages.dart';

class BottomNavActions extends StatelessWidget {
  const BottomNavActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton.icon(
            onPressed: () {
              final items = CartService().items;
              final double subtotal = CartService().calculateTotal(items);
              final double discountPct = CartService().discountPercentage;
              final double discountAmount = subtotal * discountPct;
              final double shoppingLimit = 1000.0;
              final double shippingFee = subtotal > shoppingLimit ? 0.0 : 50.0;
              final double total = subtotal - discountAmount + shippingFee;

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CheckoutPage(
                    orderTotal: subtotal,
                    shippingFee: shippingFee,
                    discountAmount: discountAmount,
                    finalTotal: total,
                  ),
                ),
              );
            },
            icon: const Icon(Icons.shopping_cart_outlined, color: Colors.white),
            label: const Text(
              "Go to cart",
              style: TextStyle(color: Colors.white),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF2864C6),
              padding: const EdgeInsets.symmetric(vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              elevation: 0,
            ),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.touch_app_outlined, color: Colors.white),
            label: const Text("Buy Now", style: TextStyle(color: Colors.white)),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF43C976),
              padding: const EdgeInsets.symmetric(vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              elevation: 0,
            ),
          ),
        ),
      ],
    );
  }
}

class ViewSimilarButton extends StatelessWidget {
  const ViewSimilarButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: OutlinedButton.icon(
            onPressed: () {},
            icon: const Icon(
              Icons.remove_red_eye_outlined,
              color: Colors.black54,
            ),
            label: const Text(
              "View Similar",
              style: TextStyle(color: Colors.black87),
            ),
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 12),
              side: BorderSide(color: Colors.grey.shade300),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: OutlinedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.compare_arrows, color: Colors.black54),
            label: const Text(
              "Add to Compare",
              style: TextStyle(color: Colors.black87),
            ),
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 12),
              side: BorderSide(color: Colors.grey.shade300),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
