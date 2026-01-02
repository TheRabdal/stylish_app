import 'package:stylish_app/packages/packages.dart';

class ProductDetailPage extends StatelessWidget {
  final Product product;

  const ProductDetailPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      appBar: const ProductDetailAppBar(), // AppBar
      // Bottom bar buttons moved to ProductDetailInfo
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProductDetailImage(imageUrl: product.image),
            ProductDetailInfo(product: product),
            // SizeSelector is now inside ProductDetailInfo
            const SizedBox(height: 8),
            const SimilarProductsSection(),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
