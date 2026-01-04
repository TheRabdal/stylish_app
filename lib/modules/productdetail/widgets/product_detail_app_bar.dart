import 'package:flutter/material.dart';

class ProductDetailAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const ProductDetailAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const SizedBox.shrink(),
      centerTitle: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
        onPressed: () => Navigator.pop(context),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.shopping_cart_outlined, color: Colors.black),
          onPressed: () {},
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
