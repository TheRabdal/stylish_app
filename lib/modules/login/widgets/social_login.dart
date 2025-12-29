import 'package:stylish_app/packages/packages.dart';

class SocialLogin extends StatelessWidget {
  const SocialLogin({super.key});

  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 75),
        const Text(
          "- OR Continue with -",
          style: TextStyle(
            color: Colors.black54,
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SocialButton(
              onTap: () => _launchUrl('https://google.com'),
              icon: Image.asset('assets/Google.png', width: 32, height: 32),
            ),
            const SizedBox(width: 15),
            SocialButton(
              onTap: () => _launchUrl('https://apple.com'),
              icon: Image.asset('assets/Apple.png', width: 34, height: 34),
            ),
            const SizedBox(width: 15),
            SocialButton(
              onTap: () => _launchUrl('https://facebook.com'),
              icon: Image.asset('assets/Facebook.png', width: 34, height: 34),
            ),
          ],
        ),
      ],
    );
  }
}
