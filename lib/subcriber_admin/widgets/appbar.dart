import 'package:flutter_web/material.dart';

class Appbar_Custom extends StatelessWidget {
  final title;
  final actions;

  const Appbar_Custom({this.title, this.actions});
  @override
  Widget build(BuildContext context) {
    return AppBar(
       elevation: 0.0,
        backgroundColor: Colors.black,
        title: new Text(title),
        actions: actions
    );
  }
}