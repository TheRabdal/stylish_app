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
    return DotsIndicator(controller: controller, count: totalPages);
  }
}
