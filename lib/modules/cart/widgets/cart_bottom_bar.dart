import 'package:stylish_app/packages/packages.dart';

class CartBottomBar extends StatelessWidget {
  const CartBottomBar({super.key});

  void _handleCheckout(BuildContext context) {
    final items = CartService().items;

    if (items.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Keranjang belanja Anda kosong. Silakan tambahkan produk terlebih dahulu.',
            style: GoogleFonts.montserrat(),
          ),
          backgroundColor: const Color(0xFFF83758),
          behavior: SnackBarBehavior.floating,
          duration: const Duration(seconds: 3),
        ),
      );
      return;
    }

    // Calculate Price
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
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.1),
            blurRadius: 10,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListenableBuilder(
                  listenable: CartService(),
                  builder: (context, child) {
                    return Text(
                      "₹ ${CartService().totalAmount.toStringAsFixed(2)}",
                      style: GoogleFonts.montserrat(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    );
                  },
                ),
                Text(
                  "View Details",
                  style: GoogleFonts.montserrat(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFFF83758),
                  ),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () => _handleCheckout(context),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: 14,
                ),
                backgroundColor: const Color(0xFFF83758),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                elevation: 0,
              ),
              child: Text(
                "Proceed to Payment",
                style: GoogleFonts.montserrat(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
