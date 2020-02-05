import 'package:flutter_web/material.dart';

class SeeallButton extends StatefulWidget {
  SeeallButton({this.name,this.route_page_name});
  final name;
  final route_page_name;
  @override
  _SeeallButtonState createState() => _SeeallButtonState();
}

class _SeeallButtonState extends State<SeeallButton> {
  
  @override
  Widget build(BuildContext context) {
    return FlatButton(
                  child: Text(
                    widget.name,
                    style: TextStyle(
//                      fontSize: 22,
//                      fontWeight: FontWeight.w800,
                      color: Theme.of(context).accentColor,
                    ),
                  ),
                  onPressed: (){
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (BuildContext context){
                          return widget.route_page_name;
                        },
                      ),
                    );
                  },
                );
  }
}