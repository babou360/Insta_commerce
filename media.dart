import 'package:flutter/material.dart';
import 'package:insta_commerce/Pages1/Admin.dart';
import 'package:insta_commerce/pages/search.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../home.dart';
import 'account.dart';
import 'favorite.dart';

class Media extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
       backgroundColor: Colors.white,
       elevation: 1.5,
       title: Text('Media'),
     ),
        body: Container(
        child: StreamBuilder<QuerySnapshot>(
          stream: Firestore.instance.collection("sumbufu").snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return new Text('Error: ${snapshot.error}');
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text("Loading..."),
                    SizedBox(
                      height: 50.0,
                    ),
                    CircularProgressIndicator()
                  ],
                ),
              );
            } else {
              return Column(
             children: <Widget>[
             Text(snapshot.data.documents[0]["moja"]),
             Text(snapshot.data.documents[0]["mbili"].toString()),
           ],);
            }
          },
        ),
      ),
    );
  }
}