import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

class CategoryServices{
  Firestore firestore=Firestore.instance;
  String ref='categories';

  void createCategory(String name){
    var id=Uuid();
    String categoryId=id.v1();
    firestore.collection(ref).document(categoryId).setData({'categoryName':name});
  }
  Future<List<DocumentSnapshot>> getCategories()=>
  firestore.collection(ref).getDocuments().then((snaps){
    return snaps.documents;
  });
  Future getSuggestions(String suggestion)=>
    firestore.collection(ref).where(
      'category', isEqualTo: suggestion).getDocuments().then((snap){
       return snap.documents;
      });     
}