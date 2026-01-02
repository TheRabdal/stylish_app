import 'package:stylish_app/packages/packages.dart' hide PaymentSuccessDialog;
import 'package:stylish_app/modules/checkout/widgets/payment_success_dialog.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  String selectedPayment = 'VISA'; // Default

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      appBar: AppBar(
        title: Text(
          "Checkout",
          style: GoogleFonts.montserrat(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Order Summary
            _buildSummaryRow("Order", "₹ 7,000"),
            const SizedBox(height: 12),
            _buildSummaryRow("Shipping", "₹ 30"),
            const SizedBox(height: 12),
            _buildSummaryRow("Total", "₹ 7,030", isTotal: true),
            const SizedBox(height: 32),

            // Payment Methods Title
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                "Payment",
                style: GoogleFonts.montserrat(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Payment Methods List
            _buildPaymentOption(
              'VISA',
              '*********2109',
              'assets/images/visa.png',
              Icons.credit_card,
            ),
            const SizedBox(height: 16),
            _buildPaymentOption(
              'PayPal',
              '*********2109',
              'assets/images/paypal.png',
              Icons.paypal,
            ),
            const SizedBox(height: 16),
            _buildPaymentOption(
              'Maestro',
              '*********2109',
              'assets/images/maestro.png',
              Icons.payment,
            ),
            const SizedBox(height: 16),
            _buildPaymentOption(
              'Apple',
              '*********2109',
              'assets/images/apple.png',
              Icons.apple,
            ),

            const SizedBox(height: 40),

            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (context) => const PaymentSuccessDialog(),
                );
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
                backgroundColor: const Color(0xFFF83758),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                elevation: 0,
              ),
              child: Text(
                "Continue",
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

  Widget _buildSummaryRow(String label, String value, {bool isTotal = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: GoogleFonts.montserrat(
            fontSize: isTotal ? 16 : 14,
            fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
            color: isTotal ? Colors.black : Colors.grey,
          ),
        ),
        Text(
          value,
          style: GoogleFonts.montserrat(
            fontSize: isTotal ? 16 : 14,
            fontWeight: isTotal ? FontWeight.bold : FontWeight.w600,
            color: Colors.black,
          ),
        ),
      ],
    );
  }

  Widget _buildPaymentOption(
    String id,
    String subtitle,
    String assetPath,
    IconData fallbackIcon,
  ) {
    // Note: Since I likely don't have the assets, I will use Icon fallback if possible or just Text
    // But design shows logos. I'll maintain structure.
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: Colors.transparent,
        ), // Can add selection logic
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              // Ideally Image.asset(assetPath) but I'll use text/icon for safety in this env
              Icon(
                fallbackIcon,
                size: 24,
                color: id == 'VISA' ? Colors.blue.shade900 : Colors.black,
              ),
              const SizedBox(width: 16),
              Text(
                id, // Just to show something if image fails or as title
                style: GoogleFonts.montserrat(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Text(subtitle, style: GoogleFonts.montserrat(color: Colors.grey)),
        ],
      ),
    );
  }
}
