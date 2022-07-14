import 'package:etrade/models/product.dart';

class ProductService {
  ProductService._internal();
  static List<Product> products = <Product>[];
  static ProductService _singleton = ProductService._internal();

  factory ProductService() => _singleton;

  static List<Product> getAll() {
    products.add(new Product(1, "ASUS LAPTOP", 500));
    products.add(new Product(2, "ACER LAPTOP", 500));
    products.add(new Product(3, "MSI LAPTOP", 500));
    products.add(new Product(4, "ALIENWARE LAPTOP", 500));
    products.add(new Product(5, "HP LAPTOP", 500));
    products.add(new Product(6, "DELL LAPTOP", 500));
    return products;
  }
}
