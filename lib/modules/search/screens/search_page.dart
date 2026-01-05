import 'package:stylish_app/packages/packages.dart';

class SearchPage extends StatefulWidget {
  final bool autofocus;
  const SearchPage({super.key, this.autofocus = false});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();

  String _currentSort = "Relevance";
  RangeValues? _filterPriceRange;
  String _searchQuery = "";

  final List<ProductStore> _allProducts = trendingProductsList;
  List<ProductStore> _processedProducts = [];

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchChanged);
    _updateProcessedProducts();
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
      _updateProcessedProducts();
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
        _updateProcessedProducts();
      });
    }
  }

  void _onFilterPressed() async {
    final result = await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) =>
          FilterDrawerPage(initialPriceRange: _filterPriceRange),
    );

    if (result != null && result is Map) {
      setState(() {
        if (result.containsKey('priceRange')) {
          _filterPriceRange = result['priceRange'];
        }
        _updateProcessedProducts();
      });
    }
  }

  void _updateProcessedProducts() {
    List<ProductStore> temp = List.from(_allProducts);

    if (_searchQuery.isNotEmpty) {
      temp = temp.where((product) {
        return product.name.toLowerCase().contains(
              _searchQuery.toLowerCase(),
            ) ||
            product.description.toLowerCase().contains(
              _searchQuery.toLowerCase(),
            );
      }).toList();
    }

    if (_filterPriceRange != null) {
      temp = temp.where((product) {
        double price =
            double.tryParse(product.price.replaceAll(RegExp(r'[^0-9.]'), '')) ??
            0;
        return price >= _filterPriceRange!.start &&
            price <= _filterPriceRange!.end;
      }).toList();
    }

    if (_currentSort == "Price: Low to High") {
      temp.sort((a, b) {
        double priceA =
            double.tryParse(a.price.replaceAll(RegExp(r'[^0-9.]'), '')) ?? 0;
        double priceB =
            double.tryParse(b.price.replaceAll(RegExp(r'[^0-9.]'), '')) ?? 0;
        return priceA.compareTo(priceB);
      });
    } else if (_currentSort == "Price: High to Low") {
      temp.sort((a, b) {
        double priceA =
            double.tryParse(a.price.replaceAll(RegExp(r'[^0-9.]'), '')) ?? 0;
        double priceB =
            double.tryParse(b.price.replaceAll(RegExp(r'[^0-9.]'), '')) ?? 0;
        return priceB.compareTo(priceA);
      });
    }

    _processedProducts = temp;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xFFF9F9F9),
      body: SafeArea(
        child: Column(
          children: [
            const HomeAppBar(),
            _SearchPageHeader(
              searchController: _searchController,
              onSearchChanged: _onSearchChanged,
              onSortTap: _onSortPressed,
              onFilterTap: _onFilterPressed,
              count: _processedProducts.length,
            ),
            Expanded(
              child: _processedProducts.isEmpty
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
                  : WishlistGrid(products: _processedProducts),
            ),
          ],
        ),
      ),
    );
  }
}

class _SearchPageHeader extends StatelessWidget {
  final TextEditingController? searchController;
  final VoidCallback? onSearchChanged;
  final VoidCallback? onSortTap;
  final VoidCallback? onFilterTap;
  final int count;

  const _SearchPageHeader({
    required this.searchController,
    required this.onSearchChanged,
    required this.onSortTap,
    required this.onFilterTap,
    required this.count,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: AppSearchBar(
            controller: searchController,
            onChanged: onSearchChanged,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "$count Items",
                style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
              Row(
                children: [
                  _buildActionButton("Sort", Icons.swap_vert, onSortTap),
                  const SizedBox(width: 8),
                  _buildActionButton(
                    "Filter",
                    Icons.filter_alt_outlined,
                    onFilterTap,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildActionButton(String label, IconData icon, VoidCallback? onTap) {
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
}
