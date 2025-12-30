import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ImageCarousel extends StatefulWidget {
  final List<String> images;

  const ImageCarousel({super.key, required this.images});

  @override
  State<ImageCarousel> createState() => _ImageCarouselState();
}

class _ImageCarouselState extends State<ImageCarousel> {
  final PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        SizedBox(
          height: 300,
          width: double.infinity,
          child: PageView.builder(
            controller: _controller,
            itemCount: widget.images.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.network(
                    widget.images[index],
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: Colors.grey[300],
                        child: const Icon(
                          Icons.image,
                          size: 50,
                          color: Colors.grey,
                        ),
                      );
                    },
                  ),
                ),
              );
            },
          ),
        ),

        // Circular button on the right (like in the design)
        Positioned(
          right: 30,
          top: 130, // Approximate middle
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey.withOpacity(0.4),
            ),
            child: IconButton(
              icon: const Icon(Icons.chevron_right, color: Colors.white),
              onPressed: () {
                if (_controller.page != widget.images.length - 1) {
                  _controller.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeIn,
                  );
                }
              },
            ),
          ),
        ),

        Positioned(
          bottom: 10,
          child: SmoothPageIndicator(
            controller: _controller,
            count: widget.images.length,
            effect: const WormEffect(
              activeDotColor: Colors.pinkAccent,
              dotColor: Colors.grey,
              dotHeight: 8,
              dotWidth: 8,
            ),
          ),
        ),
      ],
    );
  }
}
