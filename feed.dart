import 'package:flutter/material.dart';
import 'package:insta_commerce/api/product_api.dart';
import 'package:insta_commerce/notifier/Product_notifier.dart';
import 'package:insta_commerce/screens/details.dart';
import 'package:provider/provider.dart';

class Feed extends StatefulWidget {
  @override
  _FeedState createState() => _FeedState();
}

class _FeedState extends State<Feed> {

  @override
  void initState() {
    ProductNotifier productNotifier=Provider.of<ProductNotifier>(context,listen:false);
    getProducts(productNotifier);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
  ProductNotifier productNotifier=Provider.of<ProductNotifier>(context);
    return Scaffold( 
      appBar: AppBar(
        title: Text('Feed'),
        backgroundColor:Colors.white,
      ),
      body: ListView.separated(
        itemBuilder: (BuildContext context,int index){
          return ListTile(
            // leading: Image.network(productNotifier.productList[index].images,
            // width:120 ,
            // fit: BoxFit.fitWidth,),
            title: Text(productNotifier.productList[index].name,style: TextStyle(color: Colors.black),),
            subtitle: Text(productNotifier.productList[index].price.toString()),
            onTap: (){
              productNotifier.currentProduct=productNotifier.productList[index];
              // Navigator.of(context).push(
              //   MaterialPageRoute(builder:(BuildContext context){
              //   return Details();
              // }));
              Navigator.of(
              context).push(new MaterialPageRoute(builder:(context)=>new Details() ));
            },
          );
        },
        itemCount: productNotifier.productList.length,
         separatorBuilder: (BuildContext context, int index) {
           return Divider(color: Colors.black,);
         },
      ), 
    );
  }
}