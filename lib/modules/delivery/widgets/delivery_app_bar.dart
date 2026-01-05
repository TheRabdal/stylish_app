import 'package:stylish_app/packages/packages.dart';

class DeliveryAppBar extends StatelessWidget implements PreferredSizeWidget {
  const DeliveryAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        "Checkout", // Keep title as Checkout or change to Delivery? User said "Rubah nama shipping menjadi checkout". The OLD checkout (address) was titled Checkout. If I change it to Delivery it avoids confusion, but user might want "Checkout" flow. I will keep it as Checkout for now but the class is DeliveryAppBar.
        style: GoogleFonts.montserrat(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
      centerTitle: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
        onPressed: () => Navigator.pop(context),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
