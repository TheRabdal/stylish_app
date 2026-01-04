import 'package:stylish_app/packages/packages.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      appBar: AppBar(
        title: Text(
          "Shopping Bag",
          style: GoogleFonts.montserrat(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite_border, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Cart Items List
            ListenableBuilder(
              listenable: CartService(),
              builder: (context, child) {
                if (CartService().items.isEmpty) {
                  return const Padding(
                    padding: EdgeInsets.all(32.0),
                    child: Center(child: Text("Your cart is empty")),
                  );
                }
                return Column(
                  children: CartService().items.map((item) {
                    return Column(
                      children: [
                        Dismissible(
                          key: ValueKey(item),
                          direction: DismissDirection.endToStart,
                          background: Container(
                            alignment: Alignment.centerRight,
                            padding: const EdgeInsets.only(right: 20.0),
                            color: Colors.red,
                            child: const Icon(
                              Icons.delete,
                              color: Colors.white,
                            ),
                          ),
                          onDismissed: (direction) {
                            CartService().removeItem(item);
                            ScaffoldMessenger.of(context).hideCurrentSnackBar();
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                duration: const Duration(seconds: 5),
                                content: Text(
                                  "${item.title} removed from cart",
                                ),
                                action: SnackBarAction(
                                  label: "Undo",
                                  onPressed: () {
                                    CartService().addItem(item);
                                  },
                                ),
                              ),
                            );
                          },
                          child: CartItemWidget(
                            image: item.image,
                            title: item.title,
                            variations: item.variations,
                            size: item.size,
                            qty: item.qty.toString(),
                            deliveryDate: item.deliveryDate,
                            price: item.price,
                            oldPrice: item.oldPrice,
                            discount: item.discount,
                            onSizeChanged: (newSize) {
                              CartService().updateItem(
                                item,
                                item.copyWith(size: newSize),
                              );
                            },
                            onQtyChanged: (newQty) {
                              if (newQty < 1) {
                                CartService().removeItem(item);
                              } else {
                                CartService().updateItem(
                                  item,
                                  item.copyWith(qty: newQty),
                                );
                              }
                            },
                          ),
                        ),
                        const SizedBox(height: 24),
                      ],
                    );
                  }).toList(),
                );
              },
            ),
            const SizedBox(height: 24),

            // Coupon Section
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
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
              child: Row(
                children: [
                  const Icon(Icons.confirmation_number_outlined),
                  const SizedBox(width: 12),
                  Text(
                    "Apply Coupons",
                    style: GoogleFonts.montserrat(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    "Select",
                    style: GoogleFonts.montserrat(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFFF83758),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Order Payment Details
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Convenience",
                  style: GoogleFonts.montserrat(
                    fontSize: 14,
                    color: Colors.grey.shade700,
                  ),
                ),
                Text(
                  "Know More",
                  style: GoogleFonts.montserrat(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFFF83758),
                  ),
                ),
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
                const SizedBox(width: 8),
                Text(
                  "Details",
                  style: GoogleFonts.montserrat(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFFF83758),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 100), // Bottom padding
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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListenableBuilder(
                    listenable: CartService(),
                    builder: (context, child) {
                      return Text(
                        "₹ ${CartService().totalAmount.toStringAsFixed(2)}",
                        style: GoogleFonts.montserrat(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      );
                    },
                  ),
                  Text(
                    "View Details",
                    style: GoogleFonts.montserrat(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFFF83758),
                    ),
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CheckoutPage(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32,
                    vertical: 14,
                  ),
                  backgroundColor: const Color(0xFFF83758),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  elevation: 0,
                ),
                child: Text(
                  "Proceed to Payment",
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

class CartItemWidget extends StatelessWidget {
  final String image;
  final String title;
  final String variations;
  final String size;
  final String qty;
  final String deliveryDate;
  final double price;
  final double oldPrice;
  final String discount;
  final Function(String) onSizeChanged; // Callback for size change
  final Function(int) onQtyChanged; // Callback for qty change

  const CartItemWidget({
    super.key,
    required this.image,
    required this.title,
    required this.variations,
    required this.size,
    required this.qty,
    required this.deliveryDate,
    required this.price,
    required this.oldPrice,
    required this.discount,
    required this.onSizeChanged,
    required this.onQtyChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                image,
                width: 100,
                height: 120,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) =>
                    Container(width: 100, height: 120, color: Colors.grey),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.montserrat(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    variations,
                    style: GoogleFonts.montserrat(
                      fontSize: 12,
                      color: Colors.grey.shade700,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      // Size Selector
                      GestureDetector(
                        onTap: () async {
                          final selectedSize = await showDialog<String>(
                            context: context,
                            builder: (context) => SimpleDialog(
                              title: const Text("Select Size"),
                              children:
                                  ['6 UK', '7 UK', '8 UK', '9 UK', '10 UK']
                                      .map(
                                        (s) => SimpleDialogOption(
                                          onPressed: () =>
                                              Navigator.pop(context, s),
                                          child: Text(s),
                                        ),
                                      )
                                      .toList(),
                            ),
                          );
                          if (selectedSize != null) {
                            onSizeChanged(selectedSize);
                          }
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Row(
                            children: [
                              Text(
                                "Size $size",
                                style: GoogleFonts.montserrat(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const Icon(Icons.keyboard_arrow_down, size: 16),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),

                      // Quantity Selector
                      GestureDetector(
                        onTap: () async {
                          final selectedQty = await showDialog<int>(
                            context: context,
                            builder: (context) => SimpleDialog(
                              title: const Text("Select Quantity"),
                              children: List.generate(100, (index) => index + 1)
                                  .map(
                                    (q) => SimpleDialogOption(
                                      onPressed: () =>
                                          Navigator.pop(context, q),
                                      child: Text(q.toString()),
                                    ),
                                  )
                                  .toList(),
                            ),
                          );
                          if (selectedQty != null) {
                            onQtyChanged(selectedQty);
                          }
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Row(
                            children: [
                              Text(
                                "Qty $qty",
                                style: GoogleFonts.montserrat(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const Icon(Icons.keyboard_arrow_down, size: 16),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Delivery by $deliveryDate",
                    style: GoogleFonts.montserrat(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class OrderSummaryRow extends StatelessWidget {
  final String label;
  final String value;

  const OrderSummaryRow({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: GoogleFonts.montserrat(
            fontSize: 14,
            color: Colors.grey.shade700,
          ),
        ),
        Text(
          value,
          style: GoogleFonts.montserrat(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
