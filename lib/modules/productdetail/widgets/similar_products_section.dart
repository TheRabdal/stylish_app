import 'package:stylish_app/packages/packages.dart';
// Temporarily import for reuse or we should copy logic?
// Actually, let's reimplement it cleanly or reuse logic but essentially this section displays similar items.
// Given strict instructions to separate, I will reimplement a clean version or reuse the existing one if I can move it.
// The user asked to move it. So I will implement the UI here basically copying the logic but adapting to the new structure if needed.
// However, to save time and ensure consistency, I'll basically port the layout logic.

class SimilarProductsSection extends StatelessWidget {
  const SimilarProductsSection({super.key});

  @override
  Widget build(BuildContext context) {
    // Dummy similar products data for now, or this could be passed in.
    // Mimicking the data from the old file.
    final List<SimilarProduct> similarProducts = [
      SimilarProduct(
        id: '101',
        image:
            'https://images.unsplash.com/photo-1597045566677-8cf032ed6634?ixlib=rb-4.0.3&auto=format&fit=crop&w=500&q=60',
        title: 'Nike Sneakers',
        subtitle: 'Nike Air Jordan Retro 1 Low Mystic Black',
        price: 1900,
        rating: 4.5,
        reviewCount: 46890,
      ),
      SimilarProduct(
        id: '102',
        image:
            'https://images.unsplash.com/photo-1560769629-975ec94e6a86?ixlib=rb-4.0.3&auto=format&fit=crop&w=500&q=60',
        title: 'Nike Sneakers',
        subtitle: 'Mid Peach Mocha Shoes For Man White Black Pink S...',
        price: 1900,
        rating: 4.8,
        reviewCount: 256890,
      ),
      SimilarProduct(
        id: '103',
        image:
            'https://images.unsplash.com/photo-1542291026-7eec264c27ff?ixlib=rb-4.0.3&auto=format&fit=crop&w=500&q=60',
        title: 'Nike Red',
        subtitle: 'Nike Air Max Red Passion',
        price: 2100,
        rating: 4.2,
        reviewCount: 1200,
      ),
      SimilarProduct(
        id: '104',
        image:
            'https://images.unsplash.com/photo-1549298916-b41d501d3772?ixlib=rb-4.0.3&auto=format&fit=crop&w=500&q=60',
        title: 'Nike Black',
        subtitle: 'Nike Running Shoes Black Edition',
        price: 2500,
        rating: 4.9,
        reviewCount: 5000,
      ),
      SimilarProduct(
        id: '105',
        image: 'assets/images/whiteshoes.png',
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
