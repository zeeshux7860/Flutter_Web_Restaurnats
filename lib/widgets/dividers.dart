import 'package:flutter_web/material.dart';

class Dividers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
              height: 1.0,
              width: MediaQuery.of(context).size.width,
              color: Colors.grey[200],
            );
  }
}