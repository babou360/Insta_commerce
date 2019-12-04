import 'package:flutter/material.dart';
import 'package:insta_commerce/notifier/Product_notifier.dart';

import 'home.dart';
import 'package:provider/provider.dart';

void main()=> runApp(
  MultiProvider(providers:[
    ChangeNotifierProvider(
      builder:(context)=>ProductNotifier()
    ) ],
   child:Errandiaga()));

class Errandiaga extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
     title: 'Errandiaga',
     debugShowCheckedModeBanner: false,
     theme: ThemeData(
       primarySwatch: Colors.blue,
       primaryColor: Colors.black,
       primaryIconTheme: IconThemeData(color: Colors.black),
       primaryTextTheme: TextTheme(
         title: TextStyle(color: Colors.black)),
         textTheme: TextTheme(title: TextStyle(color: Colors.black))),
         home: Home(),

       );
  }
}