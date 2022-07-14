import 'package:etrade/blocs/cart_bloc.dart';
import 'package:etrade/blocs/product_bloc.dart';
import 'package:flutter/material.dart';

import '../models/cart.dart';

class ProductListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Alışveriş"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.shopping_basket),
            onPressed: () => Navigator.pushNamed(context, "/cart"),
          )
        ],
      ),
      body: buildProductList(),
    );
  }

  buildProductList() {
    return StreamBuilder(
        stream: productBloc.getStream,
        initialData: productBloc.getAll(),
        builder: (context, snapshot) {
          return snapshot.hasData
              ? buildProductListItems(snapshot)
              : Center(
                  child: Text("Gösterecek veri yok."),
                );
        });
  }

  buildProductListItems(AsyncSnapshot snapshot) {
    return ListView.builder(
        itemCount: snapshot.data.length,
        itemBuilder: (BuildContext context, index) {
          final list = snapshot.data;
          return ListTile(
            title: Text(list[index].name),
            subtitle: Text(list[index].price.toString()),
            trailing: IconButton(
                icon: Icon(Icons.add_shopping_cart),
                onPressed: () => cartBloc.addToCart(Cart(list[index], 1))),
          );
        });
  }
}
