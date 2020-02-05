import 'dart:html';

import 'package:flutter_web/material.dart';
import 'package:resturant/subcriber_admin/module/get_query.dart';
import 'package:resturant/subcriber_admin/module/query.dart';
import 'package:resturant/subcriber_admin/screens/add_product.dart';
import 'package:resturant/subcriber_admin/screens/categoryadd.dart';
import 'package:resturant/subcriber_admin/screens/dishlist.dart';
import 'package:resturant/subcriber_admin/screens/past_order.dart';
import 'package:resturant/widgets/page_transation.dart';

class Drawer_list extends StatefulWidget {
  final uids;

   Drawer_list({Key key, this.uids});

  @override
  _Drawer_listState createState() => _Drawer_listState();
}

class _Drawer_listState extends State<Drawer_list> {
  @override
  void initState() {
    // TODO: implement initState
      initVerifier();
    // window.console.log(widget.uids);
     trigger();
    super.initState();
  
  }
  var restaurants_name;
  var email;
  var profile;
  void trigger(){
 
 var ref =  store.collection('Restaurants').where('id', '==', widget.uids);
var ref_get =  ref.onSnapshot;
ref_get.listen((onData){

  onData.docs.forEach((f){
    
  setState(() {
    email = f.data()['email'];
     profile = f.data()['profile'];
      restaurants_name = f.data()['restaurants_name'];
  });

  });

  
});
      setState(() {
      
    });
    
    
  }
  
  @override
  Widget build(BuildContext context) {
    
    return  new Column(
        children: <Widget>[
          new UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              color: Colors.black
            ),
            currentAccountPicture: new CircleAvatar(
              backgroundColor: Colors.white,
              backgroundImage:  profile == null ? 
             null: 
              NetworkImage(profile),
              child: profile == null ? 
              CircularProgressIndicator()
              : null

            ),
            accountName: Text(restaurants_name == null 
            ? 
            'loading'
            : 
            restaurants_name
              /*restaurants_name == '' ? 'Loading' : restaurants_name*/,style: TextStyle(color: Colors.white),),
            accountEmail: new Text(email == null 
            ? 
            'loading'
            : 
            email,style: TextStyle(color: Colors.white),)
          ),
           new ListTile(
                leading: new Icon(Icons.home),
                title: new Text("Home"),
                onTap: (){
                  Navigator.of(context).pop();
                },
              ),
              new ListTile(
                leading: new Icon(Icons.category),
                title: new Text("Create Category"),
                onTap: (){

                  Navigator.push(context, PageTransition(type: PageTransitionType.fade, child:  CategoryAdd(
                    uid: widget.uids,
                  )));
                },
              ),
              new ListTile(
                leading: new Icon(Icons.fastfood),
                title: new Text("Dish List"),
                onTap: (){

                  Navigator.push(context, PageTransition(type: PageTransitionType.fade, child:  Dish_List(
                    uid: widget.uids,
                  )));
                },
              ),
              new ListTile(
                leading: new Icon(Icons.shopping_cart),
                title: new Text("Past Order"),
                onTap: (){

                  Navigator.push(context, PageTransition(type: PageTransitionType.fade, child:  Past_Order()));
                },
              ),
              new ListTile(
                leading: new Icon(Icons.supervisor_account),
                title: new Text("Accont Details"),
                onTap: (){
                
                },
              ),
              new ListTile(
                leading: new Icon(Icons.fastfood),
                title: new Text("Add Dish"),
                onTap: (){
                      Navigator.push(context, PageTransition(type: PageTransitionType.fade, child:  Add_product(
                        uid: widget.uids,
                        restaurants_name: restaurants_name
                      )));
              
                },
              ),
              new ListTile(
                leading: new Icon(Icons.close),
                title: new Text("Logout"),
                onTap: (){
                  logout(context);
                },
              ),
        ],
      );
    
  }
}