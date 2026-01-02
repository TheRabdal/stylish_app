import 'package:stylish_app/packages/packages.dart';

class WishlistGrid extends StatelessWidget {
  final List<Product> products;

  const WishlistGrid({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: MasonryGridView.count(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        crossAxisCount: 2,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return WishlistProductCard(product: product);
        },
      ),
    );
  }
}
