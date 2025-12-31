import 'package:stylish_app/packages/packages.dart';

class TrendingProducts extends StatefulWidget {
  const TrendingProducts({super.key});

  @override
  State<TrendingProducts> createState() => _TrendingProductsState();
}

class _TrendingProductsState extends State<TrendingProducts> {
  final ScrollController _scrollController = ScrollController();

  void _scrollRight() {
    if (_scrollController.hasClients) {
      _scrollController.animateTo(
        _scrollController.offset + 200,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFFFD6E87),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Trending Products",
                      style: GoogleFonts.montserrat(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        const Icon(
                          Icons.calendar_today,
                          color: Colors.white,
                          size: 14,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          "Last Date 29/02/22",
                          style: GoogleFonts.montserrat(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Row(
                    children: [
                      Text(
                        "View all",
                        style: GoogleFonts.montserrat(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(width: 4),
                      const Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                        size: 14,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),
        Stack(
          children: [
            SizedBox(
              height: 250,
              child: ListView(
                controller: _scrollController,
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: const [
                  ProductCard(
                    image: 'assets/images/watch.png',
                    name: "IWC Schaffhausen",
                    description: "2021 Pilot's Watch \"SIHH 2019\" 44mm",
                    price: "₹650",
                    oldPrice: "₹1599",
                    discount: "60% off",
                    rating: 5,
                    reviewCount: 650,
                  ),
                  SizedBox(width: 16),
                  ProductCard(
                    image: 'assets/images/whiteshoes.png',
                    name: "Labbin White Sneakers",
                    description: "For Men and Female",
                    price: "₹650",
                    oldPrice: "₹1250",
                    discount: "70% off",
                    rating: 4,
                    reviewCount: 650,
                  ),
                  SizedBox(width: 16),
                  ProductCard(
                    image: 'assets/images/womenshandback.png',
                    name: "Mammon Women's Handbag",
                    description: "(Set of 3, Beige)",
                    price: "₹750",
                    oldPrice: "₹1999",
                    discount: "60% off",
                    rating: 4,
                    reviewCount: 750,
                  ),
                  SizedBox(width: 16),
                  ProductCard(
                    image: 'assets/images/sandalcoklat.png',
                    name: "Do Bhai Women Wedges Sandal",
                    description: "(Butterfly)",
                    price: "₹750",
                    oldPrice: "₹1499",
                    discount: "50% off",
                    rating: 4,
                    reviewCount: 750,
                  ),
                  SizedBox(width: 16),
                  ProductCard(
                    image: 'assets/images/lipstik.png',
                    name: "Lakme Enrich Matte Lipstick",
                    description: "Shade RM1(4.7gm)",
                    price: "₹950",
                    oldPrice: "₹1990",
                    discount: "60% off",
                    rating: 4,
                    reviewCount: 950,
                  ),
                ],
              ),
            ),
            Positioned(
              right: 8,
              top: 0,
              bottom: 0,
              child: Center(child: ArrowButton(onTap: _scrollRight)),
            ),
          ],
        ),
      ],
    );
  }
}
