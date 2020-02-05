import 'package:flutter_web/material.dart';

class Product_form extends StatelessWidget {
  final title;
  final filed;

  const Product_form({this.title, this.filed});
  @override
  Widget build(BuildContext context) {
    return Padding(
           padding: const EdgeInsets.all(8.0),
           child: new Row(
             children: <Widget>[
               new Container(
                 width: 200.0,
                 padding: EdgeInsets.all(15.0),
                 child: new Text(title,style: TextStyle(fontSize: 20.0),),
               ),
               new Container(
                 padding: EdgeInsets.all(10.0),
                 width: 400.0,
                 child: filed
               ),
               
             ],
           ),
         );
  }
}