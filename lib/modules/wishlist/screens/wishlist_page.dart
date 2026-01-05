import 'package:stylish_app/packages/packages.dart';

class WishlistPage extends StatefulWidget {
  const WishlistPage({super.key});

  @override
  State<WishlistPage> createState() => _WishlistPageState();
}

class _WishlistPageState extends State<WishlistPage> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = "";
  String _currentSort = "Relevance";
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
      });
    }
  }

  List<ProductStore> _getProcessedItems(List<ProductStore> items) {
    List<ProductStore> processed = List.from(items);

    if (_searchQuery.isNotEmpty) {
      processed = processed.where((product) {
        return product.name.toLowerCase().contains(_searchQuery.toLowerCase());
      }).toList();
    }

    if (_filterPriceRange != null) {
      processed = processed.where((product) {
        double price =
            double.tryParse(product.price.replaceAll(RegExp(r'[^0-9.]'), '')) ??
            0;
        return price >= _filterPriceRange!.start &&
            price <= _filterPriceRange!.end;
      }).toList();
    }

    if (_currentSort == "Price: Low to High") {
      processed.sort((a, b) {
        double priceA =
            double.tryParse(a.price.replaceAll(RegExp(r'[^0-9.]'), '')) ?? 0;
        double priceB =
            double.tryParse(b.price.replaceAll(RegExp(r'[^0-9.]'), '')) ?? 0;
        return priceA.compareTo(priceB);
      });
    } else if (_currentSort == "Price: High to Low") {
      processed.sort((a, b) {
        double priceA =
            double.tryParse(a.price.replaceAll(RegExp(r'[^0-9.]'), '')) ?? 0;
        double priceB =
            double.tryParse(b.price.replaceAll(RegExp(r'[^0-9.]'), '')) ?? 0;
        return priceB.compareTo(priceA);
      });
    }

    return processed;
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
            WishlistHeader(
              searchController: _searchController,
              onSearchChanged: _onSearchChanged,
              onSortTap: _onSortPressed,
              onFilterTap: _onFilterPressed,
            ),
            Expanded(
              child: ListenableBuilder(
                listenable: WishlistService(),
                builder: (context, child) {
                  final wishlistItems = WishlistService().items;
                  if (wishlistItems.isEmpty) {
                    return Center(
                      child: Text(
                        "No items in Wishlist",
                        style: GoogleFonts.montserrat(),
                      ),
                    );
                  }

                  final displayedItems = _getProcessedItems(wishlistItems);

                  if (displayedItems.isEmpty) {
                    return Center(
                      child: Text(
                        "No items match your filter",
                        style: GoogleFonts.montserrat(),
                      ),
                    );
                  }

                  return WishlistGrid(products: displayedItems);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
