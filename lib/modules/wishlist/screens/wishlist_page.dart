import 'package:stylish_app/packages/packages.dart';

class WishlistPage extends StatefulWidget {
  const WishlistPage({super.key});

  @override
  State<WishlistPage> createState() => _WishlistPageState();
}

class _WishlistPageState extends State<WishlistPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: Text("Wishlist Page")));
  }
}
