import 'package:flutter_web/material.dart';
import 'package:resturant/subcriber_admin/screens/home.dart';
import 'package:resturant/subcriber_admin/screens/log.dart';
import 'package:resturant/subcriber_admin/screens/signup.dart';
import 'package:firebase_web/firebase.dart' as fb;
import 'package:firebase_web/firestore.dart';
import 'package:biscuits/biscuits.dart';
import 'package:resturant/widgets/page_transation.dart';
void main() => runApp(new MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  var uidss;
  void initState() {
    // TODO: implement initState
    firebases();
    super.initState();
  }
   firebases() async{
//await config();

  try {
    fb.initializeApp(
          apiKey: "AIzaSyBgVz7nodLbdkARksykEhotzoLS3vnP8ZM",
    authDomain: "restaurants-b6421.firebaseapp.com",
    databaseURL: "https://restaurants-b6421.firebaseio.com",
    projectId: "restaurants-b6421",
    storageBucket: "restaurants-b6421.appspot.com",

        );

   
  } on fb.FirebaseJsNotLoadedException catch (e) {
    print(e);
  }
  
  final cookiess = Cookies();
   var uid = cookiess.get('id');
    
     var uids = int.parse(uid);
     assert(uids is int);
     setState(() {
       uidss = uids;
     });
  }
  
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
     /* routes: <String, WidgetBuilder>{
        '/signup': (BuildContext context) => new SignupPage()
      },*/
      //home: new Admin_Home(),
      home: 
      uidss == null ? 
      MyHomePage()
      : 
      Admin_Home(
        uid: uidss,
      )
    );
  }
}

 