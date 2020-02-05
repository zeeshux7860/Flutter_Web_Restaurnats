import 'package:flutter_web/material.dart';
import 'package:resturant/subcriber_admin/module/query.dart';

class Category extends StatelessWidget {
  final name;
  final img;
  final uid;
  final condtion; 
  final keys;
  const Category({Key key, this.uid, this.name, this.img,this.condtion, this.keys}) : super(key: key); 
  @override
  Widget build(BuildContext context) {
    return Padding(
                    padding: EdgeInsets.only(right: 10.0),
                    child: Card(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0),),
                                          child: InkWell(
                                            onTap: (){
                                              if(condtion == 2){
                                                selectedcategorydelete(keys);
                                              }else{
                                              selected_category(uid,name,img,context);
                                              }
                                            },
                                          child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Stack(
                          children: <Widget>[
                            Image.network(
                              img,
                              height: MediaQuery.of(context).size.height/5,
                              width: MediaQuery.of(context).size.height/5,
                              fit: BoxFit.cover,
                            ),

                            Container(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  // Add one stop for each color. Stops should increase from 0 to 1
                                  stops: [0.2, 0.7],
                                  colors: [
                                   Color.fromARGB(100, 0, 0, 0),
                                   Color.fromARGB(100, 0, 0, 0),
                                  ],
                                  // stops: [0.0, 0.1],
                                ),
                              ),
                              height: MediaQuery.of(context).size.height/5,
                              width: MediaQuery.of(context).size.height/5,
                            ),


                            Center(

                              child: Container(
                                height: MediaQuery.of(context).size.height/6,
                                width: MediaQuery.of(context).size.height/6,
                                padding: EdgeInsets.all(1),
                                constraints: BoxConstraints(
                                  minWidth: 20,
                                  minHeight: 20,
                                ),
                                child: Center(
                                  child: Text(
                                    name,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),

                          ],
                        ),
                      ),
                                          ),
                    ),
                  );
  }
}