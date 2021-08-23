import 'package:flutter/material.dart';
import 'package:gazal/models/apiService.dart';
import 'package:gazal/models/users.dart';
import 'package:gazal/models/database.dart';
// import 'package:gazal/pages/Category_page.dart';
import 'package:gazal/pages/home_page.dart';






class NewHome extends StatefulWidget {
  @override
  _NewHomeState createState() => _NewHomeState();
}

class _NewHomeState extends State<NewHome> {
    APIService apiService = new APIService();

  @override
  Widget build(BuildContext context) {
    return
        // Container(child:
        //
        // Text("workng"),
        // );

      _productsList();
  }

    Widget _productsList() {
      return new FutureBuilder(
          future: SQLiteDbProvider.db.getAllUsers(),
          builder: (BuildContext context, AsyncSnapshot<List<User>> model) {
            if (model.hasData) {
              return _buildList(model.data);
            }
            // else {
            //
            //     Navigator.push(context,
            //       MaterialPageRoute(builder: (context) => CategoryPage()));


            // }
            return Center(


                child: Text("Let's Start"));
          });
    }

    Widget _buildList(List<User> item) {
      print(item.length);
      return Container(
          color: Colors.black,
          alignment: Alignment.centerLeft,
          child: ListView.builder(
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemCount: item.length,
              itemBuilder: (context, index) {
                var data = item[index];

                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomePage(
                    id: data.id,name:data.firstName,email:data.email,
                    )));

                return
                  Center(child:
                  Container(

                    margin: EdgeInsets.all(7),
                    padding: EdgeInsets.all(5),
                  child: Text("Let's Start",
                      style: TextStyle(
                        fontFamily: "Roboto Condensed",
                        fontSize: 18,
                        color: Colors.white,
                      ),


                  ),
                  ));


              }

          ));
    }
}
