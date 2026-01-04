import 'package:stylish_app/packages/packages.dart';

class HomeProductGrid extends StatelessWidget {
  final String searchQuery;
  final RangeValues? filterPriceRange;
  final String currentSort;

  const HomeProductGrid({
    super.key,
    required this.searchQuery,
    this.filterPriceRange,
    required this.currentSort,
  });

  @override
  Widget build(BuildContext context) {
    List<ProductStore> displayedProducts = List.from(allProducts);

    if (searchQuery.isNotEmpty) {
      displayedProducts = displayedProducts.where((product) {
        return product.name.toLowerCase().contains(searchQuery.toLowerCase());
      }).toList();
    }

    if (filterPriceRange != null) {
      displayedProducts = displayedProducts.where((product) {
        double price =
            double.tryParse(product.price.replaceAll(RegExp(r'[^0-9.]'), '')) ??
            0;
        return price >= filterPriceRange!.start &&
            price <= filterPriceRange!.end;
      }).toList();
    }

    if (currentSort == "Price: Low to High") {
      displayedProducts.sort((a, b) {
        double priceA =
            double.tryParse(a.price.replaceAll(RegExp(r'[^0-9.]'), '')) ?? 0;
        double priceB =
            double.tryParse(b.price.replaceAll(RegExp(r'[^0-9.]'), '')) ?? 0;
        return priceA.compareTo(priceB);
      });
    } else if (currentSort == "Price: High to Low") {
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
