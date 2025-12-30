import 'package:stylish_app/packages/packages.dart';
import 'package:stylish_app/core/widgets/dots_indicator.dart';

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
