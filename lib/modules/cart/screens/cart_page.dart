import 'package:stylish_app/packages/packages.dart';

class CartPage extends StatefulWidget {
  final bool showBackButton;

  const CartPage({super.key, this.showBackButton = true});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      appBar: CartAppBar(showBackButton: widget.showBackButton),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CartItemsList(),
            SizedBox(height: 24),
            CouponSection(),
            SizedBox(height: 20),
            Divider(),
            SizedBox(height: 20),
            OrderPaymentDetails(),
            SizedBox(height: 100),
          ],
        ),
      ),
      bottomNavigationBar: const CartBottomBar(),
    );
  }
}
