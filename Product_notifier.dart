import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:insta_commerce/model/Product.dart';

class ProductNotifier with ChangeNotifier{
  List<Product> _productList=[];

  Product _currentProduct;

  UnmodifiableListView<Product> get productList=>UnmodifiableListView(_productList);

  Product get currentProduct=> _currentProduct;

  set productList(List<Product> productList){
    _productList=productList;
    notifyListeners();
  }

  set currentProduct(Product product){
    _currentProduct=product;
    notifyListeners();
  }
}