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

  @override
  Widget build(BuildContext context) {
    bool isFiltered = _filterPriceRange != null;
    bool showProductList = _searchQuery.isNotEmpty || _isSorted || isFiltered;

    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: HomeHeaderSection(
            searchController: _searchController,
            onSortPressed: _onSortPressed,
            onFilterPressed: _onFilterPressed,
          ),
        ),
        if (showProductList)
          HomeProductGrid(
            searchQuery: _searchQuery,
            filterPriceRange: _filterPriceRange,
            currentSort: _currentSort,
          )
        else
          SliverToBoxAdapter(child: _buildHomeContentColumn()),
      ],
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
}
