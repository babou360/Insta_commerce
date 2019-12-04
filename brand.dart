import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';
import 'dart:convert';

class BrandServices{
  Firestore firestore=Firestore.instance;
  String ref='Brands';

  void createBrand(String name){
    var id=Uuid();
    String categoryId=id.v1();
    firestore.collection(ref).document(categoryId).setData({'brandName':name});
  }
  Future<List<DocumentSnapshot>> getBrands(){
  return firestore.collection(ref).getDocuments().then((snaps){
    print(snaps.documents.length);
    return snaps.documents;
  });
  }
  Future getSuggestions(String suggestion)=>
    firestore.collection(ref).where(
      'category', isEqualTo: suggestion).getDocuments().then((snap){
       return snap.documents;
      });
}