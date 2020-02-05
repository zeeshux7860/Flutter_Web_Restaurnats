import 'package:flutter_web/material.dart';
import 'package:resturant/screens/category/login-singup/login.dart';
import 'package:resturant/subcriber_admin/main.dart';
import 'package:resturant/subcriber_admin/screens/signup.dart';
import 'package:resturant/widgets/page_transation.dart';
import 'package:firebase_web/firebase.dart';
import 'package:biscuits/biscuits.dart';
class Drawer_Option extends StatefulWidget {
  @override
  _Drawer_OptionState createState() => _Drawer_OptionState();
}

class _Drawer_OptionState extends State<Drawer_Option> {

  final cookies = Cookies();
  @override
  Widget build(BuildContext context) {
    return new Drawer(
      child: Container(
        color: Color(0xFFf1f8ff),
        child: new ListView(
          children: <Widget>[
        
        new Container(
          color: Colors.white,
          margin: EdgeInsets.only(top: 10.0),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.black,
              child: Text("Z",style: TextStyle(color:Colors.white),),
            ),
            title: new Text("Zeeshah"),
          ),
        ),
        

         new Container(
          color: Colors.white,
          padding: EdgeInsets.all(10.0),
          margin: EdgeInsets.only(top: 10.0),
          child: Column(
            children: <Widget>[
            ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.blueAccent,
              child: Icon(Icons.table_chart,color: Colors.white,),
              ),
              title: new Text("Table Booking"),
              subtitle: new Text("Your Booking, Support"),
            ),
            new SizedBox(
              height: 10.0,
            ),
            new Material(
            color: Colors.white,
              child: InkWell(
                onTap: (){},
                child: Row(
                  children: <Widget>[
                     new SizedBox(
                      width: 10.0,
                    ),
                    new Icon(Icons.chat_bubble),
                    new SizedBox(
                      width: 20.0,
                    ),
                    new Text("Booking Support")

                  ],
                ),
              ),
            )
            ],
          )
        ),

             new Container(
          color: Colors.white,
          padding: EdgeInsets.all(10.0),
          margin: EdgeInsets.only(top: 10.0),
          child: Column(
            children: <Widget>[
            ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.blueAccent,
              child: Icon(Icons.supervised_user_circle,color: Colors.white,),
              ),
              title: new Text("SubAdmin"),
              subtitle: new Text("Create Your Own Restaurants"),
            ),
            new SizedBox(
              height: 10.0,
            ),
            new Material(
            color: Colors.white,
              child: InkWell(
                onTap: (){
                  Navigator.push(context, PageTransition(type: PageTransitionType.leftToRight,child: MyApp()));
                },
                child: Row(
                  children: <Widget>[
                  
                    new SizedBox(
                      width: 20.0,
                    ),
                    new Text("Login",style: TextStyle(fontSize: 17.0),)

                  ],
                ),
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            new Material(
            color: Colors.white,
              child: InkWell(
                onTap: (){
                    Navigator.push(context, PageTransition(type: PageTransitionType.leftToRight,child: SignupPage()));
              
                },
                child: Row(
                  children: <Widget>[
                
                    new SizedBox(
                      width: 20.0,
                    ),
                    new Text("Resgister",style: TextStyle(fontSize: 17.0),)

                  ],
                ),
              ),
            ),
            ],
          )
        ),
            
           new Container(
          color: Colors.white,
          padding: EdgeInsets.all(10.0),
          margin: EdgeInsets.only(top: 10.0),
          child: Column(
            children: <Widget>[
            ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.blueAccent,
              child: Icon(Icons.dashboard,color: Colors.white,),
              ),
              title: new Text("TIFFINSZ"),
              subtitle: new Text("All Page"),
            ),
            new SizedBox(
              height: 10.0,
            ),
            new Material(
            color: Colors.white,
              child: InkWell(
                onTap: (){},
                child: Row(
                  children: <Widget>[
                  
                    new SizedBox(
                      width: 20.0,
                    ),
                    new Text("Home",style: TextStyle(fontSize: 17.0),)

                  ],
                ),
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            new Material(
            color: Colors.white,
              child: InkWell(
                onTap: (){},
                child: Row(
                  children: <Widget>[
                
                    new SizedBox(
                      width: 20.0,
                    ),
                    new Text("About",style: TextStyle(fontSize: 17.0),)

                  ],
                ),
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            new Material(
            color: Colors.white,
              child: InkWell(
                onTap: (){},
                child: Row(
                  children: <Widget>[
                
                    new SizedBox(
                      width: 20.0,
                    ),
                    new Text("Privacy",style: TextStyle(fontSize: 17.0),)

                  ],
                ),
              ),
            ),
            ],
          )
        ),    

        Container(
        color: Colors.white,
          padding: EdgeInsets.all(10.0),
          margin: EdgeInsets.only(top: 10.0),
          child: ListTile(
            leading: Icon(Icons.close),
            title: Text("Logout"),
            onTap: (){
              auth().signOut();
            cookies.clear();
            Navigator.pushReplacement(context, PageTransition(type: PageTransitionType.fade,child: Login_Page()));
            },
          ),
        )
          ],
        ),
      )
    );
  }
}