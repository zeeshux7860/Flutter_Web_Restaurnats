import 'package:flutter_web/material.dart';
import 'package:resturant/module/query.dart';
import 'package:resturant/screens/category/login-singup/singup.dart';
import 'package:resturant/widgets/dividers.dart';
import 'package:resturant/widgets/page_transation.dart';



class Login_Page extends StatefulWidget {
  @override
  _Login_PageState createState() => _Login_PageState();
}

class _Login_PageState extends State<Login_Page> {
    TextEditingController _password = TextEditingController();
  TextEditingController _email = TextEditingController();


final GlobalKey<ScaffoldState> _scaf =  GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaf,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: (){
          Navigator.push(context, PageTransition(type: PageTransitionType.fade, child: Singup_Page()));
        },
        backgroundColor: Colors.black,
        label: Text("Create Account"),
      ),
      appBar: AppBar(
      title: Text("TIFFINSZ Login"),
      backgroundColor: Colors.white,
      elevation: 1.0,
      ),
      body: new Column(
        children: <Widget>[
          Flexible(
            child: ListView(
        children: <Widget>[
Stack(
  children: <Widget>[
     Column(
      children: <Widget>[
          Container(
           height: MediaQuery.of(context).size.height * .60,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage("https://www.besthealthmag.ca/wp-content/uploads/sites/16/2017/10/Diet-Affects-Breast-Cancer.gif"),
                fit: BoxFit.cover
              )
            ),
          ),
         Container(
              height: MediaQuery.of(context).size.height * .40,
              color: Colors.white,
            )
      ],
    ),
    new Container(
          alignment: Alignment.topCenter,
          padding: new EdgeInsets.only(
              top: MediaQuery.of(context).size.height * .50,
              right: 20.0,
              left: 20.0),
          child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
             Card(
                            child: Container(
                width: 300.0,
                padding: EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text("Login",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 22.0),),
                      ),
                    ),
                    Dividers(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Email Address",style: TextStyle(color: Colors.grey,fontSize: 15.0),),
                    ),
                    new Container(
                      width: 280.0,
                      child:  TextField(
                      controller: _email,
                      decoration: InputDecoration(
                        labelStyle: TextStyle(color: Colors.black),
                        labelText: 'Enter Email Address',
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)
                        )
                      ),
                      
                    ),
                    
                    ),
                    SizedBox(
                      height: 2.0,
                    ),
                     Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Password",style: TextStyle(color: Colors.grey,fontSize: 15.0),),
                    ),
                     new Container(
                      width: 280.0,
                      child:  TextField(
                      controller: _password,
                      decoration: InputDecoration(
                        labelText: 'Enter Password',
                        labelStyle: TextStyle(color: Colors.black),
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)
                        )
                      ),
                    ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                           
                           FlatButton(
                                onPressed: (){
                                  forgetpassword(_email.text,context);
                                },
                                child: Text("Forget Password"),
                              ),
                            
                            RaisedButton(
                          onPressed: (){
                          login(_email.text, _password.text,context);
                          },
                          child: Text("Login",style: TextStyle(color: Colors.white),),
                          color: Colors.red,

                        ),
                          ],
                        )
                      ),
                    )
                  ],
                ),
            ),
             )
          ],
        )
        )
  ],
),

 Dividers(),



        

        
        ],
      ),
          ),
           Row(
   children: <Widget>[
     FlatButton(
       onPressed: (){},
       child: Text("Home",style: TextStyle(color: Colors.grey),),
     ),
     FlatButton(
       onPressed: (){},
       child: Text("About",style: TextStyle(color: Colors.grey),),
     ),
     FlatButton(
       onPressed: (){},
       child: Text("Contact us",style: TextStyle(color: Colors.grey),),
     ),
     FlatButton(
       onPressed: (){},
       child: Text("Privacy Policy",style: TextStyle(color: Colors.grey),),
     ),
   ],
 )
        ],
      )
    );
  }
}


class StackDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Stack(
      children: <Widget>[
        // The containers in the background
        new Column(
          children: <Widget>[
            new Container(
              height: MediaQuery.of(context).size.height * .65,
              color: Colors.blue,
            ),
            new Container(
              height: MediaQuery.of(context).size.height * .35,
              color: Colors.white,
            )
          ],
        ),
        // The card widget with top padding, 
        // incase if you wanted bottom padding to work, 
        // set the `alignment` of container to Alignment.bottomCenter
        new Container(
          alignment: Alignment.topCenter,
          padding: new EdgeInsets.only(
              top: MediaQuery.of(context).size.height * .58,
              right: 20.0,
              left: 20.0),
          child: new Container(
            height: 200.0,
            
            width: 300.0,
            child: new Card(
              color: Colors.white,
              elevation: 4.0,
            ),
          ),
        )
      ],
    );
  }
}