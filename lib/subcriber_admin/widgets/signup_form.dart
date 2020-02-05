import 'package:flutter_web/material.dart';

class Signup_Form extends StatefulWidget {
  final controller;
  final  lablename;

  const Signup_Form({Key key, this.controller, this.lablename}) : super(key: key);
  
  @override
  _Signup_FormState createState() => _Signup_FormState();
}

class _Signup_FormState extends State<Signup_Form> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
                    decoration: InputDecoration(
                        labelText: widget.lablename,
                        labelStyle: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                        // hintText: 'EMAIL',
                        // hintStyle: ,
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.pink))),
                  );
                 
  }
}