import 'dart:html';
import 'package:flutter_web/material.dart';
import 'package:resturant/subcriber_admin/screens/main_screen.dart';
import 'package:resturant/subcriber_admin/widgets/drawerlist.dart';

class Admin_Home extends StatefulWidget {
  final uid;

  const Admin_Home({Key key, this.uid}) : super(key: key);

  @override
  _Admin_HomeState createState() => _Admin_HomeState();
}

class _Admin_HomeState extends State<Admin_Home> {
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.black,
        title: new Text("TIFFINSZ"),
        actions: <Widget>[
          new IconButton(
            onPressed: (){},
            icon: Icon(Icons.settings),
          )
        ],
      ),
      drawer: new Drawer(
      child:   Drawer_list(
        uids: widget.uid,
      ),
      ),
      body: new Row(
        children: <Widget>[
          new Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width / 5.0,
            color: Colors.white,
            child: new Drawer_list(uids: widget.uid),
          ),
          new Container(
            width: MediaQuery.of(context).size.width *0.8,
            height: MediaQuery.of(context).size.height,
            child: Main_screen(),
          )
        ],
      )
    );
  }
}
