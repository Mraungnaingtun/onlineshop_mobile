import 'package:flutter/material.dart';
import 'package:mix/mix.dart';
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
  String hello = "";
  bool _firstTime = false;

   @override
  void initState() {
    super.initState();
     WidgetsBinding.instance.addPostFrameCallback((_) {
      productProvider =
          Provider.of<ProductProvider>(context, listen: false);
     });
    
  }

   void _isFirstTime() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _firstTime = prefs.getBool("first_time")!;
    if(_firstTime){
      hello = prefs.getString("username")!;
    }else {
      hello =  productProvider.username;
    }
  }

  @override
  Widget build(BuildContext context) {

    final productProvider = Provider.of<ProductProvider>(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SearchBox(hintText: 'Search', onSearch: (String ) {  },),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Hello 👋',
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
