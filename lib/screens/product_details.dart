import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mix/mix.dart';
import 'package:onlineshopping/provider/user_provider.dart';
import 'package:onlineshopping/utils/color_token.dart';
import 'package:provider/provider.dart';

class ProductDetailsPage extends StatelessWidget {
  final int productId;

  const ProductDetailsPage({super.key, required this.productId});

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<UserProvider>(context);
    final product = productProvider.getProduct(productId);
    final Size size = MediaQuery.of(context).size;

    if (product == null) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Product Not Found'),
        ),
        body: const Center(
          child: Text('The product you requested was not found.'),
        ),
      );
    }

    return Scaffold(
      backgroundColor: product.color,
      appBar: AppBar(
        backgroundColor: product.color,
        elevation: 0,
        leading: IconButton(
          iconSize: 24.0,
          icon: const Icon(CupertinoIcons.arrow_left),
          color: Colors.white,
          onPressed: () => Navigator.pop(context),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(CupertinoIcons.search),
            color: Colors.white,
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(CupertinoIcons.cart),
            color: Colors.white,
            onPressed: () {},
          ),
          const SizedBox(width: 20.0 / 2)
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: size.height,
              child: Stack(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: size.height * 0.3),
                    padding: EdgeInsets.only(
                      top: size.height * 0.12,
                      left: 20.0,
                      right: 20.0,
                    ),
                    // height: 500,f
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24),
                        topRight: Radius.circular(24),
                      ),
                    ),
                    child: SizedBox(
                      width: size.width,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          children: [
                            const SizedBox(height: 30),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(product.name,
                                    style: $token.textStyle.headline1
                                        .resolve(context)
                                        .copyWith(
                                          color: $token.color.onSurface
                                              .resolve(context),
                                        )),
                                Text("\$${product.price.toStringAsFixed(2)}",
                                    style: $token.textStyle.headline1
                                        .resolve(context)
                                        .copyWith(
                                          color: $token.color.onSurface
                                              .resolve(context),
                                        )),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            RichText(
                              textAlign: TextAlign.justify,
                              text: TextSpan(
                                text:
                                    "Certainly! If you want to achieve a layout similar to Microsoft Word's justify alignment, you can consider using the textAlign property along with RichText widget for more advanced styling. Here's how you can do it:",
                                style: $token.textStyle.body
                                    .resolve(context)
                                    .copyWith(
                                      color: $token.color.onSurface
                                          .resolve(context),
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    child: Image.asset(
                      product.imageUrl,
                      height: 350,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Container(
          height: 104,
          color: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 1.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                iconSize: 30.0,
                onPressed: () {},
                icon: const Icon(Icons.favorite_border_outlined),
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  width: 250,
                  padding: const EdgeInsets.all(14.0),
                  decoration: BoxDecoration(
                    color: product.color,
                    borderRadius: BorderRadius.circular(4.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black
                            .withOpacity(0.2),
                        spreadRadius: 4, 
                        blurRadius: 10, 
                        offset: const Offset(0, 3), 
                      ),
                    ],
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.add,
                        size: 24,
                        color: Colors.white,
                      ),
                      SizedBox(width: 10),
                      Text(
                        'ADD TO CART',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
