import 'package:flutter/material.dart';
import 'package:mix/mix.dart';
import 'package:onlineshopping/model/Product.dart';
import 'package:onlineshopping/provider/ProductProvider.dart';
import 'package:onlineshopping/utils/ColorToken.dart';
import 'package:provider/provider.dart';
import '../../screens/product_details.dart';

class ProductList extends StatelessWidget {
  const ProductList({super.key});

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);

    // Only set products if the list is empty to avoid resetting on every build
    if (productProvider.products.isEmpty) {
      productProvider.setProducts([
        Product(
          id: 1,
          name: 'Product 1',
          description: 'This is a great product.',
          price: 19.99,
          imageUrl: 'assets/images/b1.png',
          color: const Color(0xFFed4d6e),
        ),
        Product(
          id: 2,
          name: 'Product 2',
          description: 'This is a great product.',
          price: 20.99,
          imageUrl: 'assets/images/b2.png',
          color: const Color(0xFF26678f),
        ),
        Product(
          id: 3,
          name: 'Product 3',
          description: 'This is a great product.',
          price: 20.99,
          imageUrl: 'assets/images/b3.png',
          color: const Color(0xFF984d54),
        ),
        Product(
          id: 4,
          name: 'Product 4',
          description: 'This is a great product.',
          price: 20.99,
          imageUrl: 'assets/images/b4.png',
          color: const Color(0xFFd987ad),
        ),
         Product(
          id: 5,
          name: 'Product 5',
          description: 'This is a great product.',
          price: 20.99,
          imageUrl: 'assets/images/b5.png',
          color: const Color(0xFF2f3653),
        ),
      ]);
    }

    return Expanded(
      child: GridView.builder(
        padding: const EdgeInsets.all(16.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
          childAspectRatio: 2 / 3,
        ),
        itemCount: productProvider.products.length,
        itemBuilder: (context, index) {
          final product = productProvider.products[index];
          return InkWell(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProductDetailsPage(productId: product.id),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: Box(
                    style: Style(
                      $box.color($token.color.cardBackgroundColor.resolve(context)),
                      $box.borderRadius.all(10.0),
                      $box.padding.vertical(20),
                    ),
                    child: Image.asset(
                      product.imageUrl,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(product.name,
                          style: $token.textStyle.body
                              .resolve(context)
                              .copyWith(
                                color: $token.color.onSurface.resolve(context),
                              )),
                      const SizedBox(height: 4.0),
                      Text(
                        '\$${product.price.toStringAsFixed(2)}',
                        style: $token.textStyle.headline2.resolve(context).copyWith(
                              color: $token.color.onSurface.resolve(context),
                            ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
