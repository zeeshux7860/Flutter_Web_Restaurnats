import 'dart:math';
import 'dart:html';
import 'package:biscuits/biscuits.dart';
import 'package:flutter_web/material.dart';
import 'package:resturant/subcriber_admin/module/get_query.dart';
import 'package:resturant/subcriber_admin/screens/home.dart';
import 'package:resturant/subcriber_admin/screens/log.dart';
import 'package:resturant/subcriber_admin/widgets/flushbar.dart';
import 'package:resturant/widgets/page_transation.dart';
import 'package:uuid/uuid.dart';
import 'package:firebase_web/firebase.dart';

final cookies = Cookies();
 var store = firestore();
 Auth auth;
 RecaptchaVerifier verifier;
 ////////
   void initVerifier() {
     
     
    // This is anonymous recaptcha - size must be defined
   /* verifier = fb.RecaptchaVerifier("register", {

      "size": "invisible",
      "callback": (resp) {
        ("reCAPTCHA solved, allow signInWithPhoneNumber.");
      },
      "expired-callback": () {
        print("Response expired. Ask user to solve reCAPTCHA again.");
      }
    });

*/

    // Use this if you want to use recaptcha widget directly
    // firestore().app.auth().createUserWithEmailAndPassword('zeeshux7860.zxzx@gmail.com', '987654321');
   /* verifier =   RecaptchaVerifier("recaptcha-container",{
  'size': 'normal',
  'callback': (response) {
    // reCAPTCHA solved, allow signInWithPhoneNumber.
     window.console.log(response.toString());
    // ...
  },
  'expired-callback': () {
    // Response expired. Ask user to solve reCAPTCHA again.
    // ...
  }
  })..render();
 */
    //window.console.log(verifier.verify().toString());
   // auths();
  }
  //auth.signInWithPhoneNumber('+919088226981', verifier);

  void auths(){
     firestore().app.auth().signInWithPhoneNumber('+919088226981', verifier);
  }
 // start login query 
void login(context,email,password){
 
 store.collection("Restaurants").where('email', '==', email).where('password', '==', password).get().then((onData){
 
    if(onData.docs.length == 1){

  Flushbar(
    title: onData.docs.toString(),//'Successfully login',
    message: 'Redirect Login page',
    duration : Duration(seconds: 3),
  )..show(context).then((ok){
    
    onData.forEach((callback){
      window.console.log(callback.data()['id']);
      
      cookies.set('id', callback.data()['id'].toString());
 Navigator.pushReplacement(context, PageTransition(type: PageTransitionType.fade,child: Admin_Home(
 uid:  callback.data()['id'],
 )));
      
    });
   /* final cookies = Cookies();
    cookies.set('id', '');
    Navigator.pushReplacement(context, PageTransition(type: PageTransitionType.fade,child: Admin_Home(

    )));*/
  });
    }else{
        Flushbar(
    title: 'Wrong Entry',
    message: 'Enter Correct Email Password',
    duration : Duration(seconds: 3),
  )..show(context);
    }
  });
}
 // end login query 
// restaurants sing up
void singup(context,name,address,area,ownername,phonenumber,password,email,base64){
  
  
  store.collection('Restaurants').add({
  'id' : DateTime.now().microsecondsSinceEpoch,
  'restaurants_name' : name,
  'address' : address,
  'owner_name': ownername,
  'area' : area,
  'email' : email,
  'password' : password,
  'phonenumber' : phonenumber,
  'date' : DateTime.now(),
  'profile' : base64,
  'condition' : true
  }).then((onValue){
     showDialog(
                            context: context,
                            builder: (context){
                              return AlertDialog(
                                title: Text("Successfully"),
                                content:  Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: Text("Thanks You"),
                                ),
                              );
                            }
                          );
  }).catchError((onError){
       showDialog(
                            context: context,
                            builder: (context){
                              return AlertDialog(
                                title: Text("Failed"),
                                content:  Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: Text("Something went to wrong"),
                                ),
                              );
                            }
                          );
  });
}
//end signup
// start add product query
void addproduct(context,name,rating,desc,price,category,base64,stock,uid,restaurants_name){
  var uuid = new Uuid();
 
  var ref = store.collection("DishList");
Random.secure();
  uuid.v4();
  ref.add({
    'id' : uuid.v4(),
    'name' : name,
    'desc' : desc,
    'base64' : base64,
    'date' : DateTime.now(),
    'restaurants' : restaurants_name,
    'restaurants_id' : uid,
    'category'  : category,
    'per_day_stock' : stock,
    'product_rate' : rating,
    'price' : price
  }).then((onValue){
    showDialog(
        context: context,
        builder: (context){
       return AlertDialog(
        title: Text("Successfully ADD"),
        content:  Padding(
        padding: EdgeInsets.all(10.0),
        child: Text("Thanks for adding"),
        ),
      );
      }
   ); 
  });

}
// end product value
// category add start 
void category_add(uid,name,base64,context){
  store.collection('category').where('category_name', '==', name).get().then((onValue){
    if(onValue.docs.length == 1){
      Flushbar(
    title: 'already',//'Successfully login',
    message: 'Already exit',
    duration : Duration(seconds: 3),
  )..show(context);
    }else{
      store.collection('category').add({
  'id' : DateTime.now().millisecondsSinceEpoch,
  'uid' : uid,
  'category_name' : name,
  'img' : base64
  
}).then((onValue){
  Flushbar(
    title: 'Added',//'Successfully login',
    message: 'category add',
    duration : Duration(seconds: 3),
  )..show(context);
}).catchError((onError){
  Flushbar(
    title: 'Wrongs',//'Successfully login',
    message: 'category add',
    duration : Duration(seconds: 3),
  )..show(context);
});
    }
  });

}
// category end
// selected category 
void selected_category(uid,name,base64,context){
 store.collection('Selected category').where('category_name', '==', name).where('uid', '==', uid).get().then((onValue){
    if(onValue.docs.length == 1){
      Flushbar(
    title: 'already',//'Successfully login',
    message: 'Already exit',
    duration : Duration(seconds: 3),
  )..show(context);
    }else{
      store.collection('Selected category').add({
  'id' : DateTime.now().millisecondsSinceEpoch,
  'uid' : uid,
  'category_name' : name,
  'img' : base64
  
}).then((onValue){
  Flushbar(
    title: 'Added',//'Successfully login',
    message: 'category add',
    duration : Duration(seconds: 3),
  )..show(context);
}).catchError((onError){
  Flushbar(
    title: 'Wrongs',//'Successfully login',
    message: 'category add',
    duration : Duration(seconds: 3),
  )..show(context);
});
    }
  });

}
// selected category end
// delete selected  category
void selectedcategorydelete(key){
    store.collection('Selected category').doc(key).delete();
                                             
}
// deete selected category ed
// logout 
void logout(context){
  cookies.clear();
  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> MyHomePage()));
}
// logout end