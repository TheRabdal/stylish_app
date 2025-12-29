import 'package:stylish_app/packages/packages.dart';
import 'onboarding_page_counter.dart';
import 'onboarding_skip_button.dart';

class OnboardingHeader extends StatelessWidget {
  final int currentPage;
  final int totalPages;
  final VoidCallback onSkip;

  const OnboardingHeader({
    super.key,
    required this.currentPage,
    required this.totalPages,
    required this.onSkip,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          OnboardingPageCounter(
            currentPage: currentPage,
            totalPages: totalPages,
          ),
          OnboardingSkipButton(onSkip: onSkip),
        ],
      ),
    );
  }
}
