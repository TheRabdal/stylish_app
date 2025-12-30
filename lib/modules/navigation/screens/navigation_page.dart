import 'package:stylish_app/packages/packages.dart';

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
      floatingActionButton: CartButton(
        isSelected: _selectedIndex == 2,
        onPressed: () {
          setState(() {
            _selectedIndex = 2; // Index for Cart
          });
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNav(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
