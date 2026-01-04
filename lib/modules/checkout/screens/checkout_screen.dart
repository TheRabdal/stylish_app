import 'package:stylish_app/packages/packages.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  // Dummy Data
  final AddressModel _address = AddressModel(
    title: "Address :",
    addressLine: "216 St Paul's Rd, London N1 2LL, UK",
    contactNumber: "+44-784232",
  );

  final List<CheckoutItemModel> _items = [
    CheckoutItemModel(
      image:
          'https://images.unsplash.com/photo-1515886657613-9f3515b0c78f?ixlib=rb-4.0.3&auto=format&fit=crop&w=1000&q=80', // Fashion model
      title: "Women's Casual Wear",
      variations: ["Black", "Red"],
      rating: 4.8,
      price: 34.00,
      originalPrice: 64.00,
      discountPercentage: 33,
      quantity: 1,
    ),
    CheckoutItemModel(
      image:
          'https://images.unsplash.com/photo-1591047139829-d91aecb6caea?ixlib=rb-4.0.3&auto=format&fit=crop&w=1000&q=80', // Men's jacket
      title: "Men's Jacket",
      variations: ["Green", "Grey"],
      rating: 4.7,
      price: 45.00,
      originalPrice: 67.00,
      discountPercentage: 28,
      quantity: 1,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDFDFD), // Very light grey/white
      appBar: AppBar(
        title: const Text(
          "Checkout",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFFFDFDFD),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AddressCard(address: _address),
              const SizedBox(height: 24),
              const Text(
                "Shopping List",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 16),
              ..._items.map((item) => CheckoutItemCard(item: item)),
            ],
          ),
        ),
      ),
    );
  }
}
