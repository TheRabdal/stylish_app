import 'package:stylish_app/packages/packages.dart';

class OnboardingPage extends StatefulWidget {
  static const route = 'onboarding';
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

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
              child: PageView(
                controller: _pageController,
                onPageChanged: (int page) {
                  setState(() {
                    _currentPage = page;
                  });
                },
                children: const [
                  OnboardingSlide(
                    image: Icons.shopping_cart_outlined,
                    title: 'Selamat Datang di Beliinini_app',
                    description: 'Temukan produk dan penawaran luar biasa.',
                  ),
                  OnboardingSlide(
                    image: Icons.credit_card_outlined,
                    title: 'Pembayaran Aman',
                    description:
                        'Berbelanja dengan percaya diri menggunakan gateway pembayaran aman kami.',
                  ),
                  OnboardingSlide(
                    image: Icons.delivery_dining_outlined,
                    title: 'Pengiriman Cepat',
                    description:
                        'Dapatkan pesanan Anda diantar ke depan pintu Anda dengan cepat.',
                  ),
                ],
              ),
            ),
            OnboardingSkip(
              currentPage: _currentPage,
              pageController: _pageController,
            ),
          ],
        ),
      ),
    );
  }
}
