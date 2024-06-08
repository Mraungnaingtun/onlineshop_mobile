import 'package:flutter/material.dart';
import 'package:onlineshopping/model/Product.dart';

class ProductDetailsPage extends StatelessWidget {
  final Product product;
  final String path = "assets/images/sneaker.png";

  const ProductDetailsPage({super.key, required this.product});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(path),
            const SizedBox(height: 16),
            Text(
              product.name,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(product.name),
            const SizedBox(height: 16),
            Text('Price: \$${product.price}', style: const TextStyle(fontSize: 20)),
          ],
        ),
      ),
    );
  }
}
