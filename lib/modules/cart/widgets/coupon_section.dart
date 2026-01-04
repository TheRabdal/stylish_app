import 'package:stylish_app/packages/packages.dart';

class CouponSection extends StatelessWidget {
  const CouponSection({super.key});

  void _showCouponDialog(BuildContext context) {
    if (CartService().items.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Keranjang belanja Anda kosong. Silakan tambahkan produk terlebih dahulu.',
            style: GoogleFonts.montserrat(),
          ),
          backgroundColor: const Color(0xFFF83758),
          behavior: SnackBarBehavior.floating,
          duration: const Duration(seconds: 3),
        ),
      );
      return;
    }

    showDialog(
      context: context,
      builder: (context) => SimpleDialog(
        title: Text(
          "Select Coupon",
          style: GoogleFonts.montserrat(fontWeight: FontWeight.bold),
        ),
        children: [
          ...[0.1, 0.3, 0.5].map(
            (d) => SimpleDialogOption(
              onPressed: () {
                CartService().applyDiscount(d);
                Navigator.pop(context);
              },
              child: Text(
                "${(d * 100).toInt()}% Off",
                style: GoogleFonts.montserrat(fontSize: 14),
              ),
            ),
          ),
          SimpleDialogOption(
            onPressed: () {
              CartService().applyDiscount(0.0);
              Navigator.pop(context);
            },
            child: Text(
              "Remove Coupon",
              style: GoogleFonts.montserrat(fontSize: 14, color: Colors.red),
            ),
          ),
        ].toList(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          const Icon(Icons.confirmation_number_outlined),
          const SizedBox(width: 12),
          ListenableBuilder(
            listenable: CartService(),
            builder: (context, child) {
              final discount = CartService().discountPercentage;
              return Text(
                discount > 0
                    ? "${(discount * 100).toInt()}% Off Applied"
                    : "Apply Coupons",
                style: GoogleFonts.montserrat(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: discount > 0 ? const Color(0xFFF83758) : Colors.black,
                ),
              );
            },
          ),
          const Spacer(),
          InkWell(
            onTap: () => _showCouponDialog(context),
            child: Text(
              "Select",
              style: GoogleFonts.montserrat(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: const Color(0xFFF83758),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
