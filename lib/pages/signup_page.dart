import 'package:flutter/material.dart';
import 'package:gazal/models/apiService.dart';
import 'package:gazal/models/customer.dart';
import 'package:gazal/pages/home_page.dart';
import 'package:gazal/pages/home_pagess.dart';
import 'package:gazal/pages/Category_page.dart';
import 'package:share/share.dart';
import 'package:gazal/pages/aboutus.dart';
import 'package:gazal/pages/home_pages.dart';

import 'package:gazal/utils/ProgressHUD.dart';
import 'package:gazal/utils/form_helper.dart';
import 'package:gazal/models/database.dart';
import 'package:gazal/models/users.dart';
import 'package:gazal/models/orderRetrive.dart';

// ignore: must_be_immutable
class SignupPage extends StatefulWidget {
  SignupPage({
    Key key,
    this.productId,
    this.productName,
    this.attrubiteId,
    this.attrubiteName,
  }) : super(key: key);

  String productId;
  String productName;
  String attrubiteId;
  String attrubiteName;
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  String firstName;
  String lastName;
  String phone;
  String email;
  String password;
  int customerid = 0;
  APIService apiService;
  CustomerModel model;
  GlobalKey<FormState> globalKey = new GlobalKey();
  bool hidepassword = true;
  bool isApiCallProcess = false;
  @override
  void initState() {
    apiService = new APIService();
    model = new CustomerModel();
    super.initState();
  }

  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.black,
      appBar: _buildAppbar(),

      bottomNavigationBar: BottomAppBar(

        color: Color.fromRGBO(60, 60, 60, 1),
        child:
        _buttomBar(),
      ),

      body: ProgressHUD(
        child: new Form(
          key: globalKey,
          child: _productsList(),
        ),
        inAsyncCall: isApiCallProcess,
        opacity: 0.3,
      ),
    );
  }

  Widget _formUI() {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Container(
            child: Align(
          alignment: Alignment.topLeft,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      child: Text(
                    "Booking Details",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontSize: 16,
                        fontFamily: "Roboto Condensed",
                        fontWeight: FontWeight.w600,
                        color: Colors.lightBlueAccent),
                  )),
                  Container(
                      child: Icon(
                    Icons.arrow_circle_down,
                    size: 20,
                    color: Colors.lightBlueAccent,
                  )),
                ],
              ),

              FormHelper.fieldLabel("First Name"),
// ignore: sdk_version_set_literal
              FormHelper.textInput(
                  context,
                  model.firstName,
                  (value) => {
                        this.model.firstName = value,
                      }, onValidate: (value) {
                if (value.toString().isEmpty) {
                  return "Please enter First Name";
                }
                return null;
              }),

              FormHelper.fieldLabel("Last Name"),
// ignore: sdk_version_set_literal
              FormHelper.textInput(
                  context,
                  model.lastName,
                  // "model.lastName",
                  (value) => {
                        this.model.lastName = value,
                      }, onValidate: (value) {
                if (value.toString().isEmpty) {
                  return "Please enter Last Name";
                }
                return null;
              }),

              FormHelper.fieldLabel("Contact Number"),
// ignore: sdk_version_set_literal
              FormHelper.textInput(
                  context,
                  model.phone,
                  (value) => {
                        model.phone = value,
                      }, onValidate: (value) {
                if (value.toString().isEmpty) {
                  return "Please enter Your Contact Number";
                }
                return null;
              }),

              FormHelper.fieldLabel("Email"),
// ignore: sdk_version_set_literal
              FormHelper.textInput(
                  context,
                  model.email,
                  (value) => {
                        this.model.email = value,
                      }, onValidate: (value) {
                if (value.toString().isEmpty) {
                  return "Please enter Valid Email Address";
                }
                return null;
              }),

              FormHelper.fieldLabel("Password"),
