import 'package:stylish_app/packages/packages.dart';

class HomeContent extends StatefulWidget {
  const HomeContent({super.key});

  @override
  State<HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  final TextEditingController _searchController = TextEditingController();
  String _currentSort = "Relevance";
  bool _isSorted = false;
  String _searchQuery = "";

  RangeValues? _filterPriceRange;

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    setState(() {
      _searchQuery = _searchController.text;
    });
  }

  void _onSortPressed() async {
    final result = await showModalBottomSheet<String>(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => SortBottomSheet(currentSort: _currentSort),
    );
    if (result != null) {
      setState(() {
        _currentSort = result;
        _isSorted = result != "Relevance";
      });
    }
  }

  void _onFilterPressed() async {
    final result = await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => FilterDrawer(initialPriceRange: _filterPriceRange),
    );

    if (result != null && result is Map) {
      setState(() {
        if (result.containsKey('priceRange')) {
          _filterPriceRange = result['priceRange'];
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    bool isFiltered = _filterPriceRange != null;
    bool showProductList = _searchQuery.isNotEmpty || _isSorted || isFiltered;

    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HomeAppBar(),
              HomeSearchBar(
                controller: _searchController,
                onChanged: _onSearchChanged,
              ),
              const SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "All Featured",
                      style: GoogleFonts.montserrat(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: [
                        _buildActionButton(
                          "Sort",
                          Icons.swap_vert,
                          _onSortPressed,
                        ),
                        const SizedBox(width: 8),
                        _buildActionButton(
                          "Filter",
                          Icons.filter_alt_outlined,
                          _onFilterPressed,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
            ],
          ),
        ),
        if (showProductList)
          _buildProductListSliver()
        else
          SliverToBoxAdapter(child: _buildHomeContentColumn()),
      ],
    );
  }

  Widget _buildActionButton(String label, IconData icon, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(6),
      child: Container(
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
      ),
    );
  }

  Widget _buildHomeContentColumn() {
    return const Column(
      children: [
        CategorySection(),
        PromoBanner(),
        DealOfDay(),
        SizedBox(height: 16),
        SpecialOffers(),
        FlatHeelsBanner(),
        SizedBox(height: 16),
        TrendingProducts(),
        SizedBox(height: 16),
        NewArrivals(),
        SizedBox(height: 16),
        SponsoredBanner(),
        SizedBox(height: 30),
      ],
    );
  }

  Widget _buildProductListSliver() {
    List<ProductStore> displayedProducts = List.from(allProducts);

    // Apply Search
    if (_searchQuery.isNotEmpty) {
      displayedProducts = displayedProducts.where((product) {
        return product.name.toLowerCase().contains(_searchQuery.toLowerCase());
      }).toList();
    }

    // Apply Filter (Price Range)
    if (_filterPriceRange != null) {
      displayedProducts = displayedProducts.where((product) {
        double price =
            double.tryParse(product.price.replaceAll(RegExp(r'[^0-9.]'), '')) ??
            0;
        return price >= _filterPriceRange!.start &&
            price <= _filterPriceRange!.end;
      }).toList();
    }

    // Apply Sort
    if (_currentSort == "Price: Low to High") {
      displayedProducts.sort((a, b) {
        double priceA =
            double.tryParse(a.price.replaceAll(RegExp(r'[^0-9.]'), '')) ?? 0;
        double priceB =
            double.tryParse(b.price.replaceAll(RegExp(r'[^0-9.]'), '')) ?? 0;
        return priceA.compareTo(priceB);
      });
    } else if (_currentSort == "Price: High to Low") {
      displayedProducts.sort((a, b) {
        double priceA =
            double.tryParse(a.price.replaceAll(RegExp(r'[^0-9.]'), '')) ?? 0;
        double priceB =
            double.tryParse(b.price.replaceAll(RegExp(r'[^0-9.]'), '')) ?? 0;
        return priceB.compareTo(priceA);
      });
    }

    if (displayedProducts.isEmpty) {
      return SliverToBoxAdapter(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 50.0),
            child: Text(
              "No products found",
              style: GoogleFonts.montserrat(color: Colors.grey, fontSize: 16),
            ),
          ),
        ),
      );
    }

    return SliverPadding(
      padding: const EdgeInsets.all(16),
      sliver: SliverGrid(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.7,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),
        delegate: SliverChildBuilderDelegate((context, index) {
          return ProductCard(product: displayedProducts[index]);
        }, childCount: displayedProducts.length),
      ),
    );
  }
}
