import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/payment_method_model.dart';
import '../widgets/payment_success_dialog.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  String selectedPayment = 'VISA'; // Default

  // Extracted Payment Methods
  final List<PaymentMethodModel> _paymentMethods = [
    const PaymentMethodModel(
      id: 'VISA',
      name: 'VISA',
      accountNumber: '*********2109',
      assetPath: 'assets/images/visa.png',
      fallbackIcon: Icons.credit_card,
    ),
    const PaymentMethodModel(
      id: 'PayPal',
      name: 'PayPal',
      accountNumber: '*********2109',
      assetPath: 'assets/images/paypal.png',
      fallbackIcon: Icons.paypal,
    ),
    const PaymentMethodModel(
      id: 'Maestro',
      name: 'Maestro',
      accountNumber: '*********2109',
      assetPath: 'assets/images/maestro.png',
      fallbackIcon: Icons.payment,
    ),
    const PaymentMethodModel(
      id: 'Apple',
      name: 'Apple',
      accountNumber: '*********2109',
      assetPath: 'assets/images/apple.png',
      fallbackIcon: Icons.apple,
    ),
  ];

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
            ..._paymentMethods.map(
              (method) => Column(
                children: [
                  _buildPaymentOption(method),
                  const SizedBox(height: 16),
                ],
              ),
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

  Widget _buildPaymentOption(PaymentMethodModel method) {
    bool isSelected = selectedPayment == method.id;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedPayment = method.id;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        decoration: BoxDecoration(
          color: Colors.grey.shade50,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: isSelected ? const Color(0xFFF83758) : Colors.transparent,
            width: 1.5,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                // Ideally Image.asset(method.assetPath)
                Icon(
                  method.fallbackIcon,
                  size: 24,
                  color: method.id == 'VISA'
                      ? Colors.blue.shade900
                      : Colors.black,
                ),
                const SizedBox(width: 16),
                Text(
                  method.name,
                  style: GoogleFonts.montserrat(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Text(
              method.accountNumber,
              style: GoogleFonts.montserrat(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
