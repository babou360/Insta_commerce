import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
     itemCount: 10,
     itemBuilder: (context,index)=> index==0
     ? new SizedBox(
       height: 0.0,
     )
     :Column(
       mainAxisAlignment: MainAxisAlignment.start,
       mainAxisSize: MainAxisSize.min,
       crossAxisAlignment: CrossAxisAlignment.stretch,
       children: <Widget>[
         Padding(
           padding: const EdgeInsets.fromLTRB(16.0,16.0,8.0,16.0),
           child: Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: <Widget>[
               Row(
                 children: <Widget>[
                   new Container(
                     height: 60,
                     width: 60,
                     decoration: BoxDecoration(
                       shape: BoxShape.circle,
                       image: new DecorationImage(
                         fit: BoxFit.fill,
                         image: ExactAssetImage('assets/images/pilipili.jpg')
                       )
                     ),
                   ),
                   new SizedBox(
                     width: 10.0,
                   ),
                   new Text('Babou36o',
                   style: TextStyle(fontWeight: FontWeight.bold))
                 ],
               ),
               new IconButton(
                 icon: Icon(Icons.more_vert,),
                 onPressed: (){},
               )
             ],
           ),
         ),
         new Container(
           height: 250.0,
           width: 200,
           decoration: new BoxDecoration(
             shape: BoxShape.rectangle,
             image: new DecorationImage(
               fit: BoxFit.fill,
               image: new ExactAssetImage('assets/images/pilipili.png'),
             )
           ),
         ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Icon(Icons.favorite),
                  new SizedBox(
                    width: 16.0,
                  ),
                  Icon(Icons.comment),
                  new SizedBox(
                    width: 16.0,
                  ),
                  Icon(Icons.insert_emoticon),
                ],
              ),
              Icon(Icons.bookmark)
            ],
          ),
        )
       ],
     ) 
    );
  }
}