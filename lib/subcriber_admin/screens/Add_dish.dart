
import 'package:firebase_web/firebase.dart';
import 'dart:html';
import 'package:flutter_web/material.dart';
import 'package:resturant/subcriber_admin/module/query.dart';
import 'package:resturant/subcriber_admin/widgets/form.dart';
import 'package:resturant/subcriber_admin/widgets/rating.dart';
import 'package:resturant/widgets/dividers.dart';

class Add_dish extends StatefulWidget {
  final uid;
  final restaurants_name;

  const Add_dish({Key key, this.uid, this.restaurants_name}) : super(key: key);
  @override
  _Add_dishState createState() => _Add_dishState();
}

class _Add_dishState extends State<Add_dish> {
   TextEditingController _ratingController = TextEditingController();
   TextEditingController _titleController = TextEditingController();
   TextEditingController _descController = TextEditingController();
   TextEditingController _priceController = TextEditingController();
   TextEditingController _stockController = TextEditingController();
  
  //var categoryes = <String>['Select category'];
  double _rating;
  double _userRating = 3.6;
   bool _customize = false;
  bool _isRTLMode = false;
String _filePath;
   @override
  void initState() {
    _ratingController.text = "1.0";
   
    super.initState();
  }
       
  var category = 'Select Category';
  
  var _image;

 
  String text = '';
  var onesec =  Duration(seconds: 2);

 
void get_file() {
 InputElement upload = FileUploadInputElement();
 upload.click();

upload.onChange.listen((e) async{
e.preventDefault();
   var file = (e.target as FileUploadInputElement).files[0];
   var customMetadata = {"location": "Prague", "owner": "You"};
   var uploadTask = storage().ref(file.name).put(file,
   UploadMetadata(
     contentType: file.type, customMetadata: customMetadata
   )
   );
var snapshot = await uploadTask.future;
        var filePath = await snapshot.ref.getDownloadURL();
        setState(() {
          text = filePath.toString();
        });
});
}

  @override
  Widget build(BuildContext context) {
    return ListView(
          children: <Widget>[
            
    Container(
  
          margin: EdgeInsets.all(10.0),
 
  child: new Card(
  
    child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          
           Container(
             color: Colors.black,
               width: MediaQuery.of(context).size.width,
                      child: new Padding(
                 padding: EdgeInsets.all(20.0),
                child: new Text("Add Dish",style:TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20.00,),textAlign: TextAlign.start,),
              ),
           ),
           Product_form(
             title: 'Select Image',
            filed: Container(
            
              height: 200.0,
              width: 300.0,
              child: new Card(
                child: text.isEmpty ? InkWell(
                  onTap: get_file,
                  child: Center(
                    child: Text("Select Image"),
                  ),
                ): InkWell(
                  onTap: (){
                    setState(() {
                     text == ''; 
                    });
                   // document.querySelector("p").remove();
                  },
                  child: Image.network(text,fit: BoxFit.cover,),
                )
              ),
            ),
           ),
           
           Product_form(
             title: 'Title :',
             filed: TextField(
                      controller: _titleController,
                     decoration: InputDecoration(
                       labelText: 'Product Title',
                       border: OutlineInputBorder(
                         borderSide: BorderSide(color: Colors.black)
                       ),
                     ),
                   ),
           ),
           Dividers(),
           Product_form(
             title: 'Describtion',
             filed: TextField(
               controller: _descController,
               maxLines: 3,
                     decoration: InputDecoration(
                       labelText: 'Describtion',
                       
                       border: OutlineInputBorder(
                         borderSide: BorderSide(color: Colors.black)
                       ),
                     ),
                   ),
           ),
           Dividers(),
           Product_form(
             title: 'Price :',
             filed: TextField(
               controller: _priceController,
                     decoration: InputDecoration(
                       labelText: 'Product Price',
                       border: OutlineInputBorder(
                         borderSide: BorderSide(color: Colors.black)
                       ),
                     ),
                   ),
           ),
           Dividers(),
             Product_form(
             title: 'Selct Category :',
             filed: StreamBuilder(
               stream: store.collection('Selected category').where('uid', '==', widget.uid).onSnapshot,
               builder: (context, snapshot) {
                 if(!snapshot.hasData)
                 return Center(
                   child: CircularProgressIndicator(),
                 );
                 return DropdownButton<String>(
                   value: category,
                   hint: Text("Select Category"),
                   onChanged: (val){
                     setState(() {
                       category = val;
                     });
                   },
                   items: snapshot.data.docs.map<DropdownMenuItem<String>>((val){
                     return DropdownMenuItem<String>(
                       value: val.data()['category_name'],
                       child: Text(val.data()['category_name']),
                     );
                   }).toList()
                 );
               }
             )
           ),
           Dividers(),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: FlutterRatingBarIndicator(
                      rating: _userRating,
                     
                      itemCount: 5,
                      itemSize: 50.0,
                      emptyColor: Colors.amber.withAlpha(50),
                    ),
          ),
Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: TextFormField(
                      controller: _ratingController,
                      
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Enter rating",
                        labelText: "Enter rating",
                        suffixIcon: MaterialButton(
                          onPressed: () {
                            setState(() {
                              _userRating =
                                  double.parse(_ratingController.text ?? "0.0");
                            });
                          },
                          child: Text("Rate"),
                        ),
                      ),
                    ),
                  ),
                      Dividers(),
             Product_form(
             title: 'Per Days Stock:',
             filed: TextField(
               controller: _stockController,
                     decoration: InputDecoration(
                       labelText: 'Per Days Stock:',
                       border: OutlineInputBorder(
                         borderSide: BorderSide(color: Colors.black)
                       ),
                     ),
                   ),
           ),
                  Padding(
                    padding: EdgeInsets.all(15.0),
                    child: new Align(
                      alignment: Alignment.topRight,
                      child: FlatButton(
                        color: Colors.red,
                        child: Text("Add",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,),),
                        onPressed: (){
                    addproduct(
                        context,
                      _titleController.text,
                      _ratingController.text,
                      _descController.text,
                      _priceController.text,
                      category,
                      text,
                      _stockController.text,
                      widget.uid,
                      widget.restaurants_name
                      );
                          
                        },
                      ),
                    ),
                  ),
              
        ],
      ),
    )
  ),
          
  
        ),
],
    );
  }
  
}