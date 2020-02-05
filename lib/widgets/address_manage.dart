import 'package:flutter_web/material.dart';

class Manage_address extends StatefulWidget {
  @override
  _Manage_addressState createState() => _Manage_addressState();
}

class _Manage_addressState extends State<Manage_address> {
  @override
  Widget build(BuildContext context) {
    return     new ExpansionTile(
                  leading: new CircleAvatar(
                    backgroundColor: Colors.white,
                    child: new Icon(Icons.home,color: Colors.grey,),
                  ),
                  title: new Text("Manage Address"),
                  children: <Widget>[
                    new Divider(),
                    new Container(
                      width: MediaQuery.of(context).size.width,
                      color: Colors.grey[200],
                      padding: EdgeInsets.all(10.0),
                      child: new Text("Saved Address"),
                    ),
                   
                    new ListView.builder(
                      shrinkWrap: true,
                      physics: ClampingScrollPhysics(),
                      itemCount: 2,
                      itemBuilder: (context,k){
                        return  Column(
                          children: <Widget>[
                            new ListTile(
                      leading: new CircleAvatar(
                            child: new Icon(Icons.location_on,size: 22.0,),
                            backgroundColor: Colors.white,
                      ),
                      title: Padding(
                            padding: EdgeInsets.only(top: 10.0),
                            child: Text("Other"),
                      ),
                      subtitle: new Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Text("kolkata kolkata kolkata"),
                              new SizedBox(
                                height: 3.0,
                              ),
                              new Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  new FlatButton(
                                    child: new Text("Edit",style: TextStyle(color: Colors.orangeAccent),),
                                    onPressed: (){

                                    },
                                  ),
                                  
                                  new FlatButton(
                                    child: new Text("Delete",style: TextStyle(color: Colors.orangeAccent),),
                                    onPressed: (){

                                    },
                                  ),
                                ],
                              )
                            ],
                      ),
                    ),
                    new Container(
                      height: 2.0,
                      color: Colors.grey[200],
                    )
                          ],
                        );
                      },
                    ),
                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: new OutlineButton.icon(
                        padding: EdgeInsets.only(left: 20.0,right: 20.0),
                        color: Colors.white,
                        icon: Icon(Icons.add_location,size: 15.0,color: Colors.lightBlue,),
                        label: new Text("Add New Address",style: TextStyle(color: Colors.lightBlue),),
                        onPressed: (){},
                        shape: StadiumBorder(),
                        borderSide: BorderSide(color: Colors.lightBlue),
                        
                      ),
                    )
                  ],
                );
  }
}