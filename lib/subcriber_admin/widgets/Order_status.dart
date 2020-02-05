import 'package:flutter_web/material.dart';
import 'package:resturant/widgets/amount.dart';
import 'package:resturant/widgets/dividers.dart';

class Order_Status extends StatefulWidget {
  final order_id;
  final name;
  final address;

  const Order_Status({ this.order_id, this.name, this.address});

  @override
  _Order_StatusState createState() => _Order_StatusState();
}

class _Order_StatusState extends State<Order_Status> {
  @override
  Widget build(BuildContext context) {
    return  new Container(
              
                       child: new Column(
                         mainAxisAlignment: MainAxisAlignment.start,
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: <Widget>[
                          Flexible(
                            child: new Column(
                               mainAxisAlignment: MainAxisAlignment.start,
                         crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                 new Padding(
                             padding: EdgeInsets.all(20.0),
                             child: new Text("Order ID: "+ widget.order_id.toString() ,style:TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20.00,),textAlign: TextAlign.start,),
                           ),
                           new Dividers(),
                           new ListTile(
                             title: new Text(widget.name),
                             subtitle: new Text(widget.address),
                             onTap: (){},
                           ),
                           new Dividers(),

                           new Padding(
                             padding: EdgeInsets.all(10.0),
                             child: new ListView.builder(
                               shrinkWrap: true,
                               physics: ClampingScrollPhysics(),
                               itemCount: 4,
                               itemBuilder: (context,k)=>
                               new ListTile(
                                  leading: new Text("1X",style: TextStyle(color: Colors.greenAccent),),
                      title: new Text("Pizza"),
                      trailing: new Text("399.00"),
                               ),
                               
                             ),
                           ),
                           new Dividers(),
                       new Padding(
                         padding: EdgeInsets.all(20.0),
                         child: new Column(
                           children: <Widget>[
                                 Amount_detail(title: 'Subtotal',amount: '120.00',),
            Amount_detail(title: 'Tax',amount: '5.00',),
             Amount_detail(title: 'Delivery fee',amount: '10.00',),
              Amount_detail(title: 'Packing Fee',amount: '10.50',),
               Amount_detail(title: 'Promo Code',amount: '0.00',),
                           ],
                         ),
                       ),
            new SizedBox(
              height: 10.0,
            ),
            Dividers(),
             Padding(
               padding: const EdgeInsets.all(8.0),
               child: Amount_detail(title: 'Total',amount: '145.00',),
             ),
                              ],
                            ),
                          ),
                          new Dividers(),
                          Padding(
                            padding: EdgeInsets.all(20.0),
                            child: new Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: <Widget>[
                                 new FlatButton(
                                  child: new Text("View",style: TextStyle(color: Colors.white),),
                                  color: Colors.blue,
                                  onPressed: (){},
                                ),
                                new SizedBox(
                                  width: 20.0,
                                ),
                                new FlatButton(
                                  child: new Text("Reject",style: TextStyle(color: Colors.white),),
                                  color: Colors.red,
                                  onPressed: (){},
                                ),
                                new SizedBox(
                                  width: 20.0,
                                ),
                                new FlatButton(
                                  child: new Text("Accept",style: TextStyle(color: Colors.white),),
                                  color: Colors.green,
                                  onPressed: (){},
                                )
                              ],
                            ),
                          )
                         ],
                       )
                 
              );
  }
}