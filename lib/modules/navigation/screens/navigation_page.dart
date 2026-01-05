import 'package:stylish_app/packages/packages.dart';

class NavigationPage extends StatefulWidget {
  final int initialIndex;

  const NavigationPage({super.key, this.initialIndex = 0});

  static const String route = 'NavigationPage';

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  late int _selectedIndex;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialIndex;
  }

  List<Widget> get _pages => [
    const HomeContent(),
    const WishlistPage(),
    const CartPage(showBackButton: false),
    const SearchPage(),
    const SettingsPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        if (didPop) return;
        SystemNavigator.pop();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: SafeArea(child: _pages[_selectedIndex]),
        bottomNavigationBar: BottomNav(
          selectedIndex: _selectedIndex,
          onItemTapped: _onItemTapped,
        ),
      ),
    );
  }
}
