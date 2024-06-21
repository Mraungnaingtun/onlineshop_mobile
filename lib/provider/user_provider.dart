
import 'package:flutter/material.dart';
import 'package:onlineshopping/model/product.dart';
import 'package:onlineshopping/model/shoppee_user.dart';

class UserProvider extends ChangeNotifier {
  ShoppeeUser? _user;

  ShoppeeUser? get user => _user;

  List<Product> products = [];

  UserProvider();

  void setUser(ShoppeeUser newUser) {
    _user = newUser;
    notifyListeners();
  }

  Product getProduct(int id) => products.firstWhere((p) => p.id == id);

  void setProducts(List<Product> newProducts) {
    products = newProducts;
    notifyListeners();
  }
}