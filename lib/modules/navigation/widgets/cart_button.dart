import 'package:stylish_app/packages/packages.dart';

class CartButton extends StatelessWidget {
  final VoidCallback onPressed;
  final bool isSelected;

  const CartButton({
    super.key,
    required this.onPressed,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: const Offset(0, -15),
      child: FloatingActionButton(
        onPressed: onPressed,
        backgroundColor: isSelected ? const Color(0xFFF83758) : Colors.white,
        shape: const CircleBorder(),
        elevation: 5,
        child: Icon(
          Icons.shopping_cart_outlined,
          color: isSelected ? Colors.white : Colors.black,
        ),
      ),
    );
  }
}
