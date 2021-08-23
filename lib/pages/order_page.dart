import 'package:flutter/material.dart';
import 'package:gazal/models/apiService.dart';
import 'package:gazal/models/order_test.dart';
import 'package:gazal/utils/ProgressHUD.dart';
import 'package:gazal/utils/form_helper.dart';
import 'package:gazal/pages/home_page.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

// ignore: must_be_immutable
class OrderPage extends StatefulWidget {
  OrderPage({
    Key key,
    this.productId,
    this.productName,
    this.attrubiteId,
    this.attrubiteName,
    this.phone,
  }) : super(key: key);
  String productId;
  String productName;
  String attrubiteId;
  String attrubiteName;
  String phone;
  String city = "Dubai";
  String country = "country";
  String poscode = "2321";
  String address_1 = "new address 1";
  String address_2 = "new address 2";
  @override
  _OrderPageState createState() => _OrderPageState();
}

bool setpaid = false;
String firtName;
String lastName;
String address_1;
String address_2;
String country = "UAE";
String city = "dubai";
String state = '-';
String postcode = '22223';
String email;
String phone;

class _OrderPageState extends State<OrderPage> {
  GlobalKey _bottomNavigationKey = GlobalKey();
  APIService apiService;
  OrderDetails modeldetails;
  GlobalKey<FormState> globalKey = new GlobalKey();
  bool hidepassword = true;
  bool isApiCallProcess = false;
  @override
  void initState() {
    apiService = new APIService();
    modeldetails = new OrderDetails();
    super.initState();
  }

  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        centerTitle: false,
        brightness: Brightness.dark,
        elevation: 0,
        backgroundColor: Colors.black,
        title: Container(
          child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            Image.asset("images/logo2.jpg"),
            Text(
              "Gazal Service",
              style: TextStyle(
                  fontFamily: "Roboto Condensed",
                  fontWeight: FontWeight.w800,
                  color: Colors.white,
                  fontSize: 18),
            ),
          ]),
        ),
        actions: <Widget>[
          Icon(Icons.login_sharp, color: Colors.blue.shade200),
          SizedBox(width: 10),
          Icon(Icons.search, color: Colors.blue.shade200),
          SizedBox(width: 10),
        ],
      ),
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        index: 0,
        height: 50.0,
        items: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => HomePage()));
            },
            child: Icon(
              Icons.home,
              size: 30,
              color: Color.fromRGBO(17, 3, 77, 1),
            ),
          ),
          Icon(
            Icons.tab,
            size: 30,
            color: Color.fromRGBO(17, 3, 77, 1),
          ),
          Icon(
            Icons.mobile_friendly,
            size: 30,
            color: Color.fromRGBO(17, 3, 77, 1),
          ),
          Icon(
            Icons.point_of_sale,
            size: 30,
            color: Color.fromRGBO(17, 3, 77, 1),
          ),
          Icon(
            Icons.perm_identity,
            size: 30,
            color: Color.fromRGBO(17, 3, 77, 1),
          ),
        ],
        color: Colors.white,
        buttonBackgroundColor: Colors.blueAccent.shade100,
        backgroundColor: Color.fromRGBO(17, 3, 77, 1),
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 600),
        // onTap: (index) {
        //   setState(() {
        //     _page = index;
        //   });
        // },
        // letIndexChange: (index) => true,
      ),
      body: Container(
        color: Colors.black54,
        child: ListView(children: <Widget>[
          Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                // color: const Color(0xff7c94b6),
                // color: Colors.black,

                border: Border.all(
                  color: Color.fromRGBO(87, 198, 255, 1),
                  width: 0,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        child: Text(
                            "Mobile Repair At Your Doorste In 4 Easy Steps",
                            style: TextStyle(
                              fontFamily: "Roboto Condensed",
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: Colors.blue.shade100,
                            ))),
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
                              color: Colors.green, semanticLabel: 'Semantics'),
                        ))),
                    Flexible(
                        flex: 1,
                        fit: FlexFit.tight,
                        child: Container(
                            child: Center(
                          child: Icon(Icons.rotate_right,
                              color: Colors.blueAccent,
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
                                width: 1,
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
                                width: 1,
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
                                width: 1,
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
                                        fontSize: 12,
                                        color: Colors.blue.shade300))))),
                    Flexible(
                        flex: 1,
                        fit: FlexFit.tight,
                        child: Container(
                            child: Center(
                                child: Text("2.Tab Your Model",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontFamily: "Roboto Condensed",
                                        fontSize: 12,
                                        color: Colors.blue.shade300))))),
                    Flexible(
                        flex: 1,
                        fit: FlexFit.tight,
                        child: Container(
                            child: Center(
                                child: Text("3.Tab Your Issue",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontFamily: "Roboto Condensed",
                                        fontSize: 12,
                                        color: Colors.blue.shade300))))),
                    Flexible(
                        flex: 1,
                        fit: FlexFit.tight,
                        child: Container(
                            child: Center(
                                child: Text("4.Booking",
                                    style: TextStyle(
                                        fontFamily: "Roboto Condensed",
                                        fontSize: 12,
                                        color: Colors.blue.shade300))))),
                  ]),
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(10),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      child: Text("Booking",
                          style: TextStyle(
                            fontFamily: "Roboto Condensed",
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: Colors.blue.shade100,
                          ))),
                  Container(
                    child: Icon(
                      Icons.book_online,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ]),
          ),
          ProgressHUD(
            child: new Form(
              key: globalKey,
              child: _formUI(),
            ),
            inAsyncCall: isApiCallProcess,
            opacity: 0.3,
          ),
        ]),
      ),
    );
  }

  Widget _formUI() {
    modeldetails.productID = this.widget.productId;
    modeldetails.attrubiteID = this.widget.attrubiteId;
    modeldetails.quantity = "1";
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Container(
            child: Align(
          alignment: Alignment.topLeft,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              FormHelper.fieldLabel("First Name"),
// ignore: sdk_version_set_literal
              FormHelper.textInput(
                  context,
                  modeldetails.firtName,
                  (value) => {
                        modeldetails.firtName = value,
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
                  modeldetails.lastName,
                  (value) => {
                        modeldetails.lastName = value,
                      }, onValidate: (value) {
                if (value.toString().isEmpty) {
                  return "Please enter Last Name";
                }
                return null;
              }),

              FormHelper.fieldLabel("Address 1"),
// ignore: sdk_version_set_literal
              FormHelper.textInput(
                  context,
                  modeldetails.address_1,
                  (value) => {
                        modeldetails.address_1 = value,
                      }, onValidate: (value) {
                if (value.toString().isEmpty) {
                  return "Please enter Last Name";
                }
                return null;
              }),

              FormHelper.fieldLabel("Address 2"),
// ignore: sdk_version_set_literal
              FormHelper.textInput(
                  context,
                  modeldetails.address_2,
                  (value) => {
                        modeldetails.address_2 = value,
                      }, onValidate: (value) {
                if (value.toString().isEmpty) {
                  return "Please enter Last Name";
                }
                return null;
              }),

              FormHelper.fieldLabel(
                "Emirates",
              ),
// ignore: sdk_version_set_literal
              FormHelper.textInput(
                  context,
                  modeldetails.city,
                  (value) => {
                        modeldetails.city = value,
                      }, onValidate: (value) {
                if (value.toString().isEmpty) {
                  return "Please enter Last Name";
                }
                return null;
              }),

              FormHelper.fieldLabel("Email"),
// ignore: sdk_version_set_literal
              FormHelper.textInput(
                  context,
                  modeldetails.email,
                  (value) => {
                        modeldetails.email = value,
                      }, onValidate: (value) {
                if (value.toString().isEmpty) {
                  return "Please enter Valid Email Address";
                }

                return null;
              }),

              FormHelper.fieldLabel("Contact Number"),
// ignore: sdk_version_set_literal
              FormHelper.textInput(
                  context,
                  modeldetails.phone,
                  (value) => {
                        modeldetails.phone = value,
                      }, onValidate: (value) {
                if (value.toString().isEmpty) {
                  return "Please enter Phone Number";
                }

                return null;
              }),

              SizedBox(
                height: 20,
              ),
              Container(
                child: Center(
                    child: FormHelper.saveButton("Book An Appointment", () {
                  if (valideAndSave()) {
                    print(modeldetails.toJson());
                    setState(() {
                      isApiCallProcess = true;
                    });
                    apiService.createCustomerDetails(email, email).then((ret) {
                      setState(() {
                        isApiCallProcess = false;
                      });
                      // if (ret) {
                      //   FormHelper.showMessage(
                      //     context,
                      //     "Gazal",
                      //     "Registration Sucessful",
                      //     "Ok",
                      //     () {
                      //       Navigator.of(context).pop();
                      //     },
                      //   );
                      // } else {
                      //   FormHelper.showMessage(
                      //     context,
                      //     "Gazal",
                      //     "Email ID Already Registerd",
                      //     "ok",
                      //     () {
                      //       Navigator.of(context).pop();
                      //     },
                      //   );
                      // }
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

  bool valideAndSave() {
    final form = globalKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }
}
