import 'package:flutter/material.dart';
import 'package:mix/mix.dart';
import 'package:onlineshopping/provider/ProductProvider.dart';
import 'package:onlineshopping/utils/ColorToken.dart';
import 'package:provider/provider.dart';
import '../../screens/product_details.dart';

class ProductList extends StatelessWidget {
  const ProductList({super.key});

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);

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
