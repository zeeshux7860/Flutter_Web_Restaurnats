import 'package:flutter_web/material.dart';
import 'package:resturant/screens/restaurant/dish_list.dart';
import 'package:resturant/util/const.dart';
import 'package:resturant/util/restaurants.dart';


class Favorite extends StatefulWidget {
  @override
  _FavoriteState createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: new Text("Favorite"),
        backgroundColor: Colors.white
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 
                  MediaQuery.of(context).size.width < 560  ? 1 
                : MediaQuery.of(context).size.width < 800  ? 2
                : MediaQuery.of(context).size.width < 1100 ? 3
                : MediaQuery.of(context).size.width > 1100 ? 4 
                : 1
                ),
          itemCount: restaurants.length,
          itemBuilder: (context,h){
              Map restaurant = restaurants[h];
            return Padding(
              padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
              child: new Container(
                width: MediaQuery.of(context).size.width,
                child: new Card(
                  shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(10.0)),
            elevation: 3.0,
                  child: InkWell(
                     onTap: (){
                  Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (BuildContext context){
                              return LIst_Dish(title: restaurant["title"],img: restaurant["img"],zone: '1',id: '000',heroid: h);
                            },
                          ),
                        );
                },
                child: Column(
                  children: <Widget>[
                    Stack(
                      children: <Widget>[
                        Container(
                        //  height: MediaQuery.of(context).size.height/3.5,
                          width: MediaQuery.of(context).size.width,
                          child: ClipRRect(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                            ),
                            child: Image.asset(
                              restaurant["img"],
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),

                        Positioned(
                          top: 6.0,
                          right: 6.0,
                          child: Card(
                            shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(4.0)),
                            child: Padding(
                              padding: EdgeInsets.all(2.0),
                              child: Row(
                                children: <Widget>[
                                  Icon(
                                    Icons.star,
                                    color: Constants.ratingBG,
                                    size: 10,
                                  ),

                                  Text(
                                    restaurant["rating"],
                                    style: TextStyle(
                                      fontSize: 10,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),

                        Positioned(
                          top: 6.0,
                          left: 6.0,
                          child: Card(
                            shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(3.0)),
                            child: Padding(
                              padding: EdgeInsets.all(4.0),
                              child:Text(
                                " OPEN ",
                                style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),


                      ],
                    ),

                    SizedBox(height: 7.0),

                    Padding(
                      padding: EdgeInsets.only(left: 15.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        child: Text(
                         restaurant["title"],
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ),

                    SizedBox(height: 7.0),

                    Padding(
                      padding: EdgeInsets.only(left: 15.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        child: Text(
                          restaurant["title"],
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 10.0),

                  ],
                ),
                  ),
                ),
              ),
            );
          },
        ),
      )
    );
    
  }
}