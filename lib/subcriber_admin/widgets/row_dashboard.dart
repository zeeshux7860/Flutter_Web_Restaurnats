import 'package:flutter_web/material.dart';

class Row_Dash extends StatelessWidget {
  final first;
  final second;

  const Row_Dash({this.first, this.second});
  @override
  Widget build(BuildContext context) {
    return new Row(
        children: <Widget>[
          new Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width / 5.0,
            color: Colors.white,
            child: first,
          ),
          new Container(
            width: MediaQuery.of(context).size.width *0.8,
            height: MediaQuery.of(context).size.height,
            child: second,
          )
        ],
      );
  }
}