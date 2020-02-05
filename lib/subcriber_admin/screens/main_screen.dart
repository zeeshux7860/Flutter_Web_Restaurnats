import 'package:flutter_web/material.dart';
import 'package:resturant/subcriber_admin/module/query.dart';
import 'package:resturant/subcriber_admin/widgets/dashboard_card.dart';
import 'package:resturant/widgets/amount.dart';
import 'package:resturant/widgets/dividers.dart';

class Main_screen extends StatefulWidget {
  final uid;

  const Main_screen({Key key, this.uid}) : super(key: key);
  @override
  _Main_screenState createState() => _Main_screenState();
}

class _Main_screenState extends State<Main_screen> {
  var  option = false;
  @override
  void initState() {
    // TODO: implement initState
     store.collection('Restaurants').where('id', '==', widget.uid).onSnapshot.listen((onValue){
                 onValue.forEach((callback){
                  setState(() {
                  option =   callback.data()['condition'];
                  });
                 });
               });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return new ListView(
        
        children: <Widget>[
          new Container(
            padding: EdgeInsets.all(20.0),
            height: MediaQuery.of(context).size.height / 1.8,
            width: MediaQuery.of(context).size.width,
           decoration: BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment(0.8, 0.0), // 10% of the width, so there are ten blinds.
      colors: [const Color(0xFF485563), const Color(0xFF29323c)], // whitish to gray
      tileMode: TileMode.repeated, // repeats the gradient over the canvas
    ),
  ),
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                DashBoard_card(
                  title: 'Product',
                  value: '3500.0',
                  color: Colors.pink,
                  icon: Icons.table_chart,
                ),
                 DashBoard_card(
                  title: 'Vistor',
                  value: '9850',
                  color: Colors.orange,
                  icon: Icons.show_chart,
                ),
              
                 DashBoard_card(
                  title: 'Order',
                  value: '50',
                  color: Colors.purple,
                  icon: Icons.shopping_basket,
                ),
              
                 DashBoard_card(
                  title: 'Earn',
                  value: '3500.0',
                  color: Colors.green,
                  icon: Icons.account_balance_wallet,
                ),
              
                
                
                
              ],
            ),
          ),
          new Dividers(),
          new ListTile(
            title: new Text("Current Status"),
            trailing: new Switch(
             onChanged: (val){
              option = val;
               store.collection('Restaurants').where('id', '==', widget.uid).onSnapshot.listen((onValue){
                 onValue.forEach((callback){
                   store.collection('Restaurants').doc(callback.id).set({
                     'condition' : val
                   });
                 });
               });
             },
             
             value: option,
             activeColor: Colors.green,
             inactiveThumbColor: Colors.red,
           ),
          ),
          new Padding(
            padding: EdgeInsets.all(15.0),
            child: new Text("Order Status",style: TextStyle(color: Colors.grey[200]),),
          ),
          new  Dividers(),
          new Padding(
            padding: EdgeInsets.all(20.0),
            child: new ListView.builder(
              itemCount: 4,
              physics: ClampingScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context,k)=>
              new Container(
                height: MediaQuery.of(context).size.height  / 1.5,
                width: MediaQuery.of(context).size.width,
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
                                  onPressed: (){
                                    showDialog(
   context: context,
   barrierDismissible: true,
   builder: (BuildContext context) {
   return AlertDialog(
       title: Text('Order Products'),
       content: setupAlertDialoadContainer(),
       actions: <Widget>[
           new FlatButton(
             padding: EdgeInsets.all(10.0),
              child: new Text("Reject",style: TextStyle(color: Colors.white,fontSize: 18.0),),
               color: Colors.red,
              onPressed: (){},
                                ),
                                
                                new FlatButton(
                                  padding: EdgeInsets.all(10.0),
                                  child: new Text("Accept",style: TextStyle(color: Colors.white,fontSize: 18.0),),
                                  color: Colors.green,
                                  onPressed: (){},
                                )
       ],
   );
  }
);
                                  },
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
                  ),
                ),
              )
            ),
          )
        ],
      );
      
  }
  Widget setupAlertDialoadContainer() {
    return Container(
      height: MediaQuery.of(context).size.height / 1.0, // Change as per your requirement
      width: MediaQuery.of(context).size.width / 1.0, // Change as per your requirement
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 5,
        itemBuilder: (BuildContext context, int index) {
          return   new ListTile(
                                  leading: new Text("1X",style: TextStyle(color: Colors.greenAccent),),
                      title: new Text("Pizza"),
                      trailing: new Text("399.00"),
                               );
        },
      ),
    );
  }
}
