import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:insta_commerce/database/brand.dart';
import 'package:insta_commerce/database/category.dart';
import 'package:image_picker/image_picker.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:insta_commerce/database/product.dart';

class AddProducts extends StatefulWidget {
@override
_AddProductsState createState() => _AddProductsState();
}

class _AddProductsState extends State<AddProducts> {
GlobalKey<FormState> _formKey=GlobalKey<FormState>();
TextEditingController productNameController= TextEditingController();
TextEditingController priceController= TextEditingController();
TextEditingController quantityController= TextEditingController();
List<DocumentSnapshot> brands=<DocumentSnapshot>[];
List<DocumentSnapshot> categories=<DocumentSnapshot>[];
CategoryServices _categoryServices=CategoryServices();
ProductServices _productServices=ProductServices();
BrandServices _brandServices=BrandServices();
List<DropdownMenuItem<String>> categoriesDropDown=<DropdownMenuItem<String>>[];
List<DropdownMenuItem<String>> brandsDropDown=<DropdownMenuItem<String>>[];
List<String> selectedSize=<String>[];
String _currentCategory;
String _currentBrand;
List<String> selectedSizes=<String>[];
File Image1;
File Image2;
File Image3;
bool isLoading=false;


@override
void initState(){
_getCategories();
_getBrands();
}
List<DropdownMenuItem<String>> getCategoriesDropDown(){
List<DropdownMenuItem<String>> items=new List();
for(int i=0; i<categories.length; i++){
setState(() {
items.insert(0, DropdownMenuItem(
child:Text(categories[i].data['categoryName']),
value:categories[i].data['categoryName']));
});
}
return items;
}
List<DropdownMenuItem<String>> getBrandsDropDown(){
List<DropdownMenuItem<String>> items=new List();
for(int i=0; i<brands.length; i++){
setState(() {
items.insert(0, DropdownMenuItem(
child:Text(brands[i].data['brandName']),
value:brands[i].data['brandName']));
});
}
return items;
}

@override
Widget build(BuildContext context) {
return Scaffold(
appBar: AppBar(
backgroundColor: Colors.white,
elevation: 1.5,
title: Text("Add products" , style: TextStyle(color: Colors.black)),
leading: Icon(Icons.pie_chart_outlined),
),
body: Form(
key: _formKey,
child: /*isLoading? CircularProgressIndicator: */SingleChildScrollView(
  child:   Column(
  
  children: <Widget>[
  
  Row(
  
  children: <Widget>[
  
  Expanded(
  
  child: Padding(
  
  padding: const EdgeInsets.all(8.0),
  
  child: OutlineButton(
  
  borderSide: BorderSide(color: Colors.grey.withOpacity(0.8),width: 1.0),
  
  onPressed: (){
  
  _selectImage(ImagePicker.pickImage(source: ImageSource.gallery),1);
  
  },
  
              child:  displayChild1()
  
        ),
  
    ),
  
  ),
  
  Expanded(
  
  child: Padding(
  
  padding: const EdgeInsets.all(8.0),
  
  child: OutlineButton(
  
  borderSide: BorderSide(color: Colors.grey.withOpacity(0.8),width: 1.0),
  
  onPressed: (){
  
  _selectImage(ImagePicker.pickImage(source: ImageSource.gallery),2);
  
  },
  
  child: displayChild2()
  
  ),
  
  ),
  
  ),
  
  Expanded(
  
  child: Padding(
  
  padding: const EdgeInsets.all(8.0),
  
  child: OutlineButton(
  
  borderSide: BorderSide(color: Colors.grey.withOpacity(0.8),width: 1.0),
  
  onPressed: (){
  
  _selectImage(ImagePicker.pickImage(source: ImageSource.gallery),3);
  
  },
  
  child: displayChild3()
  
  ),
  
  ),
  
  )
  
  ],),
  
  Padding(
  
  padding: const EdgeInsets.all(8.0),
  
  child: Text('Add product name',
  
  textAlign: TextAlign.center,
  
  style: TextStyle(color: Colors.red,fontSize: 12,fontWeight: FontWeight.bold),),
  
  ),
  
  Padding(
  
  padding: const EdgeInsets.all(12.0),
  
  child: TextFormField(
  
  controller: productNameController,
  
  decoration: InputDecoration(
  
  hintText: 'Product name',
  
  ),
  
  validator: (value){
  
  if(value.isEmpty){
  
  return "The product name cannot be empty";
  
  } else if(value.length>10)
  
  {
  
  return 'maximum is 10';
  
  }
  
  },
  
  ),
  
  ),
  
  //  // Selected Category
  
  
  
  Row(
  
  children: <Widget>[
  
  Padding(
  
  padding: const EdgeInsets.all(8.0),
  
  child: Text('Category:', style: TextStyle(color: Colors.red),),
  
  ),
  
  DropdownButton(
  
  items: categoriesDropDown,
  
  onChanged: changeCurrentCategory,
  
  value: _currentCategory,
  
  ),
  
  Padding(
  
  padding: const EdgeInsets.all(8.0),
  
  child: Text('Brand:', style: TextStyle(color: Colors.red),),
  
  ),
  
  DropdownButton(
  
  items: brandsDropDown,
  
  onChanged: changeCurrentBrand,
  
  value: _currentBrand,
  
  ),
  
  ],
  
  ),
  
  Padding(
  
  padding: const EdgeInsets.all(12.0),
  
  child: TextFormField(
  
  controller: quantityController,
  
  keyboardType: TextInputType.number,
  
  decoration: InputDecoration(
  
  hintText: 'Enter Quantity',
  
  ),
  
  validator: (value){
  
  if(value.isEmpty){
  
  return "Quantity cannot be empty";
  
  } 
  
  },
  
  ),
  
  ),
  
  Padding(
  
  padding: const EdgeInsets.all(12.0),
  
  child: TextFormField(
  
  controller: priceController,
  
  keyboardType: TextInputType.number,
  
  decoration: InputDecoration(
  
  hintText: 'Price',
  
  ),
  
  validator: (value){
  
  if(value.isEmpty){
  
  return "Quantity cannot be empty";
  
  } 
  
  },
  
  ),
  
  ),
  
  Text('Available sizes'),
  
  Row(
  
  children: <Widget>[
  
  Checkbox(
  
  value: selectedSize.contains('12'),onChanged:(value)=> changeSelectedSize('12')),
  
          Text('12'),
  
  Checkbox(
  
  value: selectedSize.contains('14'),onChanged:(value)=> changeSelectedSize('14')),
  
        Text('14'),
  
  Checkbox(
  
  value: selectedSize.contains('16'),onChanged:(value)=> changeSelectedSize('16')), Text('16'),
  
  Checkbox(
  
  value: selectedSize.contains('18'),onChanged:(value)=> changeSelectedSize('18')), Text('18'),
  
  Checkbox(
  
  value: selectedSize.contains('20'),onChanged:(value)=> changeSelectedSize('20')), Text('20'),
  
    ],
  
  ),
  
     FlatButton(
  
       color:Colors.red,
  
       textColor: Colors.white,
  
       child: Text("Upload"),
  
       onPressed: upload,
  
            )
  
         ],),
),
       ),
       );
       }
               
