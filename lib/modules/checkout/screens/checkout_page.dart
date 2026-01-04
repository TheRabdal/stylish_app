import 'package:stylish_app/packages/packages.dart';
import 'package:stylish_app/modules/cart/services/cart_service.dart';

class CheckoutPage extends StatelessWidget {
  final List<CartItem>? buyNowItems;

  const CheckoutPage({super.key, this.buyNowItems});

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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Delivery Address
            Row(
              children: [
                const Icon(Icons.location_on_outlined, size: 20),
                const SizedBox(width: 8),
                Text(
                  "Delivery Address",
                  style: GoogleFonts.montserrat(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withValues(alpha: 0.05),
                          blurRadius: 10,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Address :",
                              style: GoogleFonts.montserrat(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Icon(Icons.edit_outlined, size: 16),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Text(
                          "216 St Paul's Rd, London N1 2LL, UK",
                          style: GoogleFonts.montserrat(
                            fontSize: 13,
                            color: Colors.grey.shade700,
                            height: 1.5,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          "Contact :  +44-784232",
                          style: GoogleFonts.montserrat(
                            fontSize: 13,
                            color: Colors.grey.shade700,
                            height: 1.5,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Container(
                  padding: const EdgeInsets.all(
                    28,
                  ), // Adjust padding to match height approx
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withValues(alpha: 0.05),
                        blurRadius: 10,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: const Icon(Icons.add_circle_outline, size: 32),
                ),
              ],
            ),
            const SizedBox(height: 32),

            // Shopping List
            Text(
              "Shopping List",
              style: GoogleFonts.montserrat(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),

            // Dynamic Cart Items
            ListenableBuilder(
              listenable: CartService(),
              builder: (context, child) {
                final items = buyNowItems ?? CartService().items;
                if (items.isEmpty) {
                  return const Text("No items in checkout");
                }
                return Column(
                  children: items.map((item) {
                    return Column(
                      children: [
                        CheckoutItemCard(
                          item: CheckoutItemModel(
                            image: item.image,
                            title: item.title,
                            variations: [
                              item.variations,
                            ], // mapping string to list
                            rating: 4.8, // Default rating as not in CartItem
                            price: item.price,
                            originalPrice: item.oldPrice,
                            discountPercentage:
                                int.tryParse(
                                  item.discount.replaceAll('%', ''),
                                ) ??
                                0,
                            quantity: item.qty,
                          ),
                        ),
                        const SizedBox(height: 16),
                      ],
                    );
                  }).toList(),
                );
              },
            ),
            const SizedBox(height: 100),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withValues(alpha: 0.1),
              blurRadius: 10,
              offset: const Offset(0, -5),
            ),
          ],
        ),
        child: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Total",
                    style: GoogleFonts.montserrat(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                  ListenableBuilder(
                    listenable: CartService(),
                    builder: (context, child) {
                      final items = buyNowItems ?? CartService().items;
                      final total = CartService().calculateTotal(items);
                      return Text(
                        "₹ ${total.toStringAsFixed(2)}",
                        style: GoogleFonts.montserrat(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      );
                    },
                  ),
                ],
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PaymentPage(),
                    ),
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
                  "Continue to Payment",
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
      ),
    );
  }
}

// Removed duplicate CheckoutItemCard class
