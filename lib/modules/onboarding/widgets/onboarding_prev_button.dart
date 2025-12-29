import 'package:stylish_app/packages/packages.dart';

class OnboardingPrevButton extends StatelessWidget {
  final VoidCallback onPrev;

  const OnboardingPrevButton({super.key, required this.onPrev});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPrev,
      child: const Text(
        'Prev',
        style: TextStyle(
          color: Colors.grey,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
