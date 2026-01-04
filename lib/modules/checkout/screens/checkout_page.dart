import 'package:stylish_app/packages/packages.dart';

class CheckoutPage extends StatefulWidget {
  final List<CartItem>? buyNowItems;

  const CheckoutPage({super.key, this.buyNowItems});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  final ScrollController _scrollController = ScrollController();
  final List<Map<String, String>> _addresses = [
    {'address': "216 St Paul's Rd, London N1 2LL, UK", 'contact': "+44-784232"},
  ];

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _showEditAddressDialog(int index) {
    final addressController = TextEditingController(
      text: _addresses[index]['address'],
    );
    final contactController = TextEditingController(
      text: _addresses[index]['contact'],
    );

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          "Edit Address",
          style: GoogleFonts.montserrat(fontWeight: FontWeight.bold),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: addressController,
              decoration: InputDecoration(
                labelText: "Address",
                labelStyle: GoogleFonts.montserrat(),
                border: const OutlineInputBorder(),
              ),
              maxLines: 2,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: contactController,
              decoration: InputDecoration(
                labelText: "Contact",
                labelStyle: GoogleFonts.montserrat(),
                border: const OutlineInputBorder(),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              "Cancel",
              style: GoogleFonts.montserrat(color: Colors.grey),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                _addresses[index]['address'] = addressController.text;
                _addresses[index]['contact'] = contactController.text;
              });
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFF83758),
            ),
            child: Text(
              "Save",
              style: GoogleFonts.montserrat(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  void _showAddAddressDialog() {
    final addressController = TextEditingController();
    final contactController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          "Add New Address",
          style: GoogleFonts.montserrat(fontWeight: FontWeight.bold),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: addressController,
              decoration: InputDecoration(
                labelText: "Address",
                labelStyle: GoogleFonts.montserrat(),
                border: const OutlineInputBorder(),
              ),
              maxLines: 2,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: contactController,
              decoration: InputDecoration(
                labelText: "Contact",
                labelStyle: GoogleFonts.montserrat(),
                border: const OutlineInputBorder(),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              "Cancel",
              style: GoogleFonts.montserrat(color: Colors.grey),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              if (addressController.text.isNotEmpty &&
                  contactController.text.isNotEmpty) {
                setState(() {
                  _addresses.add({
                    'address': addressController.text,
                    'contact': contactController.text,
                  });
                });
                Navigator.pop(context);
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFF83758),
            ),
            child: Text(
              "Add",
              style: GoogleFonts.montserrat(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

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
      body: Padding(
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
            ..._addresses.asMap().entries.map((entry) {
              final index = entry.key;
              final addressData = entry.value;
              return Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: Row(
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
                        child: Stack(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Address :",
                                  style: GoogleFonts.montserrat(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  addressData['address']!,
                                  style: GoogleFonts.montserrat(
                                    fontSize: 12,
                                    color: Colors.grey.shade700,
                                    height: 1.5,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  "Contact :  ${addressData['contact']}",
                                  style: GoogleFonts.montserrat(
                                    fontSize: 12,
                                    color: Colors.grey.shade700,
                                    height: 1.5,
                                  ),
                                ),
                              ],
                            ),
                            Positioned(
                              top: 0,
                              right: 0,
                              child: InkWell(
                                onTap: () => _showEditAddressDialog(index),
                                child: Icon(
                                  Icons.edit_outlined,
                                  size: 16,
                                  color: Colors.grey.shade600,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    if (index == _addresses.length - 1) ...[
                      const SizedBox(width: 16),
                      InkWell(
                        onTap: _showAddAddressDialog,
                        child: Container(
                          padding: const EdgeInsets.all(28),
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
                      ),
                    ],
                  ],
                ),
              );
            }),
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

            // Dynamic Cart Items with Scrollbar
            Expanded(
              child: Scrollbar(
                controller: _scrollController,
                child: ListenableBuilder(
                  listenable: CartService(),
                  builder: (context, child) {
                    final items = widget.buyNowItems ?? CartService().items;
                    if (items.isEmpty) {
                      return const Text("No items in checkout");
                    }
                    return ListView(
                      controller: _scrollController,
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
                                rating:
                                    4.8, // Default rating as not in CartItem
                                price: item.price,
                                originalPrice: item.oldPrice,
                                discountPercentage:
                                    int.tryParse(
                                      RegExp(r'\d+')
                                              .firstMatch(item.discount)
                                              ?.group(0) ??
                                          '0',
                                    ) ??
                                    0,
                                quantity: item.qty,
                              ),
                              onTap: () {
                                if (widget.buyNowItems != null) {
                                  // Came from "Buy Now", so go to Cart (fresh navigation)
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const NavigationPage(initialIndex: 2),
                                    ),
                                  );
                                } else {
                                  // Came from Cart, so just pop back
                                  Navigator.pop(context);
                                }
                              },
                            ),
                            const SizedBox(height: 16),
                          ],
                        );
                      }).toList(),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
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
                    final items = widget.buyNowItems ?? CartService().items;
                    final double subtotal = CartService().calculateTotal(items);
                    final double discountPct = widget.buyNowItems != null
                        ? 0.0
                        : CartService().discountPercentage;
                    final double discountAmount = subtotal * discountPct;
                    final double shoppingLimit = 1000.0;
                    final double shippingFee = subtotal > shoppingLimit
                        ? 0.0
                        : 50.0;
                    final double total =
                        subtotal - discountAmount + shippingFee;

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
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ShippingScreen(),
                    ),
                  );
                },
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
      ),
    );
  }
}

// Removed duplicate CheckoutItemCard class