// ignore: sdk_version_set_literal
              FormHelper.textInput(
                context,
                model.password,
                (value) => {
                  this.model.password = value,
                },
                onValidate: (value) {
                  if (value.toString().isEmpty) {
                    return "Please enter password";
                  }
                  return null;
                },
                obscureText: hidepassword,
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      hidepassword = !hidepassword;
                    });
                  },
                  color: Theme.of(context).accentColor.withOpacity(0.4),
                  icon: Icon(
                      hidepassword ? Icons.visibility_off : Icons.visibility),
                ),
              ),

              SizedBox(
                height: 20,
              ),

              Container(
                child: Center(
                    child: FormHelper.saveButton("Register", () {
                  if (valideAndSave()) {
                    print(model.tojson());
                    setState(() {
                      isApiCallProcess = true;
                    });
                    apiService
                        .createCustomer(
                      model,
                      this.widget.attrubiteId,
                      this.widget.productId,
                      this.widget.productName,
                      this.widget.attrubiteName,
                    )
                        .then((ret) {
                      setState(() {
                        isApiCallProcess = false;
                      });
                      if (ret) {
                        FormHelper.showMessage(
                            context, "Gazal", "Registration Sucessful", "Ok",
                            () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomePagess()));
                        });
                      } else {
                        FormHelper.showMessage(
                          context,
                          "Gazal",
                          "Email ID Already Registerd",
                          "ok",
                          () {
                            Navigator.of(context).pop();
                          },
                        );
                      }
                    });
                  }
                })),
              ),
            ],
          ),
        )),
      ),
    );
  }

  Widget _formUI2() {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Container(
            child: Align(
          alignment: Alignment.topLeft,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    // color: const Color(0xff7c94b6),
                    // color: Colors.black,

                    border: Border.all(
                      // color: Color.fromRGBO(87, 198, 255, 1),
                      width: 0,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Container(
                        child: Center(
                            child: Text(
                                "Mobile Repair Booking At Your Doorstep In \n 4 Easy Steps",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: "Roboto Condensed",
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                  color: Colors.amber,
                                )))),
                  ])),

              Column(
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: SizedBox(
                      height: 40,
                      child: Row(children: [
                        Flexible(
                            flex: 1,
                            fit: FlexFit.tight,
                            child: Container(
                                child: Center(
                                  child: Icon(Icons.done,
                                      color: Colors.green, semanticLabel: 'Semantics'),
                                ))),
                        Flexible(
                            flex: 1,
                            fit: FlexFit.tight,
                            child: Container(
                                child: Center(
                                  child: Icon(Icons.done,
                                      color: Colors.green, semanticLabel: 'Semantics'),
                                ))),
                        Flexible(
                            flex: 1,
                            fit: FlexFit.tight,
                            child: Container(
                                child: Center(
                                  child: Icon(Icons.done,
                                      color: Colors.amber, semanticLabel: 'Semantics'),
                                ))),
                        Flexible(
                            flex: 1,
                            fit: FlexFit.tight,
                            child: Container(
                                child: Center(
                                  child: Icon(Icons.rotate_right,
                                      color: const Color(0xff7c94b6),
                                      semanticLabel: 'Semantics'),
                                ))),
                      ]),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: SizedBox(
                      height: 5,
                      child: Row(
                        children: [
                          Flexible(
                              flex: 1,
                              fit: FlexFit.tight,
                              child: Container(
                                decoration: BoxDecoration(
                                  // color: const Color(0xff7c94b6),
                                  // color: Colors.black,
                                  color: Colors.green,

                                  border: Border.all(
                                    color: Color.fromRGBO(87, 198, 255, 1),
                                    width: 0,
                                  ),
                                ),
                              )),
                          Flexible(
                              flex: 1,
                              fit: FlexFit.tight,
                              child: Container(
                                decoration: BoxDecoration(
                                  // color: const Color(0xff7c94b6),
                                  // color: Colors.black,
                                  color: Colors.green,

                                  border: Border.all(
                                    color: Color.fromRGBO(87, 198, 255, 1),
                                    width: 0,
                                  ),
                                ),
                              )),
                          Flexible(
                              flex: 1,
                              fit: FlexFit.tight,
                              child: Container(
                                decoration: BoxDecoration(
                                  // color: const Color(0xff7c94b6),
                                  color: Colors.green,

                                  border: Border.all(
                                    color: Color.fromRGBO(87, 198, 255, 1),
                                    width: 0,
                                  ),
                                ),
                              )),
                          Flexible(
                              flex: 1,
                              fit: FlexFit.tight,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: const Color(0xff7c94b6),
                                  // color: Colors.black,

                                  border: Border.all(
                                    color: Color.fromRGBO(87, 198, 255, 1),
                                    width: 0,
                                  ),
                                ),
                              )),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: SizedBox(
                      height: 50,
                      child: Row(children: [
                        Flexible(
                            flex: 1,
                            fit: FlexFit.tight,
                            child: Container(
                                child: Center(
                                    child: Text("1.Tab your Brand",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontFamily: "Roboto Condensed",
                                          fontSize: 13,
                                          color: Color.fromRGBO(132, 131, 133, 1),

                                          // color: Colors.blue.shade300
                                        ))))),
                        Flexible(
                            flex: 1,
                            fit: FlexFit.tight,
                            child: Container(
                                child: Center(
                                    child: Text("2.Tab Your Model",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontFamily: "Roboto Condensed",
                                          fontSize: 13,
                                          color: Color.fromRGBO(132, 131, 133, 1),

                                          // color: Colors.blue.shade300
                                        ))))),
                        Flexible(
                            flex: 1,
                            fit: FlexFit.tight,
                            child: Container(
                                child: Center(
                                    child: Text("3.Tab Your Issue",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontFamily: "Roboto Condensed",
                                          fontSize: 13,
                                          color: Color.fromRGBO(132, 131, 133, 1),

                                          // color: Colors.blue.shade300
                                        ))))),
                        Flexible(
                            flex: 1,
                            fit: FlexFit.tight,
                            child: Container(
                                child: Center(
                                    child: Text("4.Booking",
                                        style: TextStyle(
                                          fontFamily: "Roboto Condensed",
                                          fontSize: 13,
                                          // color: Colors.blue.shade300
                                          color: Color.fromRGBO(132, 131, 133, 1),
                                        ))))),
                      ]),
                    ),
                  ),
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

              SizedBox(
                height: 50,
              ),

              Container(
                child: Center(
                    child: FormHelper.saveButton("Tab for Booking", () {
                  if (valideAndSave()) {
                    print(model.tojson());
                    setState(() {
                      isApiCallProcess = true;
                    });
                    apiService.createOrder2(customerid, firstName, lastName, phone,
                        email, this.widget.attrubiteId, this.widget.attrubiteName, this.widget.productId, this.widget.productName)


                        .then((ret) {
                      setState(() {
                        isApiCallProcess = false;
                      });
                      if (ret) {
                        FormHelper.showMessage(
                            context, "Gazal", "Registration Sucessful", "Ok",
                            () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomePagess()));
                        });
                      } else {
                        FormHelper.showMessage(
                          context,
                          "Gazal",
                          "Email ID Already Registerd",
                          "ok",
                          () {
                            Navigator.of(context).pop();
                          },
                        );
                      }
                    });
                  }
                })),
              ),
            ],
          ),
        ]),
      ),
    )));
  }

  bool valideAndSave() {
    final form = globalKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  //retrive customer

  Widget _productsList() {
    print("working with customerid newd" + customerid.toString());

    return new FutureBuilder(
        future: SQLiteDbProvider.db.getAllUsers(),
        builder: (BuildContext context, AsyncSnapshot<List<User>> modelhay) {
          // customer = modelhay.data.first.id;

          if (modelhay.hasData) {
            if (modelhay.data.length != 0) {
              customerid = modelhay.data.first.id;
              password = modelhay.data.first.password;
              print("data is there");
              return _productsList2(customerid);
              }
            else{

              return _formUI();

            }
          } else {
            return _formUI();
          }

          return Center(child: CircularProgressIndicator());
        });
  }

  Widget _updateOrder(int newID, String firstName2, String lastName2,
      String phone2, String email2, String attId, attName, proId, proName) {
  bool data=false;
    return new FutureBuilder(
        future: apiService.createOrder2(newID, firstName2, lastName2, phone2,
            email2, attId, attName, proId, proName).then((ret){
setState(() {
print (ret);
  data=true;
return _nextpage();

});
              }),

        builder:
            (BuildContext context, AsyncSnapshot model) {
          // customer = modelhay.data.first.id;


          if (data=true) {
            return _nextpage();
          }

          return Center(child: CircularProgressIndicator());
        });
  }

//retrive product

  Widget _productsList2(int customerid) {
    print("yea hay lisf" + customerid.toString());
    return Container(
        color: Colors.black,
        // color: Color.fromRGBO(17, 3, 77, 1),
        child: new FutureBuilder(
            future: apiService.getOrder(customerid),
            builder: (BuildContext context,
                AsyncSnapshot<List<OrderRetrive>> modelhay) {
              if (modelhay.hasData) {
                return _buildorderList(modelhay.data);
              }
              return Center(child: CircularProgressIndicator());
            }));
  }

  Widget _buildorderList(List<OrderRetrive> item) {
    return Container(
        color: Colors.black,
        alignment: Alignment.centerLeft,
        child: ListView.builder(
            shrinkWrap: true,
            physics: ClampingScrollPhysics(),
            scrollDirection: Axis.vertical,
            itemCount: 1,
            itemBuilder: (context, index) {
              var data = item[index];

              firstName = data.billing.firstName;
              lastName = data.billing.lastName;
              email = data.billing.email;
              phone = data.billing.phone;

              return _formUI2();

              // return _updateOrder(
              //     customerid,
              //     firstName,
              //     lastName,
              //     phone,
              //     email,
              //     this.widget.attrubiteId,
              //     this.widget.attrubiteName,
              //     this.widget.productId,
              //     this.widget.productName);
            }));
  }

  //go to nex page

  Widget _nextpage() {
    return Container(
        color: Colors.black,
        child: ListView(children: <Widget>[
          Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                // color: const Color(0xff7c94b6),
                // color: Colors.black,

                border: Border.all(
                  // color: Color.fromRGBO(87, 198, 255, 1),
                  width: 0,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Container(
                    child: Center(
                        child: Text(
                            "Mobile Repair Booking At Your Doorstep In \n 4 Easy Steps",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: "Roboto Condensed",
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: Colors.amber,
                            )))),
              ])),

          Column(
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: SizedBox(
                  height: 40,
                  child: Row(children: [
                    Flexible(
                        flex: 1,
                        fit: FlexFit.tight,
                        child: Container(
                            child: Center(
                          child: Icon(Icons.done,
                              color: Colors.green, semanticLabel: 'Semantics'),
                        ))),
                    Flexible(
                        flex: 1,
                        fit: FlexFit.tight,
                        child: Container(
                            child: Center(
                          child: Icon(Icons.done,
                              color: Colors.green,
                              // color: const Color(0xff7c94b6),
                              semanticLabel: 'Semantics'),
                        ))),
                    Flexible(
                        flex: 1,
                        fit: FlexFit.tight,
                        child: Container(
                            child: Center(
                          child: Icon(Icons.done,
                              color: Colors.green,

                              // color: const Color(0xff7c94b6),
                              semanticLabel: 'Semantics'),
                        ))),
                    Flexible(
                        flex: 1,
                        fit: FlexFit.tight,
                        child: Container(
                            child: Center(
                          child: Icon(Icons.rotate_right,
                              color: Colors.amber,

                              // color: Colors.grey,
                              semanticLabel: 'Semantics'),
                        ))),
                  ]),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: SizedBox(
                  height: 5,
                  child: Row(
                    children: [
                      Flexible(
                          flex: 1,
                          fit: FlexFit.tight,
                          child: Container(
                            decoration: BoxDecoration(
                              // color: const Color(0xff7c94b6),
                              // color: Colors.black,
                              color: Colors.green,

                              border: Border.all(
                                // color: Color.fromRGBO(87, 198, 255, 1),
                                width: 0,
                              ),
                            ),
                          )),
                      Flexible(
                          flex: 1,
                          fit: FlexFit.tight,
                          child: Container(
                            decoration: BoxDecoration(
                              // color: const Color(0xff7c94b6),
                              // color: Colors.black,
                              // color: const Color(0xff7c94b6),
                              color: Colors.green,

                              border: Border.all(
                                // color: Color.fromRGBO(87, 198, 255, 1),
                                width: 0,
                              ),
                            ),
                          )),
                      Flexible(
                          flex: 1,
                          fit: FlexFit.tight,
                          child: Container(
                            decoration: BoxDecoration(
                              // color: const Color(0xff7c94b6),
                              // color: Colors.black,
                              color: Colors.green,

                              // color: const Color(0xff7c94b6),
                              border: Border.all(
                                // color: Color.fromRGBO(87, 198, 255, 1),
                                width: 0,
                              ),
                            ),
                          )),
                      Flexible(
                          flex: 1,
                          fit: FlexFit.tight,
                          child: Container(
                            decoration: BoxDecoration(
                              // color: const Color(0xff7c94b6),
                              // color: Colors.black,
                              // color: const Color(0xff7c94b6),
                              color: Colors.amber,

                              border: Border.all(
                                // color: Color.fromRGBO(87, 198, 255, 1),
                                width: 0,
                              ),
                            ),
                          )),
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: SizedBox(
                  height: 50,
                  child: Row(children: [
                    Flexible(
                        flex: 1,
                        fit: FlexFit.tight,
                        child: Container(
                            child: Center(
                                child: Text("1.Tab your Brand",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontFamily: "Roboto Condensed",
                                      fontSize: 13,
                                      color: Color.fromRGBO(132, 131, 133, 1),

                                      // color: Colors.blue.shade300
                                    ))))),
                    Flexible(
                        flex: 1,
                        fit: FlexFit.tight,
                        child: Container(
                            child: Center(
                                child: Text("2.Tab Your Model",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontFamily: "Roboto Condensed",
                                      fontSize: 13,
                                      color: Color.fromRGBO(132, 131, 133, 1),

                                      // color: Colors.blue.shade300
                                    ))))),
                    Flexible(
                        flex: 1,
                        fit: FlexFit.tight,
                        child: Container(
                            child: Center(
                                child: Text("3.Tab Your Issue",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontFamily: "Roboto Condensed",
                                      fontSize: 13,
                                      color: Color.fromRGBO(132, 131, 133, 1),

                                      // color: Colors.blue.shade300
                                    ))))),
                    Flexible(
                        flex: 1,
                        fit: FlexFit.tight,
                        child: Container(
                            child: Center(
                                child: Text("4.Booking",
                                    style: TextStyle(
                                      fontFamily: "Roboto Condensed",
                                      fontSize: 13,
                                      // color: Colors.blue.shade300
                                      color: Color.fromRGBO(132, 131, 133, 1),
                                    ))))),
                  ]),
                ),
              ),
            ],
          ),

//end here
          Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(10),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      child: Text("Successfully Submited",
                          style: TextStyle(
                            fontFamily: "Roboto Condensed",
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: Colors.lightBlueAccent,
                          ))),
                  Container(
                    child: Icon(
                      Icons.done,
                      color: Colors.lightBlueAccent,
                      size: 40,
                    ),
                  ),
                ]),
          ),

