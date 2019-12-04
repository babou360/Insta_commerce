import 'package:flutter/material.dart';
import 'package:insta_commerce/Pages1/add_products.dart';
import 'package:insta_commerce/pages/favorite.dart';
import 'package:insta_commerce/pages/media.dart';
import 'package:insta_commerce/pages/search.dart';
import 'package:insta_commerce/database/category.dart';
import 'package:insta_commerce/database/brand.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../home.dart';

enum Page{dashboard,manage}

class Admin extends StatefulWidget {
  @override
  _AdminState createState() => _AdminState();
}

class _AdminState extends State<Admin> {
  Page _selectedPage=Page.dashboard;
  MaterialColor active=Colors.red;
   MaterialColor notactive=Colors.grey;
   TextEditingController categoryController=TextEditingController();
   TextEditingController brandController=TextEditingController();
   GlobalKey<FormState> _formKey=GlobalKey();
   CategoryServices _services=CategoryServices();
   BrandServices _brandservices=BrandServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
       title: Row(
         children: <Widget>[
           Expanded(
             child: FlatButton.icon(
              onPressed: (){
                setState(()=> _selectedPage=Page.dashboard);
              }, 
              icon: Icon(
                Icons.dashboard,
                color: _selectedPage==Page.dashboard
                ?active
                :notactive,),
                label: Text('Dashboard'),
             ),
           ),
           Expanded(
             child: FlatButton.icon(
              onPressed: (){
                setState(()=> _selectedPage=Page.manage);
              }, 
              icon: Icon(
                Icons.sort,
                color: _selectedPage==Page.manage
                ?active
                :notactive,),
                label: Text('Manage'),
             ),
           )
         ],
       ),
       elevation: 1.5,
       backgroundColor: Colors.white,
     ), 
     body: _loadScreen());
       }
     
      Widget _loadScreen() {
         switch(_selectedPage){
           case Page.dashboard:
           return Text('This is dashboard');
           
           break;
           case Page.manage:
           return ListView(
             children: <Widget>[
               ListTile(
                 leading: Icon(Icons.add),
                 title: Text('add Brand'),
                 onTap: (){
                   _brandAlert();
                                    },
                                  ),
              Divider(),
              ListTile(
                 leading: Icon(Icons.add),
                 title: Text('add Products'),
                 onTap: (){
                   Navigator.push(context, MaterialPageRoute(builder: (_)=>AddProducts()));
                   },
              ),
              
                                  Divider(),
                                  ListTile(
                                    leading: Icon(Icons.add),
                                    title: Text('add category'),
                                    onTap: (){
                                      _categoryAlert();
                                                       },
                                                     ),
                                                   ],
                                                 );
                                                 break;
                                                 default: return Container();
                                               }
                                             }
                                      
                                        void _categoryAlert() {
                                          var alert=new AlertDialog(
                                              content: Form(
                                                key: _formKey,
                                              child: TextFormField(
                                              controller: categoryController,
                                              validator: (Value){
                                                if(Value.isEmpty){
                                                  return 'Value cannot be empty';
                                                }
                                              },
                                              decoration: InputDecoration(
                                                hintText: ('add category')
                                              ),
                                              ),
                                            ),
                                            actions: <Widget>[
                                              FlatButton(
                                                onPressed:(){
                                                  if(categoryController.text !=null){
                                                    _services.createCategory(categoryController.text);
                                                  }
                                                  Fluttertoast.showToast(msg: 'category created');
                                                }, child:Text('add category'),),
                                               FlatButton(
                                                onPressed:(){
                                                  Navigator.pop(context);
                                                }, child:Text('cancel'),), 
                                            ],
                                          );
                                          showDialog(context: context,builder: (_) =>alert);
                                        }
                   
                     void _brandAlert() {
                       var alert=new AlertDialog(
                                              content: Form(
                                                key: _formKey,
                                              child: TextFormField(
                                              controller: categoryController,
                                              validator: (Value){
                                                if(Value.isEmpty){
                                                  return 'Brand cannot be empty';
                                                }
                                              },
                                              decoration: InputDecoration(
                                                hintText: ('add Brand')
                                              ),
                                              ),
                                            ),
                                            actions: <Widget>[
                                              FlatButton(
                                                onPressed:(){
                                                  if(brandController.text !=null){
                                                    _brandservices.createBrand(categoryController.text);
                                                  }
                                                  Fluttertoast.showToast(msg: 'Brand created');
                                                }, child:Text('add Brand'),),
                                               FlatButton(
                                                onPressed:(){
                                                  Navigator.pop(context);
                                                }, child:Text('cancel'),), 
                                            ],
                                          );
                                          showDialog(context: context,builder: (_) =>alert);
                     }
}