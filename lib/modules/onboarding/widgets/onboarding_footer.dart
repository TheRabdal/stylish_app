import 'package:stylish_app/packages/packages.dart';

class OnboardingFooter extends StatelessWidget {
  final int currentPage;
  final int totalPages;
  final VoidCallback onNext;
  final VoidCallback onPrev;
  final PageController controller;

  const OnboardingFooter({
    super.key,
    required this.currentPage,
    required this.totalPages,
    required this.onNext,
    required this.onPrev,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SizedBox(
        height: 50,
        child: Stack(
          alignment: Alignment.center,
          children: [
            if (currentPage > 0)
              Align(
                alignment: Alignment.centerLeft,
                child: OnboardingPrevButton(onPrev: onPrev),
              ),
            OnboardingNavigationDots(
              controller: controller,
              totalPages: totalPages,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: OnboardingNextButton(
                onNext: onNext,
                isLastPage: currentPage == totalPages - 1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
