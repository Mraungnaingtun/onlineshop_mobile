import 'package:flutter/material.dart';
import 'package:onlineshopping/model/Product.dart';

class ProductProvider extends ChangeNotifier {
  List<Product> products = [];

  String username = "";

  String getUserName(){
    return username;
  }

  void setUserName(String name){
    username = name;
  }

  void setProducts(List<Product> newProducts) {
    products = newProducts;
    notifyListeners();
  }

  Product getProductById(int id) {
    return products.firstWhere((product) => product.id == id);
  }
}
