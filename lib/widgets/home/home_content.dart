import 'package:flutter/material.dart';
import 'package:mix/mix.dart';
import 'package:onlineshopping/model/product.dart';
import 'package:onlineshopping/model/shoppee_user.dart';
import 'package:onlineshopping/provider/user_provider.dart';
import 'package:onlineshopping/utils/color_token.dart';
import 'package:onlineshopping/widgets/home/search_box.dart';
import 'package:onlineshopping/widgets/product/product_list.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeContent extends StatefulWidget {
  const HomeContent({super.key});

  @override
  State<HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  late UserProvider productProvider;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      productProvider = Provider.of<UserProvider>(context, listen: false);
      await _setProductlist();
      await _getUserName();
    });
  }

  Future<void> _getUserName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? username = prefs.getString("username");
    String? phtoUrl = prefs.getString("photoUrl");
    String? email = prefs.getString("email");
    if (username != null && phtoUrl != null && email != null) {
      ShoppeeUser newUser = ShoppeeUser(
        username: username,
        email: email,
        photoUrl: phtoUrl,
      );
      productProvider.setUser(newUser);
    }
  }

  Future<void> _setProductlist() async {
    List<Product> newProducts = [
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
    ];
    productProvider.setProducts(newProducts);
  }

  @override
  Widget build(BuildContext context) {
    productProvider = Provider.of<UserProvider>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Box(
          style: Style(
            $box.margin.top(30),
            $box.padding.only(top: 20, left: 30, right: 40)),
          child: Text(
            "Hi ${productProvider.user?.username ?? ''} 👋😊",
            style: $token.textStyle.headline2.resolve(context).copyWith(
                  color: $token.color.onSurface.resolve(context),
                ),
          ),
        ),
        SearchBox(
          hintText: 'Search',
          onSearch: (String query) {
          },
        ),
        const ProductList(),
      ],
    );
  }
}
