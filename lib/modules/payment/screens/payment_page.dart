import 'package:stylish_app/packages/packages.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  String selectedPayment = 'VISA';

  final List<PaymentMethodModel> paymentMethods = const [
    PaymentMethodModel(
      id: 'VISA',
      name: 'VISA',
      accountNumber: '*********2109',
      assetPath: 'assets/images/visa.png',
      fallbackIcon: Icons.credit_card,
    ),
    PaymentMethodModel(
      id: 'PayPal',
      name: 'PayPal',
      accountNumber: '*********2109',
      assetPath: 'assets/images/paypal.png',
      fallbackIcon: Icons.paypal,
    ),
    PaymentMethodModel(
      id: 'Maestro',
      name: 'Maestro',
      accountNumber: '*********2109',
      assetPath: 'assets/images/maestro.png',
      fallbackIcon: Icons.payment,
    ),
    PaymentMethodModel(
      id: 'Apple',
      name: 'Apple Pay',
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
            const PaymentOrderSummaryRow(label: "Order", value: "₹ 7,000"),
            const SizedBox(height: 12),
            const PaymentOrderSummaryRow(label: "Shipping", value: "₹ 30"),
            const SizedBox(height: 12),
            const PaymentOrderSummaryRow(
              label: "Total",
              value: "₹ 7,030",
              isTotal: true,
            ),
            const SizedBox(height: 32),
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
            ...paymentMethods.map(
              (method) => Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: PaymentOptionCard(
                  method: method,
                  onTap: () {
                    setState(() {
                      selectedPayment = method.id;
                    });
                  },
                ),
              ),
            ),
            const SizedBox(height: 24),
            PaymentButton(
              onPressed: () {
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (context) => const PaymentPageSuccessDialog(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
