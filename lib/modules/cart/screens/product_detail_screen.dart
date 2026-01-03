import 'package:stylish_app/packages/packages.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({super.key});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  // Dummy Data
  late ProductDetailModel product;
  late List<SimilarProduct> similarProducts;

  @override
  void initState() {
    super.initState();
    product = ProductDetailModel(
      id: '1',
      images: [
        'https://images.unsplash.com/photo-1542291026-7eec264c27ff?ixlib=rb-4.0.3&auto=format&fit=crop&w=1000&q=80',
        'https://images.unsplash.com/photo-1515955656352-a1fa3ffcd111?ixlib=rb-4.0.3&auto=format&fit=crop&w=1000&q=80',
        'https://images.unsplash.com/photo-1552346154-21d32810aba3?ixlib=rb-4.0.3&auto=format&fit=crop&w=1000&q=80',
      ],
      title: 'Nike Sneakers',
      subtitle: "Vision Alta Men's Shoes Size (All Colours)",
      rating: 4.5,
      reviewCount: 56890,
      price: 1500,
      originalPrice: 2999,
      discountPercentage: 50,
      description:
          'Perhaps the most iconic sneaker of all-time, this original "Chicago"? colorway is the cornerstone to any sneaker collection. Made famous in 1985 by Michael Jordan, the shoe has stood the test of time, becoming the most famous colorway of the Air Jordan 1. This 2015 release saw the ...',
      availableSizes: [
        ProductSize(label: '6 UK'),
        ProductSize(label: '7 UK', isSelected: true),
        ProductSize(label: '8 UK'),
        ProductSize(label: '9 UK'),
        ProductSize(label: '10 UK'),
      ],
    );

    similarProducts = [
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
    ];
  }

  void _onSizeSelected(String label) {
    setState(() {
      product.availableSizes.asMap().forEach((index, size) {
        // We need to update the list logic properly, but for this immutable model structure
        // we'll just reconstruct the list for the UI update.
        // Ideally we should use a proper state management solution.
        // For now, I'll just map it.
        var newSizes = product.availableSizes
            .map((s) => s.copyWith(isSelected: s.label == label))
            .toList();
        // Since 'product' fields are final, we can't just mutate 'availableSizes'.
        // I'll create a new product instance or just update a local 'currentSizes' list.
        // Let's just update the product object for simplicity in this demo.
        product = ProductDetailModel(
          id: product.id,
          images: product.images,
          title: product.title,
          subtitle: product.subtitle,
          rating: product.rating,
          reviewCount: product.reviewCount,
          price: product.price,
          originalPrice: product.originalPrice,
          discountPercentage: product.discountPercentage,
          description: product.description,
          availableSizes: newSizes,
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart_outlined, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image Carousel
            ImageCarousel(images: product.images),

            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 16.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Size Selector
                  SizeSelector(
                    sizes: product.availableSizes,
                    onSizeSelected: _onSizeSelected,
                  ),
                  const SizedBox(height: 16),

                  // Product Info
                  ProductInfo(product: product),
                  const SizedBox(height: 16),

                  // Action Buttons (Buttons Row 1)
                  const ActionButtons(),
                  const SizedBox(height: 16),

                  // Main Action Buttons (Cart / Buy Now)
                  const BottomNavActions(),
                  const SizedBox(height: 16),

                  // Delivery Banner
                  const DeliveryBanner(),
                  const SizedBox(height: 16),

                  // View Similar / Compare Buttons
                  const ViewSimilarButton(),
                  const SizedBox(height: 24),

                  // Similar Products
                  SimilarProducts(products: similarProducts),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
