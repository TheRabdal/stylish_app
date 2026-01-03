import 'package:stylish_app/packages/packages.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();

  // Dummy Data (Replicated from TrendingProducts for demo)
  final List<Product> _allProducts = [
    const Product(
      image: 'assets/images/watch.png',
      name: "IWC Schaffhausen",
      description: "2021 Pilot's Watch \"SIHH 2019\" 44mm",
      price: "₹650",
      oldPrice: "₹1599",
      discount: "60% off",
      rating: 5,
      reviewCount: 650,
    ),
    const Product(
      image: 'assets/images/whiteshoes.png',
      name: "Labbin White Sneakers",
      description: "For Men and Female",
      price: "₹650",
      oldPrice: "₹1250",
      discount: "70% off",
      rating: 4,
      reviewCount: 650,
    ),
    const Product(
      image: 'assets/images/womenshandback.png',
      name: "Mammon Women's Handbag",
      description: "(Set of 3, Beige)",
      price: "₹750",
      oldPrice: "₹1999",
      discount: "60% off",
      rating: 4,
      reviewCount: 750,
    ),
    const Product(
      image: 'assets/images/sandalcoklat.png',
      name: "Do Bhai Women Wedges Sandal",
      description: "(Butterfly)",
      price: "₹750",
      oldPrice: "₹1499",
      discount: "50% off",
      rating: 4,
      reviewCount: 750,
    ),
    const Product(
      image: 'assets/images/lipstik.png',
      name: "Lakme Enrich Matte Lipstick",
      description: "Shade RM1(4.7gm)",
      price: "₹950",
      oldPrice: "₹1990",
      discount: "60% off",
      rating: 4,
      reviewCount: 950,
    ),
    const Product(
      image: 'assets/images/jordan.png',
      name: "Nike Air Jordan",
      description: "Nike Air Jordan 1 Retro High OG",
      price: "₹1250",
      oldPrice: "₹2500",
      discount: "50% off",
      rating: 5,
      reviewCount: 120,
    ),
  ];

  List<Product> _filteredProducts = [];

  @override
  void initState() {
    super.initState();
    _filteredProducts = _allProducts;
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      if (query.isEmpty) {
        _filteredProducts = _allProducts;
      } else {
        _filteredProducts = _allProducts.where((product) {
          return product.name.toLowerCase().contains(query) ||
              product.description.toLowerCase().contains(query);
        }).toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "Search",
          style: GoogleFonts.montserrat(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Search Bar
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withValues(alpha: 0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: TextField(
                controller: _searchController,
                style: GoogleFonts.montserrat(color: Colors.black),
                decoration: InputDecoration(
                  hintText: "Search for items...",
                  hintStyle: GoogleFonts.montserrat(color: Colors.grey),
                  prefixIcon: const Icon(Icons.search, color: Colors.grey),
                  suffixIcon: _searchController.text.isNotEmpty
                      ? IconButton(
                          icon: const Icon(Icons.clear, color: Colors.grey),
                          onPressed: () {
                            _searchController.clear();
                            FocusScope.of(context).unfocus();
                          },
                        )
                      : null,
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 14,
                  ),
                ),
              ),
            ),
          ),

          // Results
          Expanded(
            child: _filteredProducts.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.search_off,
                          size: 64,
                          color: Colors.grey,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          "No results found",
                          style: GoogleFonts.montserrat(
                            fontSize: 16,
                            color: Colors.grey,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  )
                : GridView.builder(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio:
                              0.65, // Adjust based on ProductCard aspect ratio
                          crossAxisSpacing: 16,
                          mainAxisSpacing: 16,
                        ),
                    itemCount: _filteredProducts.length,
                    itemBuilder: (context, index) {
                      return ProductCard(product: _filteredProducts[index]);
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
