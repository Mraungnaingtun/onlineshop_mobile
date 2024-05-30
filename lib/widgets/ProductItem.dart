import 'package:flutter/material.dart';
import 'package:onlineshopping/model/Product.dart';

class ProductItem extends StatelessWidget {
  final Product product;

  const ProductItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            product.photoPath,
            height: 120,
            width: double.infinity,
            fit: BoxFit.contain,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Text(
              product.name,
              style: const TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Text(
              "\$${product.price.toStringAsFixed(2)}",
              style: const TextStyle(
                fontSize: 14.0,
                color: Colors.grey,
                ),
            ),
          ),
        ],
      ),
    );
  }
}