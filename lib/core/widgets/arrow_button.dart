import 'package:stylish_app/packages/packages.dart';

class ArrowButton extends StatelessWidget {
  final VoidCallback onTap;

  const ArrowButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 32,
        height: 32,
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: const Center(
          child: Icon(Icons.arrow_forward_ios, size: 14, color: Colors.black),
        ),
      ),
    );
  }
}
