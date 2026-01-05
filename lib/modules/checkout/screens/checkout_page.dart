import 'package:stylish_app/packages/packages.dart';

class CheckoutPage extends StatefulWidget {
  final double orderTotal;
  final double shippingFee;
  final double discountAmount;
  final double finalTotal;

  const CheckoutPage({
    super.key,
    required this.orderTotal,
    required this.shippingFee,
    required this.discountAmount,
    required this.finalTotal,
  });

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  String selectedPayment = 'VISA';

  final List<CheckoutMethodModel> paymentMethods = const [
    CheckoutMethodModel(
      id: 'VISA',
      name: 'VISA',
      accountNumber: '*********2109',
      assetPath: 'assets/images/visa.png',
      fallbackIcon: Icons.credit_card,
    ),
    CheckoutMethodModel(
      id: 'PayPal',
      name: 'PayPal',
      accountNumber: '*********2109',
      assetPath: 'assets/images/paypal.png',
      fallbackIcon: Icons.paypal,
    ),
    CheckoutMethodModel(
      id: 'Maestro',
      name: 'Maestro',
      accountNumber: '*********2109',
      assetPath: 'assets/images/maestro.png',
      fallbackIcon: Icons.payment,
    ),
    CheckoutMethodModel(
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
            CheckoutOrderSummaryRow(
              label: "Order",
              value: "₹ ${widget.orderTotal.toStringAsFixed(0)}",
            ),
            const SizedBox(height: 12),
            CheckoutOrderSummaryRow(
              label: "Shipping",
              value: widget.shippingFee == 0
                  ? "Free"
                  : "₹ ${widget.shippingFee.toStringAsFixed(0)}",
            ),
            const SizedBox(height: 12),
            if (widget.discountAmount > 0) ...[
              CheckoutOrderSummaryRow(
                label: "Discount",
                value: "-₹ ${widget.discountAmount.toStringAsFixed(0)}",
              ),
              const SizedBox(height: 12),
            ],
            CheckoutOrderSummaryRow(
              label: "Total",
              value:
                  "₹ ${widget.finalTotal.toStringAsFixed(0)}", // Removed decimals as per image style usually, but image shows 7,030. Let's keep decimals if needed or remove .00 if image shows integers. Image shows "7,030", no decimals.
              isTotal: true,
            ),
            const SizedBox(height: 16),
            Divider(color: Colors.grey.shade300, thickness: 1),
            const SizedBox(height: 24),
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                "Payment",
                style: GoogleFonts.montserrat(
                  fontSize: 18, // Slightly bigger
                  fontWeight: FontWeight.w600, // Semi bold
                ),
              ),
            ),
            const SizedBox(height: 20),
            ...paymentMethods.map(
              (method) => Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: CheckoutOptionCard(
                  method: method,
                  isSelected: selectedPayment == method.id,
                  onTap: () {
                    setState(() {
                      selectedPayment = method.id;
                    });
                  },
                ),
              ),
            ),
            const SizedBox(height: 24),
            CheckoutButton(
              onPressed: () {
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (context) => const CheckoutPageSuccessDialog(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
