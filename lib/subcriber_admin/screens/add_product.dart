import 'package:flutter_web/material.dart';
import 'package:resturant/subcriber_admin/screens/Add_dish.dart';
import 'package:resturant/subcriber_admin/widgets/drawerlist.dart';
import 'package:resturant/subcriber_admin/widgets/row_dashboard.dart';
import 'package:firebase_web/firestore.dart';
import 'package:firebase_web/firebase.dart';
class Add_product extends StatefulWidget {
  final uid;
  final restaurants_name;

  const Add_product({Key key, this.uid, this.restaurants_name}) : super(key: key);
  @override
  _Add_productState createState() => _Add_productState();
}

class _Add_productState extends State<Add_product> {
  @override
  void initState() {
    // TODO: implement initState
    a();
    super.initState();
  }
  
  void a(){
    
  
  
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text("Add Product"),
        backgroundColor: Colors.black,
        elevation: 0.0,
      ),
      body: Row_Dash(
        first: Drawer_list(
          uids: widget.uid,
        ),
        second: Add_dish(
          uid: widget.uid,
          restaurants_name: widget.restaurants_name
        ),
      ),
    );
  }
}