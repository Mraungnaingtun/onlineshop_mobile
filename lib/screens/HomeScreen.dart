import 'package:flutter/material.dart';
import 'package:onlineshopping/model/Product.dart';
import 'package:onlineshopping/widgets/CusAppBar.dart';
import 'package:onlineshopping/widgets/ProductItem.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: 150,
            color: const Color.fromARGB(255, 72, 96, 107),
            child: const Center(
              child: Text(
                'Promotion',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return ProductItem(
                    product: products[index],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
