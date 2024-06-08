import 'package:flutter/material.dart';
import 'package:onlineshopping/model/Product.dart';
import 'package:onlineshopping/screens/ProductDetailsPage.dart';
import 'package:onlineshopping/widgets/CarouselSliderWidget.dart';
import 'package:onlineshopping/widgets/CusAppBar.dart';
import 'package:onlineshopping/widgets/ProductItem.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<String>>? categoriesFuture;

  final List<Product> products = [
    Product(
      name: "Product 1",
      price: 10.99,
      photoPath: "assets/images/sneaker.png",
    ),
    Product(
      name: "Product 2",
      price: 19.99,
      photoPath: "assets/images/sneaker.png",
    ),
    Product(
      name: "Product 3",
      price: 29.99,
      photoPath: "assets/images/sneaker.png",
    ),
    Product(
      name: "Product 4",
      price: 29.99,
      photoPath: "assets/images/sneaker.png",
    ),
    Product(
      name: "Product 5",
      price: 29.99,
      photoPath: "assets/images/sneaker.png",
    ),
    Product(
      name: "Product 6",
      price: 29.99,
      photoPath: "assets/images/sneaker.png",
    ),
    Product(
      name: "Product 7",
      price: 29.99,
      photoPath: "assets/images/sneaker.png",
    ),
    Product(
      name: "Product 8",
      price: 29.99,
      photoPath: "assets/images/sneaker.png",
    ),
    Product(
      name: "Product 9",
      price: 29.99,
      photoPath: "assets/images/sneaker.png",
    ),
    Product(
      name: "Product 10",
      price: 29.99,
      photoPath: "assets/images/sneaker.png",
    ),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CusAppBar(
        title: "Shoppee",
        onSearch: (String query) {},
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          const SliverToBoxAdapter(
             child: CarouselSliderWidget(),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(8.0),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              ProductDetailsPage(product: products[index]),
                        ),
                      );
                    },
                    child: ProductItem(
                      product: products[index],
                    ),
                  );
                },
                childCount: products.length,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
