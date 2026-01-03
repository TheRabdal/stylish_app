import 'package:stylish_app/packages/packages.dart';

class ProductDetailPage extends StatelessWidget {
  final Product product;

  const ProductDetailPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      appBar: const ProductDetailAppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProductDetailImage(imageUrl: product.image),
            ProductDetailInfo(product: product),
            const SizedBox(height: 8),
            const SimilarProductsSection(),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
