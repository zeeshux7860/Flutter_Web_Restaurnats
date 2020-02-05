import 'package:flutter_web/material.dart';

class Notifications extends StatefulWidget {
  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text("Notification"),
        elevation: 1.0,
      ),
      body: new ListView.builder(
        itemCount: 10,
        itemBuilder: (context,k){
          return new Column(
            children: <Widget>[
              new ListTile(
                title: new Text("Order Complete (Chinese)"),
                subtitle: Text("Order No: 1234567890 "),
                trailing: Text("12:20 PM"),
                onTap: (){},
              ),
              new Container(
                width: MediaQuery.of(context).size.width,
                height: 1.0,
                color: Colors.grey[200],
              )
            ],
          );
        },
      ),
    );
  }
}