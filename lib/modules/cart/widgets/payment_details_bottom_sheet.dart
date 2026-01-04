import 'package:stylish_app/packages/packages.dart';

class PaymentDetailsBottomSheet extends StatelessWidget {
  const PaymentDetailsBottomSheet({super.key});

  static void show(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      isScrollControlled: true,
      builder: (context) => const PaymentDetailsBottomSheet(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            "Payment Details",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 24),
          ListenableBuilder(
            listenable: CartService(),
            builder: (context, child) {
              final items = CartService().items;
              final double subtotal = CartService().calculateTotal(items);
              final double discountPct = CartService().discountPercentage;
              final double discountAmount = subtotal * discountPct;
              final double total = subtotal - discountAmount;

              return Column(
                children: [
                  OrderSummaryRow(
                    label: "Order",
                    value: "₹ ${subtotal.toStringAsFixed(2)}",
                  ),
                  const SizedBox(height: 12),
                  OrderSummaryRow(
                    label: "Discount",
                    value: "-₹ ${discountAmount.toStringAsFixed(2)}",
                  ),
                  const SizedBox(height: 12),
                  const OrderSummaryRow(label: "Shipping", value: "Free"),
                  const Divider(height: 32),
                  OrderSummaryRow(
                    label: "Total",
                    value: "₹ ${total.toStringAsFixed(2)}",
                  ),
                ],
              );
            },
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
