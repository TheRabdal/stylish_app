import 'package:stylish_app/packages/packages.dart'; // Models are not exported by packages.dart

class ShippingScreen extends StatefulWidget {
  const ShippingScreen({super.key});

  @override
  State<ShippingScreen> createState() => _ShippingScreenState();
}

class _ShippingScreenState extends State<ShippingScreen> {
  // Dummy Data
  final ShippingSummaryModel _summary = ShippingSummaryModel(
    orderAmount: 7000,
    shippingFee: 30,
    totalAmount: 7030,
  );

  final List<PaymentMethodModel> _paymentMethods = [
    PaymentMethodModel(
      name: "Visa",
      maskedNumber: "2109",
      isSelected: true,
      iconData: Icons.credit_card, // Fallback
    ),
    PaymentMethodModel(
      name: "PayPal",
      maskedNumber: "2109",
      iconData: Icons.paypal,
    ),
    PaymentMethodModel(
      name: "Maestro",
      maskedNumber: "2109",
      iconData: Icons.payment,
    ),
    PaymentMethodModel(
      name: "Apple Pay",
      maskedNumber: "2109",
      iconData: Icons.apple,
    ),
  ];

  void _handlePaymentSelection(int index) {
    setState(() {
      for (var i = 0; i < _paymentMethods.length; i++) {
        _paymentMethods[i].isSelected = i == index;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "Checkout",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  OrderSummarySection(summary: _summary),
                  const SizedBox(height: 12),
                  const Text(
                    "Payment",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 20),
                  ...List.generate(_paymentMethods.length, (index) {
                    return PaymentMethodCard(
                      method: _paymentMethods[index],
                      onTap: () => _handlePaymentSelection(index),
                    );
                  }),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  // Final payment logic would go here
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFF95B5B), // Custom pink/red
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  elevation: 0,
                ),
                child: const Text(
                  "Continue",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
