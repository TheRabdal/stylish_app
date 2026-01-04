import 'package:flutter/foundation.dart';
import 'package:stylish_app/core/models/product_model.dart';

class WishlistService extends ChangeNotifier {
  static final WishlistService _instance = WishlistService._internal();
  factory WishlistService() => _instance;
  WishlistService._internal();

  final List<Product> _items = [];

  List<Product> get items => _items;

  void toggleResult(Product product) {
    if (isWishlisted(product)) {
      _items.removeWhere(
        (item) => item.name == product.name,
      ); // Using name or ID if available
    } else {
      _items.add(product);
    }
    notifyListeners();
  }

  bool isWishlisted(Product product) {
    return _items.any((item) => item.name == product.name);
  }
}
