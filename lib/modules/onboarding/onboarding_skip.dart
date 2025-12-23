import 'package:stylish_app/packages/packages.dart';

class OnboardingSkip extends StatelessWidget {
  final int currentPage;
  final PageController pageController;

  const OnboardingSkip({
    super.key,
    required this.currentPage,
    required this.pageController,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (currentPage != 2)
            GestureDetector(
              onTap: () {
                Navigator.pushReplacementNamed(context, LoginPage.route);
              },
              child: const Text(
                'Skip',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          if (currentPage == 2) const SizedBox(),
          GestureDetector(
            onTap: () {
              if (currentPage != 2) {
                pageController.nextPage(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.ease,
                );
              } else {
                Navigator.pushReplacementNamed(context, LoginPage.route);
              }
            },
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 10,
              ),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                currentPage != 2 ? 'Next' : 'Get Started',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
