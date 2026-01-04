import 'package:stylish_app/packages/packages.dart';

class CartItemsList extends StatelessWidget {
  const CartItemsList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: CartService(),
      builder: (context, child) {
        if (CartService().items.isEmpty) {
          return const Padding(
            padding: EdgeInsets.all(32.0),
            child: Center(child: Text("Your cart is empty")),
          );
        }
        return Column(
          children: CartService().items.map((item) {
            return Column(
              children: [
                Dismissible(
                  key: ValueKey(item),
                  direction: DismissDirection.endToStart,
                  background: Container(
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.only(right: 20.0),
                    color: Colors.red,
                    child: const Icon(Icons.delete, color: Colors.white),
                  ),
                  onDismissed: (direction) {
                    CartService().removeItem(item);
                    ScaffoldMessenger.of(context).hideCurrentSnackBar();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        duration: const Duration(seconds: 5),
                        content: Text("${item.title} removed from cart"),
                        action: SnackBarAction(
                          label: "Undo",
                          onPressed: () {
                            CartService().addItem(item);
                          },
                        ),
                      ),
                    );
                  },
                  child: CartItemWidget(
                    image: item.image,
                    title: item.title,
                    variations: item.variations,
                    size: item.size,
                    qty: item.qty.toString(),
                    deliveryDate: item.deliveryDate,
                    price: item.price,
                    oldPrice: item.oldPrice,
                    discount: item.discount,
                    onSizeChanged: (newSize) {
                      CartService().updateItem(
                        item,
                        item.copyWith(size: newSize),
                      );
                    },
                    onQtyChanged: (newQty) {
                      if (newQty < 1) {
                        CartService().removeItem(item);
                      } else {
                        CartService().updateItem(
                          item,
                          item.copyWith(qty: newQty),
                        );
                      }
                    },
                  ),
                ),
                const SizedBox(height: 24),
              ],
            );
          }).toList(),
        );
      },
    );
  }
}
