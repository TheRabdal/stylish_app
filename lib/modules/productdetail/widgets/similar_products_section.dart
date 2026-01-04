import 'package:stylish_app/packages/packages.dart';

class SimilarProductsSection extends StatelessWidget {
  const SimilarProductsSection({super.key});

  @override
  Widget build(BuildContext context) {
    // Dummy similar products data for now, or this could be passed in.
    // Mimicking the data from the old file.
    final List<SimilarProduct> similarProducts = [
      SimilarProduct(
        id: '101',
        image: 'assets/images/jordan.png',
        title: 'Nike Sneakers',
        subtitle: 'Nike Air Jordan Retro 1 Low Mystic Black',
        price: 1900,
        rating: 4.5,
        reviewCount: 46890,
      ),
      SimilarProduct(
        id: '102',
        image: 'assets/images/whiteshoes.png',
        title: 'Nike Sneakers',
        subtitle: 'Mid Peach Mocha Shoes For Man White Black Pink S...',
        price: 1900,
        rating: 4.8,
        reviewCount: 256890,
      ),
      SimilarProduct(
        id: '103',
        image: 'assets/images/jordanstay.png',
        title: 'Nike Red',
        subtitle: 'Nike Air Max Red Passion',
        price: 2100,
        rating: 4.2,
        reviewCount: 1200,
      ),
      SimilarProduct(
        id: '104',
        image: 'assets/images/sepatufantopel.png',
        title: 'Nike Black',
        subtitle: 'Nike Running Shoes Black Edition',
        price: 2500,
        rating: 4.9,
        reviewCount: 5000,
      ),
      SimilarProduct(
        id: '105',
        image: 'assets/images/sandalcoklat.png',
        title: 'Vans Old Skool',
        subtitle: 'Classic Vans Old Skool Sneakers',
        price: 1500,
        rating: 4.6,
        reviewCount: 3400,
      ),
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: SimilarProducts(products: similarProducts),
    );
  }
}
