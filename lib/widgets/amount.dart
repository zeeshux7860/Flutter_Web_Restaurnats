import 'package:flutter_web/material.dart';


class Amount_detail extends StatelessWidget {
  final  title;
  final amount;
  
  

   Amount_detail({ this.title,  this.amount});
   @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0,right: 20.0,bottom: 2.0),
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: <Widget>[
                 new Text(title),
                 new Text('$amount.00'),

               ],
             ),
    );
  }
}