import 'package:stylish_app/packages/packages.dart';

class OrderPaymentDetails extends StatelessWidget {
  const OrderPaymentDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Order Payment Details",
          style: GoogleFonts.montserrat(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        ListenableBuilder(
          listenable: CartService(),
          builder: (context, child) {
            return OrderSummaryRow(
              label: "Order Amounts",
              value: "₹ ${CartService().totalAmount.toStringAsFixed(2)}",
            );
          },
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Text(
              "Convenience",
              style: GoogleFonts.montserrat(
                fontSize: 14,
                color: Colors.grey.shade700,
              ),
            ),
            const SizedBox(width: 16),
            Text(
              "Know More",
              style: GoogleFonts.montserrat(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: const Color(0xFFF83758),
              ),
            ),
            const Spacer(),
            Text(
              "Apply Coupon",
              style: GoogleFonts.montserrat(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: const Color(0xFFF83758),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Delivery Fee",
              style: GoogleFonts.montserrat(
                fontSize: 14,
                color: Colors.grey.shade700,
              ),
            ),
            Text(
              "Free",
              style: GoogleFonts.montserrat(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: const Color(0xFFF83758),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        const Divider(),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Order Total",
              style: GoogleFonts.montserrat(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            ListenableBuilder(
              listenable: CartService(),
              builder: (context, child) {
                return Text(
                  "₹ ${CartService().totalAmount.toStringAsFixed(2)}",
                  style: GoogleFonts.montserrat(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                );
              },
            ),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Text(
              "EMI Available",
              style: GoogleFonts.montserrat(
                fontSize: 14,
                color: Colors.grey.shade700,
              ),
            ),
            const SizedBox(width: 16),
            GestureDetector(
              onTap: () {
                PaymentDetailsBottomSheet.show(context);
              },
              behavior: HitTestBehavior.opaque,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
                child: Text(
                  "Details",
                  style: GoogleFonts.montserrat(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFFF83758),
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
