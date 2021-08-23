import 'package:flutter/material.dart';
import 'package:gazal/pages/base_page.dart';
import 'package:gazal/models/users.dart';
import 'package:gazal/models/database.dart';

import 'package:gazal/models/apiService.dart';

// ignore: must_be_immutable
class OrderPage extends BasePage {
  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends BasePageState<OrderPage> {
  APIService apiService = new APIService();

  Widget pageUI() {
    //  return (Container(child: Text(this.widget.categoryid.toString())));

    return _productsList();
  }

  Widget _productsList() {
    return Container(
        color: Colors.black,
        // color: Color.fromRGBO(17, 3, 77, 1),
        child: new FutureBuilder(
            future: SQLiteDbProvider.db.getAllUsers(),
            builder: (BuildContext context, AsyncSnapshot<List<User>> model) {
              if (model.hasData) {
                return _buildList(model.data);
              }
              return Center(child: CircularProgressIndicator());
            }));
  }
// Widget _buildList(List<Product> items){
// return Container(
// height:200,
// child:ListView.builder(
// shrinkWrap: true,
// physics: ClampingScrollPhysics(),
// scrollDirection: Axis.horizontal,
// itemCount: items.length,
// itemBuilder: (context, index){
// var data=items[index];
// return ProductCard(data:data,);

// }

// )

// );

// }

  Widget _buildList(List<User> item) {
    return Container(
        alignment: Alignment.centerLeft,
        child: ListView.builder(
            shrinkWrap: true,
            physics: ClampingScrollPhysics(),
            scrollDirection: Axis.vertical,
            itemCount: item.length,
            itemBuilder: (context, index) {
              var data = item[index];

              return Container(
                  margin: EdgeInsets.all(7),
                  padding: EdgeInsets.all(5),
                  color: Color.fromRGBO(30, 30, 30, 1),
                  // color: Color.fromRGBO(46, 22, 148, 1),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                                // color: Color.fromRGBO(54, 54, 54, 1),
                                )),

                        // color: Color.fromRGBO(46, 22, 148, 1))),
                        padding: EdgeInsets.all(10),
                        child: Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Flexible(
                                flex: 1,
                                fit: FlexFit.tight,
                                child: Container(
                                  padding: EdgeInsets.all(5),
                                  child: Icon(Icons.phonelink_setup,
                                      size: 30,
                                      color: Color.fromRGBO(132, 131, 133, 1)),

                                  // color: Colors.blueAccent[100]),
                                )),
                            Flexible(
                                flex: 6,
                                fit: FlexFit.tight,
                                child: Container(
                                  child: Text(
                                    data.firstName.toString(),
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        fontFamily: "Roboto Condensed",
                                        fontWeight: FontWeight.w600,
                                        color:
                                            Color.fromRGBO(132, 131, 133, 1)),

                                    // color: Colors.blueAccent[100]),
                                  ),
                                )),
                            Flexible(
                                flex: 1,
                                fit: FlexFit.tight,
                                child: Container(
                                  child: Icon(Icons.arrow_right,
                                      size: 30,
                                      color: Color.fromRGBO(132, 131, 133, 1)),
                                )),
                          ],
                        ),
                      ),
                    ],
                  ));
            }));
  }
}
