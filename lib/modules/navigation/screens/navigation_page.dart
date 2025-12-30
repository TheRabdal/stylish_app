import 'package:stylish_app/packages/packages.dart';
import 'package:stylish_app/modules/homepage/homepage.dart';
import 'package:stylish_app/modules/wishlist/wishlist.dart';
import 'package:stylish_app/modules/cart/cart.dart';
import 'package:stylish_app/modules/search/search.dart';
import 'package:stylish_app/modules/settings/settings.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({super.key});

  static const String route = 'NavigationPage';

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const HomeContent(),
    const WishlistPage(),
    const SizedBox(), // Placeholder for Cart (handled by FAB)
    const SearchPage(),
    const SettingsPage(),
  ];

  void _onItemTapped(int index) {
    if (index == 2) return; // Cart is handled by FAB
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: _selectedIndex == 2 ? const CartPage() : _pages[_selectedIndex],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _selectedIndex = 2; // Index for Cart
          });
        },
        backgroundColor: Colors.white,
        shape: const CircleBorder(),
        child: const Icon(Icons.shopping_cart_outlined, color: Colors.black),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 8.0,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavItem(Icons.home_outlined, "Home", 0),
              _buildNavItem(Icons.favorite_border, "Wishlist", 1),
              const SizedBox(width: 48), // Spacer for FAB
              _buildNavItem(Icons.search, "Search", 3),
              _buildNavItem(Icons.settings_outlined, "Setting", 4),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, int index) {
    final bool isSelected = _selectedIndex == index;
    return InkWell(
      onTap: () => _onItemTapped(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: isSelected ? const Color(0xFFF83758) : Colors.black,
            size: 24,
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: GoogleFonts.montserrat(
              fontSize: 10,
              color: isSelected ? const Color(0xFFF83758) : Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
