import 'package:stylish_app/packages/packages.dart';
import '../widgets/widgets.dart';
import '../models/models.dart';

class OnboardingPage extends StatefulWidget {
  static const route = 'OnboardingPage';
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onPageChanged(int page) {
    setState(() => _currentPage = page);
  }

  void _onSkip() {
    Navigator.pushNamed(context, LoginPage.route);
  }

  void _onNext() {
    if (_currentPage == OnboardingModel.items.length - 1) {
      _onSkip();
    } else {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _onPrev() {
    _pageController.previousPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            OnboardingHeader(
              currentPage: _currentPage,
              totalPages: OnboardingModel.items.length,
              onSkip: _onSkip,
            ),
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: OnboardingModel.items.length,
                onPageChanged: _onPageChanged,
                itemBuilder: (context, index) {
                  final item = OnboardingModel.items[index];
                  return OnboardingSlide(
                    image: item.image,
                    title: item.title,
                    description: item.description,
                  );
                },
              ),
            ),
            OnboardingFooter(
              currentPage: _currentPage,
              totalPages: OnboardingModel.items.length,
              onNext: _onNext,
              onPrev: _onPrev,
              controller: _pageController,
            ),
          ],
        ),
      ),
    );
  }
}
