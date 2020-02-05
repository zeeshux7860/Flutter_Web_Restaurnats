import 'dart:convert';
import 'dart:html';
import 'package:firebase_web/firebase.dart';
import 'package:flutter_web/material.dart';
import 'package:resturant/widgets/conform_order.dart';
import 'package:resturant/widgets/page_transation.dart';
import 'package:resturant/widgets/rflutter_alert.dart';
import 'package:biscuits/biscuits.dart';
import 'package:http/http.dart' as http;
class Second_page extends StatefulWidget {
  final uid;

  const Second_page({Key key, this.uid}) : super(key: key);
  @override
  _Second_pageState createState() => _Second_pageState();
}

class _Second_pageState extends State<Second_page> {
  var ip;
  var uids;
  var cookies = Cookies();
  var res_id;
  @override
  void initState() {
    // TODO: implement initState
    gets();
    get_uid();
        super.initState();
      }
      void gets() async{
         var res =  await http.get('https://api.ipify.org?format=json');
        var  data =  json.decode(res.body);
        
        setState(() {
          ip = data['ip'];
        });
      }
      final GlobalKey<ScaffoldState> _scaf  = new GlobalKey<ScaffoldState>();
      @override
      Widget build(BuildContext context) {
        return new Scaffold(
          key: _scaf,
          backgroundColor: Colors.white,
          appBar: new AppBar(
            title: new Text("Cart List"),
            elevation: 0.0,
            backgroundColor: Colors.white,
          ),
          body: new Column(
            children: <Widget>[
              Flexible(
                  child: StreamBuilder(
                    stream: firestore().collection('Add Cart').where('ip', '==', ip).onSnapshot,
                    builder: (context, snapshot) {
                      if(!snapshot.hasData)
                      return Center(
                        child: CircularProgressIndicator()
                        );
                       
                      return  ListView.builder(
              itemCount: snapshot.data.docs.length,
              itemBuilder: (context,k){
                 
                var dish = snapshot.data.docs[k].data();
   res_id = snapshot.data.docs.last.data()['restaurants_id'];
                return new Column(
                      children: <Widget>[
                        new ListTile(
                          title: new Text(dish['product_name'].toString()),
                          subtitle: new Text(dish['restaurants'].toString()),
                          trailing: new Container(
                            width: MediaQuery.of(context).size.width / 3.8,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10.0,),
                              border: Border.all(color: Colors.lightGreen,width: 2.0,),
                            ),
                            child: new Row(children: <Widget>[
                             InkWell(
                               onTap: (){
                                 
                              
                               firestore().collection("Add Cart").doc(snapshot.data.docs[k].id).update(
                                 data: {'quantity' : dish['quantity'] + 1});
                               },
                                 child: new Container(
                                 width: MediaQuery.of(context).size.width / 9.0,
                                 height: MediaQuery.of(context).size.height / 9.0,
                                 child: new Icon(Icons.add,color: Colors.green,),
                               ),
                             ),
                             new Text(dish['quantity'].toString()),
    
                             InkWell(
                              onTap: (){
                                 if(dish['quantity'] == 1){
                                   var plus = snapshot.data.docs[k].id;
                               firestore().collection("Add Cart").doc(plus).delete();
                                 }else{}
                               var plus = snapshot.data.docs[k].id;
                               firestore().collection("Add Cart").doc(plus).update(
                                 data: { 'quantity' : dish['quantity'] - 1 }
                               );
                               },
                                    child: new Container(
                                 width: MediaQuery.of(context).size.width / 9.0,
                                 height: MediaQuery.of(context).size.height / 9.0,
                                 child: new Icon(Icons.remove,color: Colors.green,),
                               ),
                             ),
                            ],),
                          ),
                        )
                      ],
                );
              },
            );
                    }
                  ),
          ),
          
          new  InkWell(
            onTap: (){
             Navigator.push(context, new PageTransition(type: PageTransitionType.fade,child: Order_Conform(uid: uids,ip: ip,res_id:res_id)));
            },
            child: Container(
            width: MediaQuery.of(context).size.width,
            height: 50.0,
            decoration: BoxDecoration(
             // borderRadius: BorderRadius.only(topLeft: Radius.circular(20.0),topRight: Radius.circular(20.0)),
              // Box decoration takes a gradient
            gradient: LinearGradient(
              // Where the linear gradient begins and ends
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              // Add one stop for each color. Stops should increase from 0 to 1
              tileMode: TileMode.mirror,
              colors: [
                // Colors are easy thanks to Flutter's Colors class.
                Colors.pink,
                Colors.pinkAccent,
                
              ],
            ),
            ),
            child: Center(child: new Text("Conform",style: TextStyle(color: Colors.white, fontSize: 22.0,)))
          ),
          )
            ],
          )
        );
      }
    
      firebase() {}
    
      void get_uid() {
       var uid =  cookies.get('uid_users');
       setState(() {
        uids = uid;
       });
       
      }
}