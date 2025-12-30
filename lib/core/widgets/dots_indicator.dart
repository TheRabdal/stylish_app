import 'package:stylish_app/packages/packages.dart';

class DotsIndicator extends StatelessWidget {
  final PageController controller;
  final int count;
  final Color? activeDotColor;
  final Color? dotColor;
  final double? dotHeight;
  final double? dotWidth;
  final double? spacing;
  final double? expansionFactor;

  const DotsIndicator({
    super.key,
    required this.controller,
    required this.count,
    this.activeDotColor,
    this.dotColor,
    this.dotHeight,
    this.dotWidth,
    this.spacing,
    this.expansionFactor,
  });

  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
      controller: controller,
      count: count,
      effect: ExpandingDotsEffect(
        dotHeight: dotHeight ?? 8,
        dotWidth: dotWidth ?? 12,
        activeDotColor: activeDotColor ?? Colors.black,
        dotColor: dotColor ?? Colors.grey,
        expansionFactor: expansionFactor ?? 3,
        spacing: spacing ?? 8,
      ),
    );
  }
}
