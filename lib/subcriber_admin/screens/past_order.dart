import 'package:flutter_web/material.dart';
import 'package:resturant/subcriber_admin/screens/past_order_details.dart';
import 'package:resturant/subcriber_admin/widgets/drawerlist.dart';

class Past_Order extends StatefulWidget {
  @override
  _Past_OrderState createState() => _Past_OrderState();
}

class _Past_OrderState extends State<Past_Order> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text("Past Order"),
         elevation: 0.0,
        backgroundColor: Colors.black,
      ),
      body: new Row(
        children: <Widget>[
          new Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width / 5.0,
            color: Colors.white,
            child: new Drawer_list(),
          ),
          new Container(
            width: MediaQuery.of(context).size.width *0.8,
            height: MediaQuery.of(context).size.height,
            child: Past_order_details(),
          )
        ],
      )
    );
  }
}