import 'package:stylish_app/packages/packages.dart';

class WishlistPage extends StatefulWidget {
  const WishlistPage({super.key});

  @override
  State<WishlistPage> createState() => _WishlistPageState();
}

class _WishlistPageState extends State<WishlistPage> {
  // Dummy data matching the reference image text exactly
  final List<Map<String, dynamic>> products = [
    {
      "image": "assets/blackwinter.png", // Placeholder for "Black Winter..."
      "name": "Black Winter...",
      "description": "Autumn And Winter Casual cotton-padded jacket...",
      "price": "₹499",
      "oldPrice":
          "₹999", // Changed to Rupee symbol to match image context if needed, or keep $
      "discount": "50% OFF",
      "rating": 4,
      "reviewCount": 6890,
      "height": 200.0,
    },
    {
      "image": "assets/mansstarry.png", // Matches shirt
      "name": "Mens Starry",
      "description": "Mens Starry Sky Printed Shirt 100% Cotton Fabric",
      "price": "₹399",
      "oldPrice": "₹799",
      "discount": "50% OFF",
      "rating": 4,
      "reviewCount": 152344,
      "height": 240.0,
    },
    {
      "image": "assets/blackdress.png", // Matches dress
      "name": "Black Dress",
      "description": "Solid Black Dress for Women, Sexy Chain Shorts Ladi...",
      "price": "₹2,000",
      "oldPrice": "₹4,000",
      "discount": "50% OFF",
      "rating": 5,
      "reviewCount": 523456,
      "height": 260.0,
    },
    {
      "image": "assets/pinkembroid.png", // Matches "Pink Embroide..."
      "name": "Pink Ambroide...",
      "description": "EARTHEN Rose Pink Embroidered Tiered Max...",
      "price": "₹1,900",
      "oldPrice": "₹3,800",
      "discount": "50% OFF",
      "rating": 4,
      "reviewCount": 45678,
      "height": 220.0,
    },
    {
      "image": "assets/flaredress.png", // Matches "Flare Dress"
      "name": "Flare Dress",
      "description":
          "Antheaa Black & Rust Orange Floral Print Tiered Midi F...",
      "price": "₹1,990",
      "oldPrice": "₹3,980",
      "discount": "50% OFF",
      "rating": 3,
      "reviewCount": 335566,
      "height": 240.0,
    },
    {
      "image":
          "assets/denimdress.png", // Matches "denim dress" (using kids as placeholder or closest)
      "name": "denim dress",
      "description": "Blue cotton denim dress Look 2 Printed cotton dr...",
      "price": "₹999",
      "oldPrice": "₹1,999",
      "discount": "50% OFF",
      "rating": 4,
      "reviewCount": 21344,
      "height": 210.0,
    },
    {
      "image": "assets/jordanstay.png", // Matches "Jordan Stay"
      "name": "Jordan Stay",
      "description":
          "The classic Air Jordan 12 to create a shoe that's fres...",
      "price": "₹4,999",
      "oldPrice": "₹9,999",
      "discount": "50% OFF",
      "rating": 5,
      "reviewCount": 1023456,
      "height": 180.0,
    },
    {
      "image":
          "assets/realme7.png", // Matches "Realme 7" (using electronics placeholder)
      "name": "Realme 7",
      "description": "6 GB RAM | 64 GB ROM | Expandable Upto 256...",
      "price": "₹3,499",
      "oldPrice": "₹6,999",
      "discount": "50% OFF",
      "rating": 4,
      "reviewCount": 344567,
      "height": 190.0,
    },
    {
      "image":
          "assets/ps4.png", // Matches "Sony PS4" (using watch/electronics placeholder)
      "name": "Sony PS4",
      "description": "Sony PS4 Console, 1TB Slim with 3 Games: Gran Turis...",
      "price": "₹1,999",
      "oldPrice": "₹3,999",
      "discount": "50% OFF",
      "rating": 4,
      "reviewCount": 852966,
      "height": 200.0,
    },
    {
      "image": "assets/blackjacket.png", // Matches "Black Jacket 12..."
      "name": "Black Jacket 12...",
      "description": "This warm and comfortable jacket is great for learni...",
      "price": "₹2,999",
      "oldPrice": "₹5,999",
      "discount": "50% OFF",
      "rating": 4,
      "reviewCount": 234567,
      "height": 230.0,
    },
    {
      "image": "assets/nikon.png", // Matches "D7200 Digital C..."
      "name": "D7200 Digital C...",
      "description": "D7200 Digital Camera (Nikon) In New Area...",
      "price": "₹26,999",
      "oldPrice": "₹53,998",
      "discount": "50% OFF",
      "rating": 5,
      "reviewCount": 67456,
      "height": 190.0,
    },
    {
      "image": "assets/sepatufantopel.png", // Matches "men's & boys s..."
      "name": "men's & boys s...",
      "description": "George Walker Derby Brown Formal Shoes",
      "price": "₹999",
      "oldPrice": "₹1,999",
      "discount": "50% OFF",
      "rating": 3,
      "reviewCount": 1345678,
      "height": 210.0,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(
        0xFFF9F9F9,
      ), // Light background like in image
      body: SafeArea(
        child: Column(
          children: [
            const HomeAppBar(),
            const HomeSearchBar(),

            // Header Row (Count, Sort, Filter)
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 8.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "52,082+ Items", // Corrected typo from "Iteams" to "Items"
                    style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                  Row(
                    children: [
                      _buildActionButton(
                        "Sort",
                        Icons.swap_vert,
                      ), // swap_vert looks closer to sort arrows
                      const SizedBox(width: 12),
                      _buildActionButton("Filter", Icons.filter_alt_outlined),
                    ],
                  ),
                ],
              ),
            ),

            // Masonry Grid
            Expanded(
              child: MasonryGridView.count(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 8.0,
                ),
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                itemCount: products.length,
                itemBuilder: (context, index) {
                  final product = products[index];
                  return _buildWishlistCard(product);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButton(String label, IconData icon) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.1),
            blurRadius: 4,
            spreadRadius: 0,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            label,
            style: GoogleFonts.montserrat(
              fontSize: 12,
              color: Colors.black,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(width: 4),
          Icon(icon, size: 16, color: const Color(0xFF575757)),
        ],
      ),
    );
  }

