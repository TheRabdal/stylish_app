import 'package:stylish_app/packages/packages.dart';

class SocialButton extends StatelessWidget {
  final Widget icon;
  final VoidCallback? onTap;

  const SocialButton({super.key, required this.icon, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: const Color(0xFFFCF3F6), // Very light pinkish background
          border: Border.all(
            width: 1,
            color: const Color(0xFFF83758), // Pink border
          ),
        ),
        child: Center(child: icon),
      ),
    );
  }
}
