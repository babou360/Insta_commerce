// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_database/firebase_database.dart';
// import 'package:flutter/material.dart';
// import 'package:insta_commerce/components/Posts.dart';

// class Body extends StatefulWidget {
//   @override
//   _BodyState createState() => _BodyState();
// }

// class _BodyState extends State<Body> {
//   List<Posts> PostList=[];

//   @override
//   void initState() {
//     super.initState();
//     Firestore firestore=Firestore.instance;
//     String ref='Products';

//   //   Future<List<DocumentSnapshot>> getProducts(){
//   //   return firestore.collection(ref).getDocuments().then((snaps){
//   //   print(snaps.documents.length);
//   //   return snaps.documents;
//   // });
//   // }
//   ref.once().then((DataSnapshot snap){
//     var KEYS=snap.value.keys;
//     var DATA=snap.value;

//     PostList.clear();

//     for(var individualKey in KEYS){
//       Posts _posts=new Posts(
//         DATA[individualKey]['brand'],
//         DATA[individualKey]['category'],
//         DATA[individualKey]['id'],
//         DATA[individualKey]['images'],
//         DATA[individualKey]['name'],
//         DATA[individualKey]['price'],
//         DATA[individualKey]['quantity'],
//         DATA[individualKey]['sizes'],
//       );
//       PostList.add(_posts);
//     }
//     setState(() {
//       print('length: $PostList.length');
//     });
//   });
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Post'),
//         elevation: 1.5,
//         centerTitle: true,
//       ),
//       body: new Container(
//         child: PostList.length==0 ? Text('No posts available') : new ListView.builder(
//           itemCount: PostList.length,
//           itemBuilder: (_,index){
//             return PostUi(
//               PostList[index].brand,
//               PostList[index].category,
//               PostList[index].id,
//               PostList[index].images,
//               PostList[index].name,
//               PostList[index].price,
//               PostList[index].quantity,
//               PostList[index].sizes,
//               );
//           }
//         ),
//       )
      
//     );
//   }
//   Widget PostUi(String brand,category,id,images,name,price,quantity,sizes ){
//     return new Card(
//       elevation: 10.0,
//       margin: EdgeInsets.all(15.0),
//       child: Container(
//         padding: EdgeInsets.all(15.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: <Widget>[
//                 Text(brand,style:TextStyle(color: Colors.purple),
//                 textAlign: TextAlign.center,),
//                 Text(category,style:TextStyle(color: Colors.purple),
//                 textAlign: TextAlign.center,),
//                 Text(id,style:TextStyle(color: Colors.purple),
//                 textAlign: TextAlign.center,)
//               ],
//             ),
//             SizedBox(height: 10.0,),
//             new Image.network(images,fit:BoxFit.cover),
//             SizedBox(height: 10.0,),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: <Widget>[
//                 Text(name,style:TextStyle(color: Colors.purple),
//                 textAlign: TextAlign.center,),
//                 Text(price,style:TextStyle(color: Colors.purple),
//                 textAlign: TextAlign.center,),
//                 Text(quantity,style:TextStyle(color: Colors.purple),
//                 textAlign: TextAlign.center,),
//               ],
//             ),
//             Text(sizes,style:TextStyle(color: Colors.purple),
//                 textAlign: TextAlign.center,),
//           ],
//         ),
//       ),
//     );
//   }
// }