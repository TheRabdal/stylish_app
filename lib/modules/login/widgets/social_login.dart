import 'package:stylish_app/packages/packages.dart';

class SocialLogin extends StatelessWidget {
  const SocialLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        SizedBox(height: 30),
        Text("- OR Continue with -"),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SocialButton(icon: Icons.g_mobiledata),
            SizedBox(width: 20),
            SocialButton(icon: Icons.apple),
            SizedBox(width: 20),
            SocialButton(icon: Icons.facebook),
          ],
        ),
      ],
    );
  }
}
