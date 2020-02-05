import 'package:flutter_web/material.dart';

class DashBoard_card extends StatefulWidget {
  final title;
  final value;
  final color;
  final icon;

  const DashBoard_card({ this.title, this.value, this.color, this.icon});
  @override
  _DashBoard_cardState createState() => _DashBoard_cardState();
}

class _DashBoard_cardState extends State<DashBoard_card> {
  @override
  Widget build(BuildContext context) {
    return   new Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0)
                  ),
                  height: MediaQuery.of(context).size.height / 4.8,
                  width: MediaQuery.of(context).size.width / 6.0,
                  child: new Card(
                    shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(5.0)),
                    child: Column(
                      children: <Widget>[
                        new SizedBox(
                          height: 10.0,
                        ),
                        new ListTile(
                          title: new Text(widget.title,style: TextStyle(color: Colors.grey),),
                          subtitle: new Text(widget.value,style: TextStyle(color: Colors.black,fontSize: 25.0),),
                          trailing: new CircleAvatar(
                            radius: 30.0,
                            backgroundColor: widget.color,
                            child: Icon(widget.icon,color: Colors.white,),
                          ),
                        ),
                        new SizedBox(
                          height: 10.0,
                        ),
                        new Row(
                          children: <Widget>[
                            new SizedBox(
                              width: 10.0,
                            ),
                            new Text("Just a moment",style: TextStyle(color: Colors.grey[300]),)
                          ],
                        )
                      ],
                    )
                  ),
                );
  }
}