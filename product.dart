import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';
import 'dart:convert';

class ProductServices{
  Firestore firestore=Firestore.instance;
  String ref='Products';

  void uploadProduct({String name,String brand,String category,List images,List sizes,double price,int quantity}){
    var id=Uuid();
    String productId=id.v1();
    firestore.collection(ref).document(productId).setData({
      'id':productId,
      'name':name,
      'brand':brand,
      'category':category,
      'price':price,
      'sizes':sizes,
      'images':images,
      'quantity':quantity
    });
  }
}