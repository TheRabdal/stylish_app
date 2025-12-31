import 'package:stylish_app/packages/packages.dart';

class OnboardingSlide extends StatelessWidget {
  final String image;
  final String title;
  final String description;

  const OnboardingSlide({
    super.key,
    required this.image,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Image.asset(
            image,
            width: 300,
            height: 300,
            fit: BoxFit.contain,
          ),
        ),
        const SizedBox(height: 15),
        Text(
          title,
          style: GoogleFonts.montserrat(
            fontSize: 24,
            fontWeight: FontWeight.w900,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Text(
            description,
            textAlign: TextAlign.center,
            style: GoogleFonts.montserrat(
              fontSize: 14,
              color: const Color(0xFFA8A8A9),
              height: 1.5,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
