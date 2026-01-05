import 'package:stylish_app/packages/packages.dart';

class ProductDetailImage extends StatefulWidget {
  final String imageUrl;

  const ProductDetailImage({super.key, required this.imageUrl});

  @override
  State<ProductDetailImage> createState() => _ProductDetailImageState();
}

class _ProductDetailImageState extends State<ProductDetailImage> {
  final PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    final List<String> images = [
      widget.imageUrl,
      widget.imageUrl,
      widget.imageUrl,
      widget.imageUrl,
      widget.imageUrl,
    ];

    return Container(
      height: 290,
      width: double.infinity,
      margin: const EdgeInsets.only(top: 16, left: 16, right: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Stack(
        children: [
          // Carousel
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: PageView.builder(
              controller: _controller,
              itemCount: images.length,
              itemBuilder: (context, index) {
                final img = images[index];
                return Image.asset(img, fit: BoxFit.cover);
              },
            ),
          ),

          // Navigation Arrow (Right Center)
          Positioned(
            right: 16,
            top: 0,
            bottom: 0,
            child: Center(
              child: CircleAvatar(
                radius: 20,
                backgroundColor: Colors.grey.withValues(alpha: 0.4),
                child: IconButton(
                  icon: const Icon(Icons.chevron_right, color: Colors.white),
                  onPressed: () {
                    _controller.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  },
                ),
              ),
            ),
          ),

          // Page Indicator (Bottom Center)
          Positioned(
            bottom: 16,
            left: 0,
            right: 0,
            child: Center(
              child: SmoothPageIndicator(
                controller: _controller,
                count: images.length,
                effect: const ScrollingDotsEffect(
                  activeDotColor: Color(0xFFFA7189),
                  dotColor: Color(0xFFE0E0E0),
                  dotHeight: 8,
                  dotWidth: 8,
                  activeDotScale: 1.2,
                  spacing: 8,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
