import 'package:flutter_web/material.dart';
import 'package:resturant/screens/category/category.dart';
import 'package:resturant/screens/main_screen/cart_list.dart';
import 'package:resturant/screens/restaurant/dish_list.dart';
import 'package:resturant/screens/trending.dart';
import 'package:resturant/util/categories.dart';
import 'package:resturant/util/friends.dart';
import 'package:resturant/util/restaurants.dart';
import 'package:resturant/widgets/drawer.dart';
import 'package:resturant/widgets/page_transation.dart';
import 'package:resturant/widgets/sellallbuton.dart';
import 'package:resturant/widgets/slide_item.dart';
import 'dart:js' as js;


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with AutomaticKeepAliveClientMixin<Home>{
  final TextEditingController _searchControl =  TextEditingController();

  @override
  Widget build(BuildContext context) {
     var uri = Uri.tryParse(js.context['location']['href']);

    super.build(context);
    return Scaffold(
      drawer: Drawer_Option(),
      appBar: AppBar(
        title: new Text("TIFFINSZ"),
        elevation: 1.0,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: (){
              Navigator.push(context, PageTransition(type: PageTransitionType.fade,child: Second_page()));
            },
          ),
        //  get method test => new Text(uri.queryParameters.values.toString())
        ],
      ),
      
      body: Padding(
        padding: EdgeInsets.fromLTRB(10.0,0,10.0,0),
        child: ListView(
          children: <Widget>[
            
        new Padding(
          padding: EdgeInsets.only(top: 30.0, left: 10.0, right: 10.0),
          child: Card(
            elevation: 3.0,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(5.0),
                ),
              ),
              child: TextField(
                style: TextStyle(
                  fontSize: 15.0,
                  color: Colors.black,
                ),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(10.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: BorderSide(color: Colors.white,),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white,),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  hintText: "Search..",
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.black,
                  ),
                  suffixIcon: Icon(
                    Icons.filter_list,
                    color: Colors.black,
                  ),
                  hintStyle: TextStyle(
                    fontSize: 15.0,
                    color: Colors.black,
                  ),
                ),
                maxLines: 1,
                controller: _searchControl,
              ),
            ),
          ),
        ),
            SizedBox(height: 20.0),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Restaurants",
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.w800,
                  ),
                ),

                SeeallButton(
                  name: 'See all',
                  route_page_name: Trending(),
                  
                )
              ],
            ),

            SizedBox(height: 10.0),

            //Horizontal List here
            Container(
              height: MediaQuery.of(context).size.height/2.4,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                primary: false,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: restaurants == null ? 0 :restaurants.length,
                itemBuilder: (BuildContext context, int index) {
                  Map restaurant = restaurants[index];

                  return Padding(
                    padding: EdgeInsets.only(right: 10.0),
                    child: SlideItem(
                      heroid: index,
                      route_page_name: LIst_Dish(title: restaurant["title"],img: restaurant["img"],zone: '1',id: '000',heroid: index),
                      img: restaurant["img"],
                      title: restaurant["title"],
                      address: restaurant["address"],
                      rating: restaurant["rating"],
                    ),
                  );
                },
              ),
            ),

            SizedBox(height: 10.0),


            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Category",
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.w800,
                  ),
                ),

                SeeallButton(
                  name: 'see all',
                  route_page_name: Category(),
                )
                 
              ],
            ),

            SizedBox(height: 10.0),

            //Horizontal List here
            Container(
              height: MediaQuery.of(context).size.height/6,
              child: StreamBuilder(
                stream: null,
                builder: (context, snapshot) {
                   if(!snapshot.hasData)
           return Center(
              child: CircularProgressIndicator(),
            );
                  return ListView.builder(
                    primary: false,
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: categories == null ? 0:categories.length,
                    itemBuilder: (BuildContext context, int index) {
                      Map cat = categories[index];

                      return Padding(
                        padding: EdgeInsets.only(right: 10.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Stack(
                            children: <Widget>[
                              Image.asset(
                                cat["img"],
                                height: MediaQuery.of(context).size.height/6,
                                width: MediaQuery.of(context).size.height/6,
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
                                      cat['color1'],
                                      cat['color2'],
                                    ],
                                    // stops: [0.0, 0.1],
                                  ),
                                ),
                                height: MediaQuery.of(context).size.height/6,
                                width: MediaQuery.of(context).size.height/6,
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
                                      cat["name"],
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
                      );
                    },
                  );
                }
              ),
            ),

            SizedBox(height: 20.0),

         

         


          ],
        ),
      ),
    );

  }

  @override
  bool get wantKeepAlive => true;


}