       _getCategories() async{
       List<DocumentSnapshot> data=await _categoryServices.getCategories();
       print(data.length);
       setState(() {
       categories=data;
       categoriesDropDown=getCategoriesDropDown();
       _currentCategory=categories[0].data['categoryName'];
       });
       }
       _getBrands() async{
       List<DocumentSnapshot> data=await _brandServices.getBrands();
       print(data.length);
       setState(() {
       brands=data;
       brandsDropDown=getBrandsDropDown();
       _currentBrand=brands[0].data['brandName'];
       });
       }
           
       changeCurrentCategory(String selectedCategory) {
       setState(()=> _currentCategory=selectedCategory 
       );
       }
       changeCurrentBrand(String selectedBrand) {
       setState(()=> _currentBrand=selectedBrand 
       );
       }
       
       changeSelectedSize(String size) {
       if(selectedSize.contains(size)){
       setState(() {
       selectedSize.remove(size); 
       });
       }else{
       setState(() {
       selectedSize.insert(0,size);
       });
       }
       }
       
       void _selectImage(Future<File> pickImage,int imageNumber) async{
       File tempImg=await pickImage;
       switch(imageNumber){
       case 1:
       setState(()=> Image1=tempImg);
       break;
       case 2:
       setState(()=> Image2=tempImg);
       break;
       case 3:
       setState(()=> Image3=tempImg);
       
       }
       }
                                                                                                                                                                                                                   
