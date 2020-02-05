import 'dart:html';

import 'package:flutter_web/cupertino.dart';
import 'package:flutter_web/material.dart';
import 'package:resturant/module/query.dart';
import 'package:resturant/widgets/amount.dart';
import 'package:resturant/widgets/dividers.dart';
import 'package:resturant/widgets/rflutter_alert.dart';
import 'package:firebase_web/firebase.dart';
class Order_Conform extends StatefulWidget {
  final uid;
  final ip;
  final res_id;
  const Order_Conform({Key key, this.uid, this.ip,this.res_id}) : super(key: key);

  @override
  _Order_ConformState createState() => _Order_ConformState();
}

class _Order_ConformState extends State<Order_Conform> {
  @override
  var restaurants_name;
  var restaurants_id;
  var name;
  var address;
  var product_price = 0.0;
  var packing = 0.0;
  var delivery = 0.0;
  var tax = 0.0;
  var total = 0.0;
  var promo = 0.0;
  void initState() {
    // TODO: implement initState
    store.collection('Add Cart').where('ip', '==', widget.ip).onSnapshot.listen((onData){
      setState(() {
        restaurants_name = onData.docs.last.data()['restaurants'];
      
      });
    });
    store.collection('Users').doc(widget.uid).onSnapshot.listen((data){
      setState(() {
        name = data.data()['name'];
        address = data.data()['address'];
      });
    });
    product_prices();
    super.initState();
  }

  void product_prices() {
    firestore().collection('Add Cart').where('ip', '==', widget.ip).onSnapshot.listen((onData){
      onData.forEach((callback){
        
         var onePointOne = double.parse(callback.data()['price']);
         var qun = callback.data()['quantity'];
         var sun = qun * onePointOne;
                 product_price =  sun + product_price;
      });
    });
   other_price();
  }

  void other_price(){
   
     firestore().collection('Restaurants').where('id', '==', widget.res_id).onSnapshot.listen((onData) {
        var onePointOne = double.parse(onData.docs.last.data()['packing_charge']);
                 packing =  onePointOne;
     var onePointOnes = double.parse(onData.docs.last.data()['delivery_charge']);
                 delivery =  onePointOnes;
     var onePointOness = double.parse(onData.docs.last.data()['tax_charge']);
                 tax =  onePointOness;
    total = packing + delivery + tax - promo + product_price; 
    });

   
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.white,
      appBar: AppBar(
        title: new Text("Your basket"),
        centerTitle: true,
        elevation: 0.0,
      ),
          body: new ListView(
          children: <Widget>[
            new Container(
              height: MediaQuery.of(context).size.height / 7.0,
              color: Colors.white,
              width: MediaQuery.of(context).size.width,
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Text(restaurants_name.toString(),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22.0),),
                  new Text("Estimited Delivery Time: 20-30 MINS"),

                ],
              )
            ),
            Dividers(),
            new ListTile(
              
              title: new Text(name.toString()),
              subtitle: new Text(address.toString()),
            ),
            Dividers(),
          new Container(
            color: Colors.white,
            height: 30.0,
            child: new Center(
              child: new Text("As Soon as Possible"),
            ),
          ),
          Dividers(),
            StreamBuilder(
              stream: firestore().collection('Add Cart').where('ip', '==', widget.ip).onSnapshot,
              builder: (context, snapshot) {
                if(!snapshot.hasData)
                      return Center(
                        child: CircularProgressIndicator()
                        );
                return new ListView.builder(
                  physics: ClampingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: snapshot.data.docs.length,
                  itemBuilder: (context,k){
                
                var dish = snapshot.data.docs[k].data();
                
                    return  new ListTile(
                      leading: new Text(dish['quantity'].toString()+'X'.toString(),style: TextStyle(color: Colors.greenAccent),),
                          title: new Text(dish['product_name'].toString()),
                          trailing: new Text(dish['price']),
                        );
                  },
                );
              }
            ),
            Dividers(),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 60.0,
                width: MediaQuery.of(context).size.width,
                child: new TextField(
                  style: TextStyle(color: Colors.grey[200]),
                  decoration: InputDecoration(
                    hintText: 'Add a Note',
                  ),
                ),
              ),
            ),
           
           Amount_detail(title: 'Subtotal',amount: product_price.toDouble(),),
            Amount_detail(title: 'Tax',amount: tax,),
             Amount_detail(title: 'Delivery fee',amount: delivery,),
              Amount_detail(title: 'Packing Fee',amount: packing,),
               Amount_detail(title: 'Promo Code',amount: promo,),
            new SizedBox(
              height: 10.0,
            ),
            Dividers(),
             Padding(
               padding: const EdgeInsets.all(8.0),
               child: Amount_detail(title: 'Total',amount: total,),
             ),
             Dividers(),
             InkWell(
               onTap: (){},
                 child: new Container(
                 padding: EdgeInsets.only(top: 8.0,bottom: 10.0,left: 20.0),
                 child: new Text("Add Promo Code", style: TextStyle(color: Colors.grey[200]),),
               ),
             ),
             Dividers(
               
             ),
             InkWell(
               onTap: (){
                              Alert(
        context: context,
        type: AlertType.error,
        title: "Order Complete",
        desc: "Order ID: 123456789",
        buttons: [
          DialogButton(
            child: Text(
              "Got it",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () => Navigator.pop(context),
            width: 120,
          )
        ],
      ).show();
               },
                 child: new Container(
                 padding: EdgeInsets.all(20.0),
                 color: Colors.green,
                 child: Center(child: new Text("Place Order", style: TextStyle(color: Colors.white),)),
               ),
             ),
          ],
        ),
    );
  }
}