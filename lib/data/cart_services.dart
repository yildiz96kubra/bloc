import 'package:bloc/models/cart.dart';

class CartServices {
  static List<Cart> cartItems = <Cart>[];
  static final CartServices _singleton = CartServices._internal();

  factory CartServices() {
    return _singleton;
  }

  CartServices._internal();

  static void addCart(Cart item) {
    cartItems.add(item);
  }

  static void removeFromCart(Cart item) {
    cartItems.remove(item);
  }

  static List<Cart> getCart() {
    return cartItems;
  }
}
