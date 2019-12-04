// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// import '../home.dart';

// class Media extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//      appBar: AppBar(
//        backgroundColor: Colors.white,
//        elevation: 1.5,
//        title: Text('Media'),
//      ),
//         body: Container(
//         child: StreamBuilder<QuerySnapshot>(
//           stream: Firestore.instance.collection("Posts").snapshots(),
//           builder:
//               (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//             if (snapshot.hasError) {
//               return new Text('Error: ${snapshot.error}');
//             }
//             if (snapshot.connectionState == ConnectionState.waiting) {
//               return Center(
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: <Widget>[
//                     Text("Loading..."),
//                     SizedBox(
//                       height: 50.0,
//                     ),
//                     CircularProgressIndicator()
//                   ],
//                 ),
//               );
//             } else {
//               return ListView(
//              children: snapshot.data.documents.map((DocumentSnapshot document){
//                  return new Card(
//                    name: document['name'],
//                    price:document['price'],
//                  );
//                }).toList()
//             //  Text(snapshot.data.documents[0]["moja"]),
//             //  Text(snapshot.data.documents[0]["mbili"].toString()),
//              ,);
//             }
//           },
//         ),
//       ),
//     );
//   }
// }