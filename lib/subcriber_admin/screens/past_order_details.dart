import 'package:flutter_web/material.dart';
import 'package:resturant/subcriber_admin/widgets/appbar.dart';
import 'package:resturant/widgets/amount.dart';
import 'package:resturant/widgets/dividers.dart';

class Past_order_details extends StatefulWidget {
  @override
  _Past_order_detailsState createState() => _Past_order_detailsState();
}

class _Past_order_detailsState extends State<Past_order_details> {
  @override
  Widget build(BuildContext context) {
    return new 
      
     ListView.builder(
        itemCount: 10,
        itemBuilder: (context,k)=>
          new Container(
            margin: EdgeInsets.all(30.0),
            
            child: new Card(
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                     new Padding(
                             padding: EdgeInsets.all(20.0),
                             child: new Text("Order ID: 1234567890",style:TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20.00,),textAlign: TextAlign.start,),
                           ),
                            new Dividers(),
                           new ListTile(
                             title: new Text("Zeeshan"),
                             subtitle: new Text("kolkata"),
                            
                  ),
                  new Dividers(),
                  new Image.asset('assets/food2.jpeg',
                  height: MediaQuery.of(context).size.height / 3.0,
                  width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,),
                  new Dividers(),
                   new ListView.builder(
               itemCount: 3,
               shrinkWrap: true,
               physics: ClampingScrollPhysics(),
               itemBuilder: (context,k)=>
                new ListTile(
                                  leading: new Text("1X",style: TextStyle(color: Colors.greenAccent),),
                      title: new Text("Pizza"),
                      trailing: new Text("399.00"),
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
            
                    new Container(
                      height: 50.0,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        
             //  borderRadius: BorderRadius.only(topLeft: Radius.circular(10.0),topRight: Radius.circular(10.0)),
                    color: Colors.black
                      ),
                 child:  InkWell(
               onTap: (){},
               
             //  borderRadius: BorderRadius.only(topLeft: Radius.circular(10.0),topRight: Radius.circular(10.0)),
                    
                                     child: new Center(
                     child: new Text("Print Invoice",style: TextStyle(color: Colors.white),),
                   ),
                 ),
//shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(20.0),topRight: Radius.circular(20.0))),
               ),
              
             
                ],
              ),
            )
          )
        
    
    );
  }
}