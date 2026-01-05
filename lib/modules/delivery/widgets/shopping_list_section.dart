import 'package:stylish_app/packages/packages.dart';

class ShoppingListSection extends StatelessWidget {
  final List<CartItem>? buyNowItems;
  final ScrollController scrollController;
  final VoidCallback onItemTap;

  const ShoppingListSection({
    super.key,
    this.buyNowItems,
    required this.scrollController,
    required this.onItemTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Shopping List",
          style: GoogleFonts.montserrat(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        Expanded(
          child: Scrollbar(
            controller: scrollController,
            child: ListenableBuilder(
              listenable: CartService(),
              builder: (context, child) {
                final items = buyNowItems ?? CartService().items;
                if (items.isEmpty) {
                  return const Text("No items in checkout");
                }
                return ListView(
                  controller: scrollController,
                  children: items.map((item) {
                    return Column(
                      children: [
                        DeliveryItemCard(
                          // Renamed from CheckoutItemCard
                          item: DeliveryItemModel(
                            // Renamed from CheckoutItemModel
                            image: item.image,
                            title: item.title,
                            variations: [item.variations],
                            rating: 4.8,
                            price: item.price,
                            originalPrice: item.oldPrice,
                            discountPercentage:
                                int.tryParse(
                                  RegExp(
                                        r'\d+',
                                      ).firstMatch(item.discount)?.group(0) ??
                                      '0',
                                ) ??
                                0,
                            quantity: item.qty,
                          ),
                          onTap: onItemTap,
                        ),
                        const SizedBox(height: 16),
                      ],
                    );
                  }).toList(),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
