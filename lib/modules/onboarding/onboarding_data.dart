import 'package:stylish_app/packages/packages.dart';

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
    title: 'Choose Products',
    description: 'Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit.',
  ),
  OnboardingData(
    image: 'assets/onboarding2.png',
    title: 'Make Payment',
    description: 'Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit.',
  ),
  OnboardingData(
    image: 'assets/onboarding3.png',
    title: 'Get Your Order',
    description: 'Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit.',
  ),
];
