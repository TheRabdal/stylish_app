import 'package:stylish_app/packages/packages.dart';

class HomeContent extends StatefulWidget {
  const HomeContent({super.key});

  @override
  State<HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = "";

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

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const HomeAppBar(),
        HomeSearchBar(
          controller: _searchController,
          onChanged: _onSearchChanged,
        ),
        const SizedBox(height: 16),
        Expanded(
          child: _searchQuery.isEmpty
              ? _buildHomeContent()
              : _buildSearchResults(),
        ),
      ],
    );
  }

  Widget _buildHomeContent() {
    return const SingleChildScrollView(
      child: Column(
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
      ),
    );
  }

  Widget _buildSearchResults() {
    final filteredProducts = allProducts.where((product) {
      return product.name.toLowerCase().contains(_searchQuery.toLowerCase());
    }).toList();

    if (filteredProducts.isEmpty) {
      return Center(
        child: Text(
          "No products found",
          style: GoogleFonts.montserrat(color: Colors.grey, fontSize: 16),
        ),
      );
    }

    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.7,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      itemCount: filteredProducts.length,
      itemBuilder: (context, index) {
        return ProductCard(product: filteredProducts[index]);
      },
    );
  }
}