//Product Apple
          GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomePagess()));
              },
              child: Container(
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(40, 40, 40, 1),
                    // border: Border.all(

                    //     // color: Color.fromRGBO(54, 54, 54, 1),
                    //     ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Container(
                        // padding: EdgeInsets.all(10),
                        child: Row(
                          children: [
                            Flexible(
                                flex: 1,
                                fit: FlexFit.tight,
                                child: Container(
                                  padding: EdgeInsets.all(5),
                                  child: Icon(Icons.mobile_friendly,
                                      size: 20, color: Colors.lightBlueAccent

                                      // color: Color.fromRGBO(132, 131, 133, 1)
                                      ),
                                )),
                            Flexible(
                                flex: 6,
                                fit: FlexFit.tight,
                                child: Container(
                                  child: Text(
                                    "Tab Your Order here",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        fontFamily: "Roboto Condensed",
                                        fontWeight: FontWeight.w600,
                                        color:
                                            Color.fromRGBO(132, 131, 133, 1)),
                                  ),
                                )),
                            Flexible(
                                flex: 1,
                                fit: FlexFit.tight,
                                child: Container(
                                  child: Icon(Icons.arrow_right,
                                      size: 20, color: Colors.lightBlueAccent

                                      // color: Color.fromRGBO(132, 131, 133, 1)
                                      ),
                                )),
                          ],
                        ),
                      ),
                    ],
                  ))),
          //Product Sumsung
        ]));
