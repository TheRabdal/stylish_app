import 'package:stylish_app/packages/packages.dart';

class OnboardingNextButton extends StatelessWidget {
  final VoidCallback onNext;
  final bool isLastPage;

  const OnboardingNextButton({
    super.key,
    required this.onNext,
    required this.isLastPage,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onNext,
      child: Text(
        isLastPage ? 'Get Started' : 'Next',
        style: const TextStyle(
          color: Color(0xFFF83758),
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
