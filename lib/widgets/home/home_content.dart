import 'package:flutter/material.dart';
import 'package:mix/mix.dart';
import 'package:onlineshopping/model/Product.dart';
import 'package:onlineshopping/provider/ProductProvider.dart';
import 'package:onlineshopping/utils/ColorToken.dart';
import 'package:onlineshopping/widgets/home/search_box.dart';
import 'package:onlineshopping/widgets/product/ProductList.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeContent extends StatefulWidget {
  const HomeContent({super.key});

  @override
  State<HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  late ProductProvider productProvider;
  bool _firstTime = false;

   @override
  void initState() {
    super.initState();
     WidgetsBinding.instance.addPostFrameCallback((_) {
      productProvider =
          Provider.of<ProductProvider>(context, listen: false);
          _setProduct();
          _isFirstTime();
     });
  }

   void _isFirstTime() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _firstTime = prefs.getBool("first_time")!;
    if(_firstTime){
      productProvider.username = prefs.getString("username")!;
    }
  }

  _setProduct(){
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
  }
  

  @override
  Widget build(BuildContext context) {
    productProvider = Provider.of<ProductProvider>(context, listen: false);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SearchBox(hintText: 'Search', onSearch: (String ) {  },),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "Hello ${productProvider.username} 👋😊",
            style: $token.textStyle.headline2.resolve(context).copyWith(
                  color: $token.color.onSurface.resolve(context),
                ),
          ),
        ),
        const ProductList(),
      ],
    );
  }
  
 
}
