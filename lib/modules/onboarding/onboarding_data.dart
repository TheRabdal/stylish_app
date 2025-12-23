class OnboardingData {
  final String image;
  final String title;
  final String description;

  OnboardingData({
    required this.image,
    required this.title,
    required this.description,
  });
}

List<OnboardingData> onboardingData = [
  OnboardingData(
    image: 'assets/onboarding1.png',
    title: 'Selamat Datang di Stylish App',
    description: 'Temukan produk dan penawaran luar biasa.',
  ),
  OnboardingData(
    image: 'assets/onboarding2.png',
    title: 'Pembayaran Aman',
    description:
        'Berbelanja dengan percaya diri menggunakan gateway pembayaran aman kami.',
  ),
  OnboardingData(
    image: 'assets/onboarding3.png',
    title: 'Pengiriman Cepat',
    description:
        'Dapatkan pesanan Anda diantar ke depan pintu Anda dengan cepat.',
  ),
];
