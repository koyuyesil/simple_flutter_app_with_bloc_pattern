import 'dart:async';

import '../data/product_service.dart';
import '../models/product.dart';

class ProductBloc {
  final productStreamController = StreamController.broadcast();
  Stream get getStream => productStreamController.stream; //okunması kolay olsun
  StreamSink get sinkStream =>
      productStreamController.sink; // todo ders harici deneme

  List<Product> getAll() {
    return ProductService.getAll();
  }
}

final productBloc = ProductBloc();
