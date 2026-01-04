import 'package:stylish_app/packages/packages.dart';

class CheckoutPage extends StatefulWidget {
  final List<CartItem>? buyNowItems;

  const CheckoutPage({super.key, this.buyNowItems});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  final ScrollController _scrollController = ScrollController();
  final List<Map<String, String>> _addresses = [
    {'address': "216 St Paul's Rd, London N1 2LL, UK", 'contact': "+44-784232"},
  ];

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _handleEditAddress(int index, String address, String contact) {
    setState(() {
      _addresses[index]['address'] = address;
      _addresses[index]['contact'] = contact;
    });
  }

  void _handleAddAddress(String address, String contact) {
    setState(() {
      _addresses.add({'address': address, 'contact': contact});
    });
  }

  void _handleItemTap() {
    if (widget.buyNowItems != null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const NavigationPage(initialIndex: 2),
        ),
      );
    } else {
      Navigator.pop(context);
    }
  }

  void _handleContinueToPayment() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ShippingScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      appBar: const CheckoutAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DeliveryAddressSection(
              addresses: _addresses,
              onEdit: (index) {
                AddressDialogs.showEditDialog(
                  context,
                  index: index,
                  addresses: _addresses,
                  onSave: _handleEditAddress,
                );
              },
              onAdd: () {
                AddressDialogs.showAddDialog(context, onAdd: _handleAddAddress);
              },
            ),
            const SizedBox(height: 32),
            Expanded(
              child: ShoppingListSection(
                buyNowItems: widget.buyNowItems,
                scrollController: _scrollController,
                onItemTap: _handleItemTap,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CheckoutBottomBar(
        buyNowItems: widget.buyNowItems,
        onContinue: _handleContinueToPayment,
      ),
    );
  }
}