  Widget _buildWishlistCard(Map<String, dynamic> product) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        // No shadow in some cards in the image, or very subtle.
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.05),
            blurRadius: 5,
            spreadRadius: 1,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(
              8,
            ), // Image rounded on all corners or just top? Image shows items often fully rounded or top rounded. Let's stick to top/bottom logic if needed, but safe to round all for container or just top.
            child: Image.asset(product['image'], fit: BoxFit.cover),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product['name'],
                  style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.bold,
                    fontSize: 16, // Slightly larger title
                    color: Colors.black,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  product['description'],
                  style: GoogleFonts.montserrat(
                    fontSize: 10,
                    color: Colors.black54, // slightly darker than grey
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 8),
                Text(
                  product['price'],
                  style: GoogleFonts.montserrat(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Text(
                      product['oldPrice'],
                      style: GoogleFonts.montserrat(
                        fontSize: 12,
                        color: Colors.grey,
                        decoration: TextDecoration.lineThrough,
                        decorationColor: Colors.grey,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      product['discount'],
                      style: GoogleFonts.montserrat(
                        fontSize: 12,
                        color: const Color(0xFFFE735C),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    ...List.generate(
                      5,
                      (index) => Icon(
                        Icons.star,
                        size: 14,
                        color: index < product['rating']
                            ? const Color(0xFFEDB310) // Gold color
                            : Colors.grey.shade300,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      "(${product['reviewCount']})",
                      style: GoogleFonts.montserrat(
                        fontSize: 10,
                        color: const Color(0xFFA4A9B3),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
