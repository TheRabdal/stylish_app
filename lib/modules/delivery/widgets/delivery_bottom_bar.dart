import 'package:stylish_app/packages/packages.dart';

class DeliveryBottomBar extends StatelessWidget {
  final List<CartItem>? buyNowItems;
  final VoidCallback onContinue;

  const DeliveryBottomBar({
    super.key,
    this.buyNowItems,
    required this.onContinue,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Total Payments",
                style: GoogleFonts.montserrat(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              ListenableBuilder(
                listenable: CartService(),
                builder: (context, child) {
                  final items = buyNowItems ?? CartService().items;
                  final double subtotal = CartService().calculateTotal(items);
                  final double discountPct = buyNowItems != null
                      ? 0.0
                      : CartService().discountPercentage;
                  final double discountAmount = subtotal * discountPct;
                  final double shoppingLimit = 1000.0;
                  final double shippingFee = subtotal > shoppingLimit
                      ? 0.0
                      : 50.0;
                  final double total = subtotal - discountAmount + shippingFee;

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "Order: ₹ ${subtotal.toStringAsFixed(2)}",
                        style: GoogleFonts.montserrat(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                      Text(
                        shippingFee == 0.0
                            ? "Shipping: Free"
                            : "Shipping: ₹ ${shippingFee.toStringAsFixed(2)}",
                        style: GoogleFonts.montserrat(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                      if (discountPct > 0)
                        Text(
                          "Discount: -₹ ${discountAmount.toStringAsFixed(2)}",
                          style: GoogleFonts.montserrat(
                            fontSize: 12,
                            color: const Color(0xFFF83758),
                          ),
                        ),
                      const SizedBox(height: 4),
                      Text(
                        "Total: ₹ ${total.toStringAsFixed(2)}",
                        style: GoogleFonts.montserrat(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              onPressed: onContinue,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFF83758),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                elevation: 0,
              ),
              child: const Text(
                "Continue to Payment",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
