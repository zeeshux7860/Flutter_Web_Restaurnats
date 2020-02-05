import 'dart:html';
import 'package:firebase_web/firebase.dart' as fb;
import 'package:resturant/screens/main_screen.dart';
import 'package:biscuits/biscuits.dart';
import 'package:flutter_web/material.dart';
import 'package:resturant/widgets/edge_alert.dart';
import 'package:resturant/widgets/page_transation.dart';
var store = fb.firestore();
final cookies = Cookies();
void resgister(name,email,password,phone,context,ip,address,city){
 
    // firestore().app.auth().createUserWithEmailAndPassword('zeeshux7860.zxzx@gmail.com', '987654321');
fb.auth().createUserWithEmailAndPassword(email, password).then((onValue){
 
 onValue.user.sendEmailVerification();

store.collection("Users").doc(onValue.user.uid).set({
  'uid' : onValue.user.uid,
  'name' : name,
  'email' : email,
  'phone' : phone,
  'verified' : false,
  'ip' : ip,
  "date" : DateTime.now(),
  'address' : city,
  'city' : city
});
  EdgeAlert.show(context,
  icon: Icons.done_all,
 title: 'Thasnk You' ,
  description: 'Account Create Successfully',
  gravity: EdgeAlert.BOTTOM,
  backgroundColor: Colors.red);
 
}).catchError((e){

   EdgeAlert.show(context,
   icon: Icons.email,
 title: e.toString() ,
  description: 'email aleady exist',
  gravity: EdgeAlert.BOTTOM,
  backgroundColor: Colors.red);
});

}

void login(email,password,context){

  fb.auth().signInWithEmailAndPassword(email, password).then((onValue){
    if(onValue.user.emailVerified){
      cookies.set('uid_users', onValue.user.uid);
      Navigator.pushReplacement(context, PageTransition(type: PageTransitionType.fade,child: MainScreen()));
    }else{
      
    EdgeAlert.show(context,
    icon: Icons.email,
 title: 'Verify Now' ,
  description: 'Email Not Verify',
  gravity: EdgeAlert.BOTTOM,
  backgroundColor: Colors.red);
  
      
  
    };
  }).catchError((onError){
    
 
    EdgeAlert.show(context,
  icon: Icons.email,
  title: 'Something went to wromg',
  description: onError.toString(),
  gravity: EdgeAlert.BOTTOM,
  backgroundColor: Colors.red);
  });
}

void  forgetpassword(email,context){
  fb.auth().sendPasswordResetEmail(email).then((onValue){
  EdgeAlert.show(context,
  icon: Icons.email,
  title: 'Check Email',
  description: "Send forget link",
  gravity: EdgeAlert.BOTTOM,
  backgroundColor: Colors.red);
  }).catchError((onError){
  EdgeAlert.show(context,
  title: 'Something went to wrongs',
  description: onError.toString(),
  gravity: EdgeAlert.BOTTOM,
  backgroundColor: Colors.red);
  });
 
}