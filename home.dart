import 'package:flutter/material.dart';
import 'package:insta_commerce/Pages1/Admin.dart';
import 'package:insta_commerce/pages/account.dart';
import 'package:insta_commerce/pages/favorite.dart';
import 'package:insta_commerce/pages/media.dart';
import 'package:insta_commerce/pages/search.dart';
import 'package:insta_commerce/screens/feed.dart';


import 'components/body.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: new AppBar(
       backgroundColor: Colors.white,
       centerTitle: true,
       elevation:1.5,
       leading: new Icon(Icons.camera_alt),
       title: SizedBox(
         height: 35.0,
         child: new Text("Errandiaga"),
       ),
       actions: <Widget>[
         Padding(
           padding: const EdgeInsets.only(right: 12.0),
           child: Icon(Icons.send),
         )
       ],
     ), 
     body: Body(),

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
            onPressed:(){}
          ),
          new IconButton(
            icon: Icon(Icons.search,),
            onPressed:()=> Navigator.of(
              context).push(new MaterialPageRoute(builder:(context)=>new Search() ))
          ),
          new IconButton(
            icon: Icon(Icons.add_box,),
               onPressed:()=> Navigator.of(
              context).push(new MaterialPageRoute(builder:(context)=>new Feed() ))
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