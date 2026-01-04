import 'package:stylish_app/packages/packages.dart';

class SimilarProducts extends StatelessWidget {
  final List<SimilarProduct> products;

  const SimilarProducts({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Similar To",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  "282+ Items",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Row(
              children: [
                OutlinedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.sort, size: 16, color: Colors.black),
                  label: const Text(
                    "Sort",
                    style: TextStyle(color: Colors.black),
                  ),
                  style: OutlinedButton.styleFrom(
                    minimumSize: const Size(0, 32),
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                  ),
                ),
                const SizedBox(width: 8),
                OutlinedButton.icon(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.filter_list,
                    size: 16,
                    color: Colors.black,
                  ),
                  label: const Text(
                    "Filter",
                    style: TextStyle(color: Colors.black),
                  ),
                  style: OutlinedButton.styleFrom(
                    minimumSize: const Size(0, 32),
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                  ),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 16),
        // Displaying 2 items side-by-side as in the screenshot
        SizedBox(
          height: 280,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: products.length,
            itemBuilder: (context, index) {
              final product = products[index];
              return Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: SizedBox(
                  width: 170, // Fixed width for horizontal scrolling items
                  child: _buildProductCard(context, product),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildProductCard(BuildContext context, SimilarProduct product) {
    return GestureDetector(
      onTap: () {
        // Map SimilarProduct to Product
        final convertedProduct = ProductStore(
          image: product.image,
          name: product.title,
          description: product.subtitle,
          price: "₹${product.price.toStringAsFixed(0)}",
          oldPrice: "", // Not available in SimilarProduct
          discount: "", // Not available in SimilarProduct
          rating: product.rating
              .round(), // Assuming int in Product, double in SimilarProduct
          reviewCount: product.reviewCount,
        );

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailPage(product: convertedProduct),
          ),
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  product.image,
                  height: 150,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      height: 150,
                      color: Colors.grey[200],
                      child: const Icon(Icons.broken_image, color: Colors.grey),
                    );
                  },
                ),
              ),
              Positioned(
                top: 4,
                right: 4,
                child: ListenableBuilder(
                  listenable: WishlistService(),
                  builder: (context, child) {
                    // Map SimilarProduct to Product for checking wishlist status
                    final convertedProduct = ProductStore(
                      image: product.image,
                      name: product.title,
                      description: product.subtitle,
                      price: "₹${product.price.toStringAsFixed(0)}",
                      oldPrice: "",
                      discount: "",
                      rating: product.rating.round(),
                      reviewCount: product.reviewCount,
                    );
                    final isLiked = WishlistService().isWishlisted(
                      convertedProduct,
                    );
                    return GestureDetector(
                      onTap: () {
                        WishlistService().toggleResult(convertedProduct);
                      },
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.7),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          isLiked ? Icons.favorite : Icons.favorite_border,
                          color: isLiked ? Colors.red : Colors.grey,
                          size: 16,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            product.title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            product.subtitle,
            style: const TextStyle(color: Colors.grey, fontSize: 12),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 4),
          Text(
            "₹${product.price.toStringAsFixed(0).replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},')}",
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              ...List.generate(5, (index) {
                if (index < product.rating.floor()) {
                  return const Icon(Icons.star, color: Colors.amber, size: 12);
                } else {
                  return const Icon(
                    Icons.star_border,
                    color: Colors.grey,
                    size: 12,
                  );
                }
              }),
              const SizedBox(width: 4),
              Text(
                "${product.reviewCount}",
                style: const TextStyle(color: Colors.grey, fontSize: 10),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
