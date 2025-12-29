import 'package:stylish_app/packages/packages.dart';

class GetStartedBackground extends StatelessWidget {
  const GetStartedBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/getstarted.png'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
