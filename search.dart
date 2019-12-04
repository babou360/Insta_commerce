import 'package:flutter/material.dart';
import 'package:insta_commerce/Pages1/Admin.dart';

import '../home.dart';
import 'account.dart';
import 'favorite.dart';
import 'media.dart';

class Search extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
       backgroundColor: Colors.white,
       elevation: 1.5,
       title: Text('Account'),
     ),
     bottomNavigationBar: new Container(
       color: Colors.white,
       height: 50.0,
       alignment: Alignment.center,

       child: new BottomAppBar(
       child:new Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          new IconButton(
            icon: Icon(Icons.home,),
            onPressed:()=> Navigator.of(
              context).push(new MaterialPageRoute(builder:(context)=>new Home() ))
          ),
          new IconButton(
            icon: Icon(Icons.search,),
            onPressed:()=> Navigator.of(
              context).push(new MaterialPageRoute(builder:(context)=>new Search() ))
          ),
          new IconButton(
            icon: Icon(Icons.add_box,),
               onPressed:()=> Navigator.of(
              context).push(new MaterialPageRoute(builder:(context)=>new Media() ))
          ),
          new IconButton(
            icon: Icon(Icons.favorite,),
             onPressed:()=> Navigator.of(
              context).push(new MaterialPageRoute(builder:(context)=>new Favorite() ))
          ),
          new IconButton(
            icon: Icon(Icons.account_box,),
             onPressed:()=> Navigator.of(
              context).push(new MaterialPageRoute(builder:(context)=>new Admin() ))
          ),
        ],
      )
       ),
     ), 
    );
  }
}