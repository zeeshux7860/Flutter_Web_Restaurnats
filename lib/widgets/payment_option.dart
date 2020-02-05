import 'package:flutter_web/material.dart';

class Payment_Option extends StatefulWidget {
  @override
  _Payment_OptionState createState() => _Payment_OptionState();
}

class _Payment_OptionState extends State<Payment_Option> {
  @override
  Widget build(BuildContext context) {
    return ExpansionTile(

       leading: new CircleAvatar(
                    backgroundColor: Colors.white,
                    child: new Icon(Icons.credit_card,color: Colors.grey,),
                  ),
                  title: new Text("Payment Method"),
        children: <Widget>[
            ListView(
        physics:  ClampingScrollPhysics(),
        shrinkWrap: true,
        children: <Widget>[
           ListTile(
             onTap: (){},
            leading: CircleAvatar(
              backgroundColor: Colors.purple,
              child: Text("P",style: TextStyle(color: Colors.white),),
            ),
            title: Text("PhonePe"),
          ),
          ListTile(
             onTap: (){},
            leading: CircleAvatar(
              backgroundColor: Colors.blueAccent,
              child: Text("P",style: TextStyle(color: Colors.white),),
            ),
            title: Text("PayTM"),
          )
        ],
      ),
        ],
    );
    
  }
}