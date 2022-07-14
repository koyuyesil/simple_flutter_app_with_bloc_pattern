import 'dart:async';

import 'package:etrade/data/cart_service.dart';

import '../models/cart.dart';

class CartBloc {
  final cartStreamController = StreamController.broadcast();
  Stream get getStream => cartStreamController.stream; //okunması kolay olsun
  StreamSink get sinkStream =>
      cartStreamController.sink; // todo ders harici deneme

  // aslında yeni bir değişken.
  void addToCart(Cart item) {
    CartService.addToCart(item);
    sinkStream.add(CartService.getCart());
  }

  void removeFromCart(Cart item) {
    CartService.removeFromCart(item);
    sinkStream.add(CartService.getCart());
  }

  List<Cart> getCart() {
    return CartService.getCart();
  }
}

final cartBloc = CartBloc();
