import 'dart:convert';
import 'dart:html';
import 'package:flutter_web/material.dart';
import 'package:resturant/module/query.dart';
import 'package:resturant/widgets/dividers.dart';
import 'package:http/http.dart' as http;



class Singup_Page extends StatefulWidget {
  @override
  _Singup_PageState createState() => _Singup_PageState();
}

class _Singup_PageState extends State<Singup_Page> {
  TextEditingController _name = TextEditingController();
  TextEditingController _phone = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _email = TextEditingController();


final GlobalKey<ScaffoldState> _scaf =  GlobalKey<ScaffoldState>();
  @override
  void initState() {
    // TODO: implement initState
  gets();
    super.initState();
  }
var ip;
var city = '';
var address = '';
  void gets() async{
     var res =  await http.get('https://api.ipify.org?format=json');
    var  data =  json.decode(res.body);
     var res_details =  await http.get('http://ip-api.com/json');
    var  datas =  json.decode(res_details.body);

     window.console.log(datas['lat']);
     window.console.log(datas['lon']);
    

    setState(() {
      ip = data['ip'];
      city = datas['city'];
    });
    
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaf,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: (){
          //Navigator.push(context, PageTransition(type: PageTransitionType.fade, child: Login_Page()));
      Navigator.pop(context);
        },
        backgroundColor: Colors.black,
        label: Text("Already Account"),
      ),
      appBar: AppBar(
      title: Text("TIFFINSZ Register"),
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
                        child: Text("Register",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 22.0),),
                      ),
                    ),
                    Dividers(),
                     Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Full Name",style: TextStyle(color: Colors.grey,fontSize: 15.0),),
                    ),
                    new Container(
                      width: 280.0,
                      child:  TextField(
                      controller: _name,  
                      decoration: InputDecoration(
                        labelStyle: TextStyle(color: Colors.black),
                        labelText: 'Enter Full Name',
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
                      child: Text("Phone Number",style: TextStyle(color: Colors.grey,fontSize: 15.0),),
                    ),
                    new Container(
                      width: 280.0,
                      child:  TextField(
                      controller: _phone,  
                      decoration: InputDecoration(
                        labelStyle: TextStyle(color: Colors.black),
                        labelText: 'Enter Phone Number',
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
                        child: FlatButton(
                          onPressed: (){
                            resgister( _name.text, _email.text,_password.text, _phone.text,context,ip,address,city);
                          },
                          child: Text("Register",style: TextStyle(color: Colors.white),),
                          color: Colors.red,

                        ),
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

