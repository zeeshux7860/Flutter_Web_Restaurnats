import 'dart:convert';
import 'dart:html';
import 'package:flutter_web/material.dart';
import 'package:resturant/widgets/edge_alert.dart';
import 'package:resturant/widgets/sellallbuton.dart';
import 'package:firebase_web/firebase.dart';
import 'package:http/http.dart' as http;
class LIst_Dish extends StatefulWidget {
  LIst_Dish({this.title,this.img,this.zone,this.id,this.heroid});
  final img;
  final title;
  final zone;
  final id;
  final heroid;
  @override
  _LIst_DishState createState() => _LIst_DishState();
}

class _LIst_DishState extends State<LIst_Dish> {
  @override
  void initState() {
    // TODO: implement initState
  gets();
    super.initState();
  }
var ip;
  void gets() async{
     var res =  await http.get('https://api.ipify.org?format=json');
    var  data =  json.decode(res.body);
    
    setState(() {
      ip = data['ip'];
    });
  }

  
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: NestedScrollView(
       headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled){
         return <Widget>[
            SliverAppBar(
              
              forceElevated: innerBoxIsScrolled,
              elevation: 0.0,
              leading: new BackButton(
                color: Colors.white,
              ),
              actions: <Widget>[
                IconButton(
                  icon: Icon(Icons.favorite_border),
                  onPressed: (){},
                  color: Colors.white,
                ),
                IconButton(
                  icon: Icon(Icons.bookmark_border),
                  onPressed: (){},
                  color: Colors.white,
                )

              ],
              backgroundColor:Colors.pink,
                expandedHeight: 300.0,
                floating: false,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  background: Hero(
                    tag: 'heroid'+widget.heroid.toString(),
                         child: new Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: new NetworkImage(widget.img),
                          fit: BoxFit.cover
                        )
                      ),
                    ),
                  ),
                  title:
                      new Text(widget.title,style: TextStyle(color: Colors.white),),
                ),
            )
         ];
       } ,
       body:   ListView(
                children: <Widget>[
                   new Container(
                     color: Colors.white,
                     child: new Column(
                       children: <Widget>[
                         new ListTile(
                           title: new Text("Nonsense fast food",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22.0),),
                           subtitle: new Text("Fast Food, Chinese"),
                           trailing: new CircleAvatar(
                             child: new Text("4.5",style: TextStyle(color: Colors.white),),
                             backgroundColor: Colors.lightGreen,
                           ),
                         ),
                         new ListTile(
                           title: new Text("Howard",),
                           subtitle: new Text("Delivery with in 20-30 min",style: TextStyle(color: Colors.orange),),
                           trailing: new Text("Unavailable",style: TextStyle(color: Colors.red)),
                         ),
                       ],
  
                     )
  
                   ),
    StreamBuilder(
    stream: firestore().collection('Selected category').where('uid', '==', widget.id).onSnapshot,
    builder: (context, snapshot) {
    if(!snapshot.hasData)
       return Center(
      child: CircularProgressIndicator(),
     );
    return ListView.builder(
       physics: ClampingScrollPhysics(),
     shrinkWrap: true,
       itemCount: snapshot.data.docs.length,
        itemBuilder: (context,k)=>
       new Container(
        padding: EdgeInsets.all(10.0),
       margin: EdgeInsets.all(5.0),
  
                     decoration: BoxDecoration(
  
                       color: Colors.white,
  
                       borderRadius: BorderRadius.circular(20.0)
  
                     ),
  
                     child: new Column(
  
                     children: <Widget>[
  
                       new Padding(
                         padding: EdgeInsets.only(left: 20.0),
                       child: new Text(snapshot.data.docs[k].data()['category_name'],style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22.0),),
                       ),
                       new Divider( ),
  
                       StreamBuilder(
                         stream: firestore().collection('DishList').where('restaurants_id', '==', widget.id).where('category', '==', snapshot.data.docs[k].data()['category_name']).onSnapshot,
                         builder: (context, snapshots) {
                           if(!snapshots.hasData)
       return Center(
      child: CircularProgressIndicator(),
     );
                           return new ListView.builder(
                             itemCount: snapshots.data.docs.length,
                             shrinkWrap: true,
                             physics: ClampingScrollPhysics(),
                             itemBuilder: (context,l)=>
                             ListTile(
                               leading: Image.network(snapshots.data.docs[l].data()['base64'],
                        
                        fit: BoxFit.cover,),
                              title: Padding(
                                padding: const EdgeInsets.only(top: 10.0),
                                child: Text(snapshots.data.docs[l].data()['name'],
                             ),
                              ),
                             subtitle: new Column(
                               mainAxisAlignment: MainAxisAlignment.start,
                               crossAxisAlignment: CrossAxisAlignment.start,
                               children: <Widget>[
                                  Padding(
                               padding: const EdgeInsets.only(top:7.0),
                               child: Text(snapshots.data.docs[l].data()['desc']),
                             ),
                             Padding(
                               padding: const EdgeInsets.only(top:7.0),
                               child: Text("Rating :"+snapshots.data.docs[l].data()['product_rate']),
                             ),
                             Padding(
                                padding: const EdgeInsets.only(top:7.0),
                               child: Text("RS :"+snapshots.data.docs[l].data()['price']),
                             ),
                               ],
                             ),
                             trailing:              new FlatButton(
  
                    child: new Text("Add Cart",style: TextStyle(color: Colors.white),),
  
                    onPressed: (){
                      firestore().collection('Add Cart').where('ip', '==', ip).where('product_id', '==', snapshots.data.docs[l].data()['id']).get().then((onValue){
                        if(onValue.docs.length == 0){
                              firestore().collection('Add Cart').add({
                         'ip' : ip,
                         'restaurants_id' : snapshots.data.docs[l].data()['restaurants_id'],
                         'product_name' : snapshots.data.docs[l].data()['name'],
                         'restaurants' : snapshots.data.docs[l].data()['restaurants'],
                         'product_id' : snapshots.data.docs[l].data()['id'],
                         'quantity' : 1,
                         'price' :  snapshots.data.docs[l].data()['price'],
                         'total' : snapshots.data.docs[l].data()['price']
                      }).then((onValue){
                        EdgeAlert.show(context,
  
                title: 'Add Cart',
  
                description: snapshots.data.docs[l].data()['name'],
  
                gravity: EdgeAlert.TOP,
  
                backgroundColor: Colors.red);
                      });
                        }else{
                         EdgeAlert.show(context,
  
                title: 'Already Cart',
  
                description: snapshots.data.docs[l].data()['name'],
  
                gravity: EdgeAlert.TOP,
  
                backgroundColor: Colors.red); 
                        }
                      });
                   
                      
  
                    },
  
                    color: Colors.black,
  
                    shape: new RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
  
                    ),
                             )

                           /*    new Column(
                     children: <Widget>[
                       Row(
                         children: <Widget>[
                           
                        Container(
                      width: 120.0,
                      child:  Card(
                       child: Image.network(snapshots.data.docs[l].data()['base64'],
                        height: 80.0,
                        fit: BoxFit.cover,),
                      ),
                    ),
                           
                           Container(
                             width: MediaQuery.of(context).size.width / 1.5,
                             child: Column(
                               crossAxisAlignment: CrossAxisAlignment.start,
                               children: <Widget>[
                                 
                             
                             Row(
                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                               children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(top: 0.0,left: 10.0),
                                    child: Text(snapshots.data.docs[l].data()['name'],
                                    style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18.0),),
                                  ),
                                 new FlatButton(
  
                    child: new Text("Add Cart",style: TextStyle(color: Colors.white),),
  
                    onPressed: (){
                      firestore().collection('Add Cart').where('ip', '==', ip).where('restaurants_id', '==', snapshots.data.docs[l].data()['id']).get().then((onValue){
                        if(onValue.docs.length == 0){
                              firestore().collection('Add Cart').add({
                         'ip' : ip,
                         'restaurants_id' : snapshots.data.docs[l].data()['id'],
                         'product_name' : snapshots.data.docs[l].data()['name'],
                         'restaurants' : snapshots.data.docs[l].data()['restaurants'],
                         'product_id' : DateTime.now().millisecondsSinceEpoch,
                         'quantity' : 1
                      }).then((onValue){
                        EdgeAlert.show(context,
  
                title: 'Add Cart',
  
                description: snapshots.data.docs[l].data()['name'],
  
                gravity: EdgeAlert.TOP,
  
                backgroundColor: Colors.red);
                      });
                        }else{
                         EdgeAlert.show(context,
  
                title: 'Already Cart',
  
                description: snapshots.data.docs[l].data()['name'],
  
                gravity: EdgeAlert.TOP,
  
                backgroundColor: Colors.red); 
                        }
                      });
                   
                      
  
                    },
  
                    color: Colors.black,
  
                    shape: new RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
  
                    )
                               ],
                             ),
                             Padding(
                               padding: const EdgeInsets.only(left:10.0),
                               child: Text(snapshots.data.docs[l].data()['desc']),
                             ),
                             Padding(
                               padding: const EdgeInsets.all(10.0),
                               child: Text("Rating :"+snapshots.data.docs[l].data()['product_rate']),
                             ),
                             Padding(
                                padding: const EdgeInsets.only(left:10.0,bottom: 10.0),
                               child: Text("RS :"+snapshots.data.docs[l].data()['price']),
                             ),
                               ],
                             ),
                           )
                         ],
                       ),
                       
  
                   new Container(
  
                     height: 1.0,
  
                     color: Colors.grey[200],
  
                     width: MediaQuery.of(context).size.width,
  
                   )
  
                     ],
  
                               )*/
  
                 
  
                           );
                         }
                       )
  
                     ],
  
                   ),
  
                   )
  
                   
  
                 
  
               );
  
             }
  
           ),
],
       )
      ),
    );
  }
}