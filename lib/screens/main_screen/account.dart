import 'package:flutter_web/material.dart';
import 'package:resturant/widgets/address_manage.dart';
import 'package:resturant/widgets/payment_option.dart';

class Account extends StatefulWidget {
  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: new Text("Howrah"),
        elevation: 1.0,
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.edit_location,size: 15.0,),
            label: new Text("Chnage",style: TextStyle(color: Colors.orange),),
            onPressed: (){},
          )
        ],
      ),
      body: new ListView(
        children: <Widget>[
          new Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  blurRadius: 5.0,
                  color: Colors.black
                )
              ],
              color: Colors.pink,
            ),
            height: MediaQuery.of(context).size.height / 3.0,
            width: MediaQuery.of(context).size.width,
            
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 50.0,
                ),
                new SizedBox(
                  height: 20.0,
                ),
                new Text("Zeeshan",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 22.0),)
              ],
            )
          ),
          new Container(
            color: Colors.white,
            child: new Column(
              children: <Widget>[
            Manage_address(),
            Payment_Option(),
              ],
            ),
          )
        ],
      ),
    );
  }
}