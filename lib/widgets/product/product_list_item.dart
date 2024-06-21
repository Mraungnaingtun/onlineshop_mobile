import 'package:flutter/material.dart';
import 'package:onlineshopping/model/product.dart';

class ProductListItem extends StatelessWidget {
  final Product product;

  const ProductListItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(product.name),
      subtitle: Text(product.price.toString()),
    );
  }
}
