import 'package:stylish_app/packages/packages.dart';

class ProductDetailInfo extends StatefulWidget {
  final ProductStore product;

  const ProductDetailInfo({super.key, required this.product});

  @override
  State<ProductDetailInfo> createState() => _ProductDetailInfoState();
}

class _ProductDetailInfoState extends State<ProductDetailInfo> {
  late List<ProductSize> _sizes;
  String _selectedSizeLabel = '7 UK';

  @override
  void initState() {
    super.initState();
    // User requested sizes 6 to 10
    _sizes = [
      ProductSize(label: '6 UK', isSelected: false),
      ProductSize(label: '7 UK', isSelected: true),
      ProductSize(label: '8 UK', isSelected: false),
      ProductSize(label: '9 UK', isSelected: false),
      ProductSize(label: '10 UK', isSelected: false),
    ];
  }

  void _handleSizeSelection(String label) {
    setState(() {
      _selectedSizeLabel = label;
      _sizes = _sizes.map((s) {
        return ProductSize(
          label: s.label,
          isSelected: s.label == label,
          isAvailable: s.isAvailable,
        );
      }).toList();
    });
  }

  String _getMonthName(int month) {
    const months = [
      "Jan",
      "Feb",
      "Mar",
      "Apr",
      "May",
      "Jun",
      "Jul",
      "Aug",
      "Sep",
      "Oct",
      "Nov",
      "Dec",
    ];
    return months[month - 1];
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizeSelector(sizes: _sizes, onSizeSelected: _handleSizeSelection),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  widget.product.name,
                  style: GoogleFonts.montserrat(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              ListenableBuilder(
                listenable: WishlistService(),
                builder: (context, child) {
                  final isLiked = WishlistService().isWishlisted(
                    widget.product,
                  );
                  return IconButton(
                    onPressed: () {
                      WishlistService().toggleResult(widget.product);
                    },
                    icon: Icon(
                      isLiked ? Icons.favorite : Icons.favorite_border,
                      color: isLiked ? Colors.red : Colors.grey,
                      size: 24,
                    ),
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                  );
                },
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            "Vision Alta Men's Shoes Size (All Colours)", // Subtitle from image
            style: GoogleFonts.montserrat(
              fontSize: 13,
              color: Colors.grey.shade700,
            ),
          ),
          const SizedBox(height: 8),

          // Rating
          Row(
            children: [
              ...List.generate(
                5,
                (index) => Icon(
                  Icons.star,
                  size: 16,
                  color: index < widget.product.rating
                      ? Colors.amber
                      : Colors.grey.shade300,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                "56,890", // Fixed count from image or dynamic
                style: GoogleFonts.montserrat(fontSize: 12, color: Colors.grey),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // Price
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "₹2,999", // Old Price match image style (Strikethrough)
                style: GoogleFonts.montserrat(
                  fontSize: 14,
                  color: Colors.grey,
                  decoration: TextDecoration.lineThrough,
                  decorationColor: Colors.grey,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                "₹1,500", // Current Price
                style: GoogleFonts.montserrat(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                "50% Off", // Discount
                style: GoogleFonts.montserrat(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFFFE735C),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // Product Details Header
          Text(
            "Product Details",
            style: GoogleFonts.montserrat(
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 4),
          RichText(
            text: TextSpan(
              style: GoogleFonts.montserrat(
                fontSize: 12,
                color: Colors.grey.shade700,
                height: 1.5,
              ),
              children: [
                TextSpan(text: widget.product.description),
                TextSpan(
                  text: " ...More",
                  style: GoogleFonts.montserrat(
                    color: const Color(0xFFFE735C),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),
          // Feature Icons
          Row(
            children: [
              _buildFeatureIcon(Icons.location_on_outlined, "Nearest Store"),
              const SizedBox(width: 8),
              _buildFeatureIcon(Icons.lock_outline, "VIP"),
              const SizedBox(width: 8),
              _buildFeatureIcon(Icons.cached, "Return policy"),
            ],
          ),
          const SizedBox(height: 24),

          // Buttons
          Row(
            children: [
              Expanded(
                child: _buildCustomButton(
                  context: context,
                  label: "Go to cart",
                  icon: Icons.shopping_cart_outlined,
                  gradientColors: [
                    const Color(0xFF3366FF),
                    const Color(0xFF0033CC),
                  ],
                  iconGradientColors: [
                    const Color(0xFF5C8AFF),
                    const Color(0xFF1A4CFF),
                  ],
                  onTap: () {
                    // Add to Cart
                    final priceString = widget.product.price.replaceAll(
                      RegExp(r'[^0-9.]'),
                      '',
                    );
                    final oldPriceString = widget.product.oldPrice.replaceAll(
                      RegExp(r'[^0-9.]'),
                      '',
                    );

                    final cartItem = CartItem(
                      image: widget.product.image,
                      title: widget.product.name,
                      variations: "Standard",
                      size: _selectedSizeLabel, // Use dynamic selected size
                      qty: 1,
                      deliveryDate:
                          "${DateTime.now().add(const Duration(days: 5)).day} ${_getMonthName(DateTime.now().add(const Duration(days: 5)).month)} ${DateTime.now().add(const Duration(days: 5)).year}",
                      price: double.tryParse(priceString) ?? 0.0,
                      oldPrice: double.tryParse(oldPriceString) ?? 0.0,
                      discount: widget.product.discount,
                    );

                    CartService().addItem(cartItem);

                    // Navigate to Cart Page
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            const NavigationPage(initialIndex: 2),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: _buildCustomButton(
                  context: context,
                  label: "Buy Now",
                  icon: Icons.touch_app_outlined,
                  gradientColors: [
                    const Color(0xFF69F0AE),
                    const Color(0xFF00C853),
                  ],
                  iconGradientColors: [
                    const Color(0xFF90F7C7),
                    const Color(0xFF4AC786),
                  ],
                  onTap: () {
                    // Create CartItem for Buy Now
                    final priceString = widget.product.price.replaceAll(
                      RegExp(r'[^0-9.]'),
                      '',
                    );
                    final oldPriceString = widget.product.oldPrice.replaceAll(
                      RegExp(r'[^0-9.]'),
                      '',
                    );

                    final cartItem = CartItem(
                      image: widget.product.image,
                      title: widget.product.name,
                      variations: "Standard",
                      size: _selectedSizeLabel,
                      qty: 1,
                      deliveryDate:
                          "${DateTime.now().add(const Duration(days: 5)).day} ${_getMonthName(DateTime.now().add(const Duration(days: 5)).month)} ${DateTime.now().add(const Duration(days: 5)).year}",
                      price: double.tryParse(priceString) ?? 0.0,
                      oldPrice: double.tryParse(oldPriceString) ?? 0.0,
                      discount: widget.product.discount,
                    );

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            DeliveryPage(buyNowItems: [cartItem]),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),

          const SizedBox(height: 24),
          // Delivery Banner
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            decoration: BoxDecoration(
              color: const Color(0xFFFFCDD2), // Pinkish BG
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Delivery in",
                  style: GoogleFonts.montserrat(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  "1 within Hour", // Typos preserved from design if needed, or corrected: "1 Hour"
                  style: GoogleFonts.montserrat(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),

          // View Similar / Compare Row
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.visibility_outlined,
                        size: 18,
                        color: Colors.grey,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        "View Similar",
                        style: GoogleFonts.montserrat(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey.shade800,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.compare_arrows_outlined,
                        size: 18,
                        color: Colors.grey,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        "Add to Compare",
                        style: GoogleFonts.montserrat(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey.shade800,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          // Spacing for SimilarProducts below this widget (handled in page)
        ],
      ),
    );
  }

  Widget _buildFeatureIcon(IconData icon, String label) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 8,
      ), // slightly larger padding
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade400),
        borderRadius: BorderRadius.circular(5), // More rounded
      ),
      child: Row(
        children: [
          Icon(
            icon,
            size: 16,
            color: Colors.grey.shade600,
          ), // Slightly larger icon
          const SizedBox(width: 6),
          Text(
            label,
            style: GoogleFonts.montserrat(
              fontSize: 11, // Slightly larger text
              color: Colors.grey.shade700,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCustomButton({
    required BuildContext context,
    required String label,
    required IconData icon,
    required List<Color> gradientColors,
    required List<Color> iconGradientColors,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: gradientColors,
          ),
          boxShadow: [
            BoxShadow(
              color: gradientColors.last.withValues(
                alpha: 0.5,
              ), // Stronger shadow
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.only(left: 30), // Offset for icon
                child: Text(
                  label,
                  style: GoogleFonts.montserrat(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                    shadows: [
                      Shadow(
                        color: Colors.black.withValues(
                          alpha: 0.2,
                        ), // Text shadow
                        blurRadius: 2,
                        offset: const Offset(0, 1),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              left: 0,
              top: 0,
              bottom: 0,
              child: Container(
                width: 50,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: iconGradientColors,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(
                        alpha: 0.2,
                      ), // Stronger icon shadow
                      blurRadius: 5,
                      offset: const Offset(2, 2),
                    ),
                  ],
                  border: Border.all(
                    color: Colors.white.withValues(alpha: 0.3),
                    width: 1.5,
                  ), // Sharper border
                ),
                child: Icon(icon, color: Colors.white, size: 24),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Removed duplicate SizeSelector class
