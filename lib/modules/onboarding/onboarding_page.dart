import 'package:stylish_app/packages/packages.dart';

class OnboardingPage extends StatefulWidget {
  static const route = 'OnboardingPage';
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _pageController = PageController(initialPage: 0);
  int currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: onboardingData.length,
                onPageChanged: (int page) {
                  setState(() {
                    currentPage = page;
                  });
                },
                itemBuilder: (context, index) {
                  return OnboardingSlide(
                    image: onboardingData[index].image,
                    title: onboardingData[index].title,
                    description: onboardingData[index].description,
                  );
                },
              ),
            ),
            SmoothPageIndicator(
              controller: _pageController,
              count: onboardingData.length,
              effect: ExpandingDotsEffect(
                dotHeight: 10,
                dotWidth: 15,
                activeDotColor: Colors.black
              ),
            ),
          ],
        ),
      ),
    );
  }
}
