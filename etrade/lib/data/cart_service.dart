import 'package:etrade/models/cart.dart';

class CartService {
  CartService._internal();
  static List<Cart> cartItems = <Cart>[];
  static CartService _singleton = CartService._internal();

  factory CartService() => _singleton;

  static void addToCart(Cart item) {
    cartItems.add(item);
  }

  static void removeFromCart(Cart item) {
    cartItems.remove(item);
  }

  static List<Cart> getCart() {
    return cartItems;
  }
}
