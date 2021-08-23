import 'package:flutter/material.dart';
import 'package:gazal/models/user_details.dart';

import 'package:gazal/pages/base_page.dart';
import 'package:gazal/models/apiService.dart';
import 'package:gazal/models/order_test.dart';
import 'package:gazal/models/database.dart';
import 'package:gazal/models/users.dart';

// ignore: must_be_immutable
class OrderComplete extends BasePage {
  OrderComplete({
    Key key,
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.password,
  }) : super(key: key);

  int id;
  String firstName;
  String lastName;
  String email;
  String phone;
  String password;

  @override
  _OrderCompleteState createState() => _OrderCompleteState();

  UserDetails ud = new UserDetails();
}

class _OrderCompleteState extends BasePageState<OrderComplete> {
  APIService apiService = new APIService();
  OrderDetails orderDetails;
  User user;
  String name;
  void initState() {
    orderDetails = new OrderDetails();
    super.initState();
  }

  Widget pageUI() {
    return _productsList();
  }

  Widget _productsList() {
    return new FutureBuilder(
        future: SQLiteDbProvider.db.getAllUsers(),
        builder: (BuildContext context, AsyncSnapshot<List<User>> model) {
          if (model.hasData) {
            return _buildList(model.data);
          }
          return Center(child: CircularProgressIndicator());
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

              return Container(
                  margin: EdgeInsets.all(7),
                  padding: EdgeInsets.all(5),
                  color: Color.fromRGBO(30, 30, 30, 1),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(border: Border.all()),
                        padding: EdgeInsets.all(10),
                        child: Row(
                          children: [
                            Flexible(
                                flex: 1,
                                fit: FlexFit.tight,
                                child: Container(
                                  padding: EdgeInsets.all(5),
                                  child: Icon(Icons.radio_button_unchecked,
                                      size: 30,
                                      color: Color.fromRGBO(132, 131, 133, 1)),
                                )),
                            Flexible(
                                flex: 6,
                                fit: FlexFit.tight,
                                child: Container(
                                  child: Text(
                                    data.firstName.toString() +
                                        data.id.toString() +
                                        item.length.toString(),
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
