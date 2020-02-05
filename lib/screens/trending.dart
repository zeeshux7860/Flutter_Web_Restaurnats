import 'package:flutter_web/material.dart';
import 'package:resturant/screens/restaurant/dish_list.dart';
import 'package:firebase_web/firebase.dart';
import 'package:resturant/widgets/trending_item.dart';


class Trending extends StatefulWidget {
  @override
  _TrendingState createState() => _TrendingState();
}

class _TrendingState extends State<Trending> {
  final TextEditingController _searchControl =  TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text("Restaurants List"),
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios
          ),
          onPressed: ()=>Navigator.pop(context),
        ),
      ),

      body: Padding(
        padding: EdgeInsets.fromLTRB(10.0,0,10.0,0),
        child: ListView(
          children: <Widget>[
            Card(
              elevation: 6.0,
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


            SizedBox(height: 10.0),

            StreamBuilder(
              stream: firestore().collection('Restaurants').onSnapshot,
              builder: (context, snapshot) {
                 if(!snapshot.hasData){
           return Center(
              child: CircularProgressIndicator(),
            );}else{
                return GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 
                    MediaQuery.of(context).size.width < 560  ? 1 
                  : MediaQuery.of(context).size.width < 800  ? 2
                  : MediaQuery.of(context).size.width < 1100 ? 3
                  : MediaQuery.of(context).size.width > 1100 ? 4 
                  : 1
                  ),
                  primary: true,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: snapshot.data.docs.length,
                  itemBuilder: (BuildContext context, int index) {
                    var restaurants = snapshot.data.docs;
                    var restaurant = restaurants[index].data();

                    return TrendingItem(
                      route_page_name: LIst_Dish(title: restaurant["restaurants_name"],img: restaurant["profile"],zone: '1',id: restaurant['id'],heroid: index),
                      img: restaurant["profile"],
                      title: restaurant["restaurants_name"],
                      address: restaurant["address"],
                      rating: '3.0',
                      heroid: index,
                    );
                  },
                );
              }
              }
            ),

            SizedBox(height: 10.0),

          ],
        ),
      ),
    );
  }
}
