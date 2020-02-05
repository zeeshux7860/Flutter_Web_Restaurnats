import 'dart:html';

import 'package:flutter_web/material.dart';
import 'package:resturant/subcriber_admin/module/query.dart';
import 'package:resturant/subcriber_admin/widgets/drawerlist.dart';
import 'package:resturant/subcriber_admin/widgets/row_dashboard.dart';
import 'package:firebase_web/firebase.dart';
class Dish_List extends StatefulWidget {
  final uid;

  const Dish_List({Key key, this.uid}) : super(key: key);
  @override
  _Dish_ListState createState() => _Dish_ListState();
}

class _Dish_ListState extends State<Dish_List> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dish List"),
        elevation: 0.0,
        backgroundColor: Colors.black,
      ),
      body: Row_Dash(
        first: Drawer_list(
          uids: widget.uid,
        ),
        second: StreamBuilder(
          stream: firestore().collection('DishList').where('restaurants_id', "==", widget.uid).onSnapshot,
          builder: (context, snapshot) {
             if(!snapshot.hasData){
           return Center(
              child: CircularProgressIndicator(),
            );}else{
                //var items = snapshot.data.documents;
           
           
            return ListView.builder(
              itemCount: snapshot.data.docs.length,
              itemBuilder: (context,index){
                var product_id = snapshot.data.docs[index].data()['id'].toString();
                 var base64 = snapshot.data.docs[index].data()['base64'].toString();
                  var category = snapshot.data.docs[index].data()['category'].toString();
                   var product_name = snapshot.data.docs[index].data()['name'].toString();
                    var per_day_stock = snapshot.data.docs[index].data()['per_day_stock'].toString();
                   var product_rate = snapshot.data.docs[index].data()['product_rate'].toString();
                  var desc = snapshot.data.docs[index].data()['desc'].toString();
                  var date = snapshot.data.docs[index].data()['date'].toString();
                  var price = snapshot.data.docs[index].data()['price'].toString();
                return Container(
                  margin: EdgeInsets.all(10.0),
                  child: Card(
                                  child: Row(
                      children: <Widget>[
                       Image.network(base64,
                        height: MediaQuery.of(context).size.height / 2.5,
                        width: MediaQuery.of(context).size.width / 4.0,
                      fit: BoxFit.cover,),
                      Container(
                         height: MediaQuery.of(context).size.height / 2.5,
                        width: MediaQuery.of(context).size.width / 2.0,
                        
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                           padding: EdgeInsets.all(20.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                              Text(product_name,style: TextStyle(color: Colors.black,fontSize: 22.0,fontWeight: FontWeight.bold),),
                              Card(
                                
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Row(
                                    children: <Widget>[
                                      Icon(Icons.star,color: Colors.green,size: 12.0,),
                                      new SizedBox(
                                        width: 5.0,
                                      ),
                                       Text(product_rate,style: TextStyle(color: Colors.green,fontSize: 12.0),),
                                     
                                    ],
                                  ),
                                ),
                              )
                          ],
                        ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left:20.0),
                              child: Text(desc,textAlign: TextAlign.left,),
                            ),
                            SizedBox(
                                  height: 20.0,
                                ),
                            Row(
                              children: <Widget>[
                                SizedBox(
                                  width: 20.0,
                                ),
                                Text("Category :",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                                SizedBox(
                                  width: 10.0,
                                ),
                                Text(category),
                                 SizedBox(
                                  width: 20.0,
                                ),
                                Text("Per Days Stock :",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                                SizedBox(
                                  width: 10.0,
                                ),
                                Text(per_day_stock),
                                  SizedBox(
                                  width: 20.0,
                                ),
                                Text("Date:",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                                SizedBox(
                                  width: 10.0,
                                ),
                                Text(date),
                                

                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Align(
                                alignment: Alignment.bottomLeft,
                                  child: FlatButton(
                                  color: Colors.black,
                                  child: Text(price,style: TextStyle(color: Colors.white),),
                                  onPressed: (){},
                                ),
                              ),
                            ),
                            
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                FlatButton(
                                  child: Text("EDIT",style: TextStyle(color: Colors.white,),),
                                  color: Colors.blue,
                                  onPressed: (){},
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                 FlatButton(
                                  child: Text("REMOVE",style: TextStyle(color: Colors.white,),),
                                  color: Colors.red,
                                  onPressed: (){
                                    store.collection("DishList").doc(snapshot.data.docs[index].id).delete();
                                   /*
 firestore().collection('DishList').where('id', "==", product_id).onSnapshot.listen((onValue){
                                      onValue.docChanges().map((f){
                                        f.doc.data().clear();
                                      });
                                    });*/
                                  },
                                )
                              ],
                            )
                          ],
                        )
                      )
                      ],
                    ),
                  ),
                );
              },
            );
            }
          }
        ),
      ),
    );
  }
}