//Product Sumsung
  }

  Widget _buttomBar()
  {

    return   Container(child:

    Row(
        children: [

          Flexible(
              flex: 1,
              fit: FlexFit.tight,
              child: Container(
                height: 60,
                margin: EdgeInsets.all(2),
                padding: EdgeInsets.all(2),
                decoration: BoxDecoration(
                  color: Colors.amber,
                  // color: Color.fromRGBO(40, 40, 40, 1),
                  border: Border.all(width: 1,
                    color: Color.fromRGBO(40, 40, 40, 1),
                  ),
                  borderRadius: BorderRadius.circular(10.0),

                ),
                child: Center(
                    child:

                    MaterialButton(
                      padding: EdgeInsets.all(0),
                      minWidth: 0,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomePage()));                                },
                      child:
                      Container(child:
                      Column(children: [
                        Icon(Icons.update,
                            color: Colors.black, semanticLabel: 'Semantics'),
                        SizedBox(height: 5),
                        Container(child:
                        Text("Booking",
                          style: TextStyle(
                            fontFamily: "Roboto Condensed",
                            fontWeight: FontWeight.bold,
                            fontSize: 11,
                            color: Colors.black,

                          ),

                        ),
                        )   ],)),
                    )),
              )),

          //Second one

          Flexible(
              flex: 1,
              fit: FlexFit.tight,
              child: Container(
                height: 60,
                margin: EdgeInsets.all(2),
                padding: EdgeInsets.all(2),
                decoration: BoxDecoration(
                  color: Colors.lightBlueAccent,
                  // color: Color.fromRGBO(40, 40, 40, 1),
                  border: Border.all(width: 1,
                    color: Color.fromRGBO(40, 40, 40, 1),
                  ),                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Center(
                    child:

                    MaterialButton(
                      padding: EdgeInsets.all(0),
                      minWidth: 0,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomePages()));                                },
                      child:
                      Container(child:
                      Column(children: [
                        Icon(Icons.tap_and_play,
                            color: Colors.black, semanticLabel: 'Semantics'),
                        SizedBox(height: 5),
                        Container(child:
                        Text("Booking Details",
                          style: TextStyle(
                            fontFamily: "Roboto Condensed",
                            fontWeight: FontWeight.bold,
                            fontSize: 11,
                            color: Colors.black,

                          ),

                        ),
                        )   ],)),
                    )),
              )),

          Flexible(
              flex: 1,
              fit: FlexFit.tight,
              child: Container(
                height: 60,
                margin: EdgeInsets.all(2),
                padding: EdgeInsets.all(2),
                decoration: BoxDecoration(
                  color: Colors.lightBlueAccent,
                  // color: Color.fromRGBO(40, 40, 40, 1),
                  border: Border.all(width: 1,
                    color: Color.fromRGBO(40, 40, 40, 1),
                  ),                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Center(
                    child:

                    MaterialButton(
                      padding: EdgeInsets.all(0),
                      minWidth: 0,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AboutUs()));                                },
                      child:
                      Container(child:
                      Column(children: [
                        Icon(Icons.mobile_friendly_sharp,
                            color: Colors.black, semanticLabel: 'Semantics'),
                        SizedBox(height: 5),
                        Container(child:
                        Text("About Gazal",
                          style: TextStyle(
                            fontFamily: "Roboto Condensed",
                            fontWeight: FontWeight.bold,
                            fontSize: 11,
                            color: Colors.black,

                          ),

                        ),
                        )   ],)),
                    )),
              )),


          Flexible(
              flex: 1,
              fit: FlexFit.tight,
              child: Container(
                height: 60,
                margin: EdgeInsets.all(2),
                padding: EdgeInsets.all(2),
                decoration: BoxDecoration(
                  color: Colors.lightBlueAccent,
                  // color: Color.fromRGBO(40, 40, 40, 1),
                  border: Border.all(width: 1,
                    color: Color.fromRGBO(40, 40, 40, 1),
                  ),                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Center(
                    child:

                    MaterialButton(
                      padding: EdgeInsets.all(0),
                      minWidth: 0,
                      onPressed: () {

                        Share.share('check out Gazal  website https://gazal.ae' +
                            "Repair your Mobile at your Doorstep.You can download IOS and" +
                            "Andriod app from Apple store and Google play.");

                      },
                      child:
                      Container(child:
                      Column(children: [
                        Icon(Icons.share,
                            color: Colors.black, semanticLabel: 'Semantics'),
                        SizedBox(height: 5),
                        Container(child:
                        Text("Share App",
                          style: TextStyle(
                            fontFamily: "Roboto Condensed",
                            fontWeight: FontWeight.bold,
                            fontSize: 11,
                            color: Colors.black,

                          ),

                        ),
                        )   ],)),
                    )),
              )),

        ]),
      // )
      //     ])  // buttomBar(),
    );


  }

}

//retrive customer

Widget _buildAppbar() {
  return AppBar(
    centerTitle: false,
    brightness: Brightness.dark,
    elevation: 0,
    backgroundColor: Colors.black,
    title: Container(
      child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
        Image.asset("images/logo2.jpg"),
        Text(
          "Gazal Mobile Care",
          style: TextStyle(
              fontFamily: "Roboto Condensed",
              fontWeight: FontWeight.w800,
              color: Colors.white,
              fontSize: 14),
        ),
      ]),
    ),
    actions: <Widget>[
      IconButton(
        icon: Icon(Icons.login_sharp, color: Colors.blue.shade200),
        onPressed: () {
          Share.share('check out Gazal  website https://gazal.ae' +
              "Repair your Mobile at your Doorstep.You can download IOS and" +
              "Andriod app from Apple store and Google play.");
        },
      )
    ],
  );



  }
