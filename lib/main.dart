import 'package:firebase_web/firebase.dart' as fb;
import 'package:flutter_web/material.dart';
import 'package:flutter_web/services.dart';
import 'package:resturant/screens/category/login-singup/login.dart';
import 'package:resturant/screens/main_screen.dart';
import 'package:resturant/util/const.dart';
import 'package:biscuits/biscuits.dart';

void main() {
  
 // SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((_) {
    runApp(MyApp());
  
}


class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isDark = false;
  var uidss;
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: isDark ? Constants.darkPrimary : Constants.lightPrimary,
      statusBarIconBrightness: isDark?Brightness.light:Brightness.dark,
    ));
    firebases();
  }

  void firebases() {
    try {
    fb.initializeApp(
          apiKey: "",
    authDomain: "",
    databaseURL: "",
    projectId: "",
    storageBucket: "",

        );

   
  } on fb.FirebaseJsNotLoadedException catch (e) {
    print(e);
  }
    
  
  final cookiess = Cookies();
   var uid = cookiess.get('uid_users');
     setState(() {
       uidss = uid;
     });
  }
  


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'first',
      theme: isDark ? Constants.darkTheme : Constants.lightTheme,
      //home: MainScreen(),
      home: 
      uidss == null ? 
      Login_Page()
      : 
      MainScreen()
    );
  }
}

