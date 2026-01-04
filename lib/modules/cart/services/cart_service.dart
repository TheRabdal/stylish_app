import 'package:stylish_app/packages/packages.dart';

class CartService extends ChangeNotifier {
  static final CartService _instance = CartService._internal();
  factory CartService() => _instance;
  CartService._internal();

  final List<CartItem> _items = [];

  List<CartItem> get items => _items;

  void addItem(CartItem item) {
    try {
      final existingItemIndex = _items.indexWhere(
        (i) =>
            i.title == item.title &&
            i.size == item.size &&
            i.variations == item.variations,
      );

      if (existingItemIndex != -1) {
        final existingItem = _items[existingItemIndex];
        _items[existingItemIndex] = existingItem.copyWith(
          qty: existingItem.qty + item.qty,
        );
      } else {
        _items.add(item);
      }
      notifyListeners();
    } catch (e) {
      if (kDebugMode) {
        print("Error adding item to cart: $e");
      }
    }
  }

  void removeItem(CartItem item) {
    _items.remove(item);
    notifyListeners();
  }

  void updateItem(CartItem oldItem, CartItem newItem) {
    final index = _items.indexOf(oldItem);
    if (index != -1) {
      _items[index] = newItem;
      notifyListeners();
    }
  }

  double calculateTotal(List<CartItem> itemsList) {
    return itemsList.fold(0, (sum, item) => sum + (item.price * item.qty));
  }

  double get totalAmount {
    return calculateTotal(_items);
  }
}
