import 'package:stylish_app/packages/packages.dart';

class WishlistPage extends StatefulWidget {
  const WishlistPage({super.key});

  @override
  State<WishlistPage> createState() => _WishlistPageState();
}

class _WishlistPageState extends State<WishlistPage> {
  // Dummy data matching the reference image text exactly
  // Dummy data matching the reference image text exactly
  final List<Product> products = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(
        0xFFF9F9F9,
      ), // Light background like in image
      body: SafeArea(
        child: Column(
          children: [
            const HomeAppBar(),
            const AppSearchBar(),
            const WishlistHeader(),
            WishlistGrid(products: products),
          ],
        ),
      ),
    );
  }
}
