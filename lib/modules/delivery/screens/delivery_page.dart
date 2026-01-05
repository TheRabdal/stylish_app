import 'package:stylish_app/packages/packages.dart';

class DeliveryPage extends StatefulWidget {
  final List<CartItem>? buyNowItems;

  const DeliveryPage({super.key, this.buyNowItems});

  @override
  State<DeliveryPage> createState() => _DeliveryPageState();
}

class _DeliveryPageState extends State<DeliveryPage> {
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
    // Calculate Price before navigating
    final items = widget.buyNowItems ?? CartService().items;
    final double subtotal = CartService().calculateTotal(items);
    final double discountPct = widget.buyNowItems != null
        ? 0.0
        : CartService().discountPercentage;
    final double discountAmount = subtotal * discountPct;
    final double shoppingLimit = 1000.0;
    final double shippingFee = subtotal > shoppingLimit ? 0.0 : 50.0;
    final double total = subtotal - discountAmount + shippingFee;

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CheckoutPage(
          orderTotal: subtotal,
          shippingFee: shippingFee,
          discountAmount: discountAmount,
          finalTotal: total,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      appBar: const DeliveryAppBar(),
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
      bottomNavigationBar: DeliveryBottomBar(
        buyNowItems: widget.buyNowItems,
        onContinue: _handleContinueToPayment,
      ),
    );
  }
}