         displayChild1() {
       if(Image1==null){
       return Padding(
       padding: const EdgeInsets.all(8.0),
       child: Icon(Icons.add,color:Colors.grey),
       );
       }else{
       return  Image.file(Image1,fit: BoxFit.fill,width: double.infinity,);
       }
       }
                                                                                                                                 
        displayChild2() {
       if(Image2==null){
       return Padding(
       padding: const EdgeInsets.all(8.0),
       child: Icon(Icons.add,color:Colors.grey),
       );
       }else{
       return  Image.file(Image2,fit: BoxFit.fill,width: double.infinity,);
       }
       }
                                                                                 
       displayChild3() {
       if(Image3==null){
       return Padding(
       padding: const EdgeInsets.all(8.0),
       child: Icon(Icons.add,color:Colors.grey),
       );
       }else{
       return Image.file(Image3,fit: BoxFit.fill,width: double.infinity,);
       }
       }
       
         void upload() async{
           if(_formKey.currentState.validate()){
             setState(() =>
               isLoading=true
             );
              if(Image1 !=null && Image2!=null && Image3!=null){
                if(selectedSize.isNotEmpty){
                 String imageUrl1;
                 String imageUrl2;
                 String imageUrl3;
                 final FirebaseStorage storage=FirebaseStorage.instance;
                 final String picture1="1${DateTime.now().millisecondsSinceEpoch.toString()}.jpg";
                 StorageUploadTask task1=storage.ref().child(picture1).putFile(Image1);
                 final String picture2="2${DateTime.now().millisecondsSinceEpoch.toString()}.jpg";
                 StorageUploadTask task2=storage.ref().child(picture2).putFile(Image2);
                 final String picture3="3${DateTime.now().millisecondsSinceEpoch.toString()}.jpg";
                 StorageUploadTask task3=storage.ref().child(picture3).putFile(Image3);

                 StorageTaskSnapshot snapshot1=await task1.onComplete.then((snapshot)=>snapshot);
                 StorageTaskSnapshot snapshot2=await task2.onComplete.then((snapshot)=>snapshot);

                  task3.onComplete.then((snapshot3) async{
                  imageUrl1=await snapshot1.ref.getDownloadURL();
                  imageUrl2=await snapshot2.ref.getDownloadURL();
                  imageUrl3=await snapshot3.ref.getDownloadURL();

                  List<String> imageList=[imageUrl1,imageUrl2,imageUrl3];

                  _productServices.uploadProduct(
                  name:productNameController.text,
                  price:double.parse(priceController.text),
                  sizes:selectedSize,
                  images:imageList,
                  quantity:int.parse(quantityController.text));
                   _formKey.currentState.reset();
                   setState(() {
                     isLoading=false;
                   });
                   Fluttertoast.showToast(msg: 'Product added');
                 });
                }else{
                  Fluttertoast.showToast(msg: 'Select atleast one');
                }
              }else{
               Fluttertoast.showToast(msg: 'Images cannot be empty');
              }
           }
         }
}