import 'package:stylish_app/packages/packages.dart';

class OnboardingNavigationDots extends StatelessWidget {
  final PageController controller;
  final int totalPages;

  const OnboardingNavigationDots({
    super.key,
    required this.controller,
    required this.totalPages,
  });

  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
      controller: controller,
      count: totalPages,
      effect: const ExpandingDotsEffect(
        dotHeight: 8,
        dotWidth: 8,
        activeDotColor: Colors.black,
        dotColor: Colors.grey,
        expansionFactor: 3,
        spacing: 8,
      ),
    );
  }
}
