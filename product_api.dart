import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:insta_commerce/model/Product.dart';
import 'package:insta_commerce/notifier/Product_notifier.dart';

getProducts(ProductNotifier productNotifier) async{
QuerySnapshot snapshot=await Firestore.instance.collection('Products').getDocuments();

List<Product> _productList=[];
snapshot.documents.forEach((document){
  Product product=Product.fromMap(document.data);
  _productList.add(product);
});
productNotifier.productList=_productList;
}