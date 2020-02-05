import 'dart:async';
import 'dart:html';

import 'package:flutter_web/material.dart';
import 'package:resturant/subcriber_admin/module/query.dart';
import 'package:resturant/subcriber_admin/widgets/category.dart';
import 'package:resturant/subcriber_admin/widgets/drawerlist.dart';
import 'package:resturant/subcriber_admin/widgets/form.dart';
import 'package:resturant/subcriber_admin/widgets/row_dashboard.dart';
import 'package:firebase_web/firebase.dart';
import 'package:resturant/widgets/dividers.dart';

class CategoryAdd extends StatefulWidget {
  final uid;

  const CategoryAdd({Key key, this.uid}) : super(key: key);

  @override
  _CategoryAddState createState() => _CategoryAddState();
}

class _CategoryAddState extends State<CategoryAdd> {
  
  TextEditingController _titleController = TextEditingController();
   
  String text = '';
  var onesec =  Duration(seconds: 2);

 
void get_file() {
text == '';
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
    return Scaffold(
      floatingActionButton: text == '' ? null : FloatingActionButton(
        onPressed: (){
          setState(() {
           text = ''; 
          });
        },
        child: Icon(Icons.close),
      ),
      appBar: AppBar(
        title: new Text("Add Product"),
        backgroundColor: Colors.black,
        elevation: 0.0,
      ),
      body: Row_Dash(
        first: Drawer_list(
          uids: widget.uid,
        ),
        second: ListView(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 10.0),
              padding: const EdgeInsets.all(10.0),
              child: Card(
                child: Column(
                  children: <Widget>[
                    Container(
             color: Colors.black,
               width: MediaQuery.of(context).size.width,
                      child: new Padding(
                 padding: EdgeInsets.all(20.0),
                child: new Text("Select Categoryes",style:TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20.00,),textAlign: TextAlign.start,),
              ),
           ),
           Padding(
             padding: EdgeInsets.all(10.0),
             child: StreamBuilder(
               stream: store.collection('category').onSnapshot,
               builder: (context, snapshot) {
                 if(!snapshot.hasData){
                  return Center(
                     child: CircularProgressIndicator(),
                   );
                 }else{
                 return GridView.builder(
                   shrinkWrap: true,
                   physics: ClampingScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                 crossAxisCount: 8,
                ),
                itemCount: snapshot.data.docs.length,
                itemBuilder: (context,i){
                  var doc = snapshot.data.docs[i].data();
                   var key = snapshot.data.docs[i].id;
                  return Category(
                    keys: key,
                    condtion: 1,
                    img: doc['img'],
                    name: doc['category_name'],
                    uid: widget.uid,
                  );
                },
                 );
               }
               }
             ),
           )
                  ],
                ),
              ),
            ),
             Container(
              margin: EdgeInsets.only(top: 10.0),
              padding: const EdgeInsets.all(10.0),
              child: Card(
                child: Column(
                  children: <Widget>[
                    Container(
             color: Colors.black,
               width: MediaQuery.of(context).size.width,
                      child: new Padding(
                 padding: EdgeInsets.all(20.0),
                child: new Text("Selected Categoryes",style:TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20.00,),textAlign: TextAlign.start,),
              ),
           ),
           Padding(
             padding: EdgeInsets.all(10.0),
             child: StreamBuilder(
               stream: store.collection('Selected category').where('uid', '==', widget.uid).onSnapshot,
               builder: (context, snapshot) {
                 if(!snapshot.hasData){
                  return Center(
                     child: CircularProgressIndicator(),
                   );
                 }else{
                 return GridView.builder(
                   shrinkWrap: true,
                   physics: ClampingScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                 crossAxisCount: 8,
                ),
                itemCount: snapshot.data.docs.length,
                itemBuilder: (context,i){
                  var doc = snapshot.data.docs[i].data();
                  var key = snapshot.data.docs[i].id;
                  return Category(
                    keys: key,
                    condtion: 2,
                    img: doc['img'],
                    name: doc['category_name'],
                    uid: widget.uid,
                  );
                },
                 );
               }
               }
             ),
           )
                  ],
                ),
              ),
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Card(
                  child: Column(
                    children: <Widget>[
                      Container(
             color: Colors.black,
               width: MediaQuery.of(context).size.width,
                      child: new Padding(
                 padding: EdgeInsets.all(20.0),
                child: new Text("Add Category",style:TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20.00,),textAlign: TextAlign.start,),
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
                ): Image.network(text,fit: BoxFit.cover,)
              ),
            ),
           ),
           Product_form(
             title: 'Title :',
             filed: TextField(
                      controller: _titleController,
                     decoration: InputDecoration(
                       labelText: 'Category Title',
                       border: OutlineInputBorder(
                         borderSide: BorderSide(color: Colors.black)
                       ),
                     ),
                   ),
           ),
            Dividers(),
              Padding(
                    padding: EdgeInsets.all(15.0),
                    child: new Align(
                      alignment: Alignment.topRight,
                      child: FlatButton(
                        color: Colors.blueAccent,
                        child: Text("Create",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,),),
                        onPressed: (){
                    category_add(
                      widget.uid,
                      _titleController.text,
                      text,
                      context
                      );
                      Timer.periodic(Duration(seconds: 3), (Timer t){
                        setState(() {
                        _titleController.clear();
                        text = '';
                      });
                      t.cancel();
                      });
                          
                        },
                      ),
                    ),
                  ),
                    ],
                  ),
                ),
              ),
            )
          ],
        )
      ),
    );
  }
  
}