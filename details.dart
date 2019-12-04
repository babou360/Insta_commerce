
import 'package:flutter/material.dart';
import 'package:insta_commerce/notifier/Product_notifier.dart';
import 'package:provider/provider.dart';
import 'package:carousel_pro/carousel_pro.dart';
//lee
class Details extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ProductNotifier productNotifier=Provider.of<ProductNotifier>(context,listen: false);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(productNotifier.currentProduct.name),
      ),
      body: Center(
        child: Container(
          child: Column(
            children: <Widget>[
              GridView.count(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                crossAxisCount: 3,
                crossAxisSpacing: 4,
                mainAxisSpacing: 4,
                children: productNotifier.currentProduct.images.map(
                  (image)=> Card(
                    //color: Colors.black,
                    child: Image.network(image),
                    //child: Text(size),
                  )
                  ).toList(),
              ),

             SizedBox(
         height: 300,
         width: 1200,
   child:Carousel(
     autoplay: true,
     animationDuration: Duration(microseconds: 1000),
     animationCurve: Curves.fastOutSlowIn,
     boxFit: BoxFit.cover,
     images: productNotifier.currentProduct.images.map(
       (image)=> Container(
         width: 600,
         child: Image.network(image),
       )
       ).toList()
   )
   )
            ],
          ),
        ),
      ),
    );
  }
}