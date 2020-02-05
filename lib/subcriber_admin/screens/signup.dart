import 'dart:async';
import 'dart:html';

import 'package:flutter_web/material.dart';
import 'package:resturant/subcriber_admin/module/query.dart';
import 'package:resturant/subcriber_admin/widgets/form.dart';
import 'package:resturant/subcriber_admin/widgets/signup_form.dart';
import 'package:firebase_web/firebase.dart';
class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  TextEditingController _name = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _ownername = TextEditingController();
  TextEditingController _phonenumber = TextEditingController();
  TextEditingController _address = TextEditingController();
  TextEditingController _area = TextEditingController();
  
  String text = '';
  var onesec =  Duration(seconds: 2);
 

void get_file() {
text == '';
/* Timer.periodic(onesec, (Timer t){
if(text.isEmpty){
  var base64url =  document.querySelector("p").text;
         setState(() {
           text = base64url;
         });
}else{
  t.cancel();
}
 });*/
 InputElement upload = FileUploadInputElement();
 upload.click();

upload.onChange.listen((e) async{
e.preventDefault();
   var file = (e.target as FileUploadInputElement).files[0];
   var customMetadata = {"location": "Prague", "owner": "You"};
   var uploadTask = storage().ref(file.name).put(file,
   UploadMetadata(
     contentType: file.type, customMetadata: customMetadata
   )
   );
var snapshot = await uploadTask.future;
        var filePath = await snapshot.ref.getDownloadURL();
        setState(() {
          text = filePath.toString();
        });
});


 //document.getElementById('#file').click();
      /*  var base64url =  document.querySelector("p").text;
         setState(() {
           text = base64url;
         });
     
   /*    ar onle  = querySelector("#imageval").nodeValue;
        window.console.log(onle);*/
        setState(() {
          
        });*/
}
final GlobalKey<ScaffoldState> _scaf =  GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      floatingActionButton: text == '' ? null : FloatingActionButton(
        onPressed: (){
          setState(() {
           text = ''; 
          });
        },
        child: Icon(Icons.close),
      ),
      key: _scaf,
        resizeToAvoidBottomPadding: false,
        body: ListView(
        
        children: <Widget>[
          Container(
            child: Stack(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(15.0, 110.0, 0.0, 0.0),
                  child: Text(
                    'Signup',
                    style:
                        TextStyle(fontSize: 80.0, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(260.0, 125.0, 0.0, 0.0),
                  child: Text(
                    '.',
                    style: TextStyle(
                        fontSize: 80.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.pink),
                  ),
                )
              ],
            ),
          ),
          Container(
              padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
           
              height: 200.0,
              width: 200.0,
              child: Card(
               shape: RoundedRectangleBorder(
                 borderRadius: BorderRadius.circular(200.0)
               ),
                child: text.isEmpty ? InkWell(
                  onTap: get_file,
                  child: Center(
                    child: Text("Select Image"),
                  ),
                ): Image.network(text,fit: BoxFit.cover,)
              ),
            ),

                  Signup_Form(
                    controller: _name,
                    lablename: 'RESTAURANTS NAME',
                  ),
                   SizedBox(height: 10.0),
                     Signup_Form(
                    controller: _email,
                    lablename: 'EMAIL',
                  ),
                   SizedBox(height: 10.0),
                     Signup_Form(
                    controller: _phonenumber,
                    lablename: 'PHONE NUMBER',
                  ),
                   SizedBox(height: 10.0),
                     Signup_Form(
                    controller: _area,
                    lablename: 'LOCATION NAME',
                  ),
                    Signup_Form(
                    controller: _address,
                    lablename: 'ADDRESS NAME',
                  ),
                   SizedBox(height: 10.0),
                     Signup_Form(
                    controller: _password,
                    lablename: 'PASSWORD',
                  ),
                   SizedBox(height: 10.0),
                  Signup_Form(
                    controller: _ownername,
                    lablename: 'NICK NAME ',
                  ),
                   
                  SizedBox(height: 50.0),
                  InkWell(
                     onTap: () {
                          //  _scaf.currentState.showSnackBar(SnackBar(content: Text("send"),));
                            singup( context, _name.text, _address.text, _area.text, _ownername.text,_phonenumber.text, _password.text,_email.text,text);
                          },
                                      child: Container(
                        height: 40.0,
                        child: Material(
                          borderRadius: BorderRadius.circular(20.0),
                          shadowColor: Colors.pinkAccent,
                          color: Colors.pink,
                          elevation: 2.0,
                     
                           
                            child: Center(
                              child: Text(
                                'SIGNUP',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Montserrat'),
                              ),
                            ),
                          
                        )),
                  ),
                  SizedBox(height: 20.0),
                  Container(
                    height: 40.0,
                    color: Colors.transparent,
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Colors.black,
                              style: BorderStyle.solid,
                              width: 1.0),
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(20.0)),
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: 
                        
                            Center(
                              child: Text('Go Back',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Montserrat')),
                            ),
                        
                        
                      ),
                    ),
                  ),
                ],
              )),
          // SizedBox(height: 15.0),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: <Widget>[
          //     Text(
          //       'New to Spotify?',
          //       style: TextStyle(
          //         fontFamily: 'Montserrat',
          //       ),
          //     ),
          //     SizedBox(width: 5.0),
          //     InkWell(
          //       child: Text('Register',
          //           style: TextStyle(
          //               color: Colors.green,
          //               fontFamily: 'Montserrat',
          //               fontWeight: FontWeight.bold,
          //               decoration: TextDecoration.underline)),
          //     )
          //   ],
          // )
        ]));
  }
}
