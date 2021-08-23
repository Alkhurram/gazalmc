import 'package:flutter/material.dart';
import 'package:gazal/models/apiService.dart';
import 'package:gazal/models/customer.dart';
import 'package:gazal/pages/orderComplete.dart';
import 'package:gazal/utils/ProgressHUD.dart';
import 'package:gazal/utils/form_helper.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:gazal/pages/base_page.dart';
import 'package:gazal/pages/home_page.dart';

// ignore: must_be_immutable
class SignupPage extends StatefulWidget {
  SignupPage({
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

  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  // int _index = 0;
  bool hasAccount = false;
  int mid;
  String mfirstName;
  String mlastName;
  String memail;
  String mphone;
  String mpassword;
  BasePage basePage = new BasePage();
  // int _page = 0;
  GlobalKey _bottomNavigationKey = GlobalKey();

  APIService apiService;
  CustomerModel model;
  GlobalKey<FormState> globalKey = new GlobalKey();
  TextEditingController controller = TextEditingController();
  bool hidepassword = true;
  bool isApiCallProcess = false;
  @override
  void initState() {
    apiService = new APIService();
    model = new CustomerModel();
    controller = TextEditingController();

    super.initState();
  }

  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.black,
      appBar: _buildAppbar(),
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
              color: Colors.black,
            ),
          ),
          Icon(
            Icons.tab,
            size: 30,
            color: Colors.black,
          ),
          Icon(
            Icons.mobile_friendly,
            size: 30,
            color: Color.fromRGBO(17, 3, 77, 1),
          ),
          Icon(
            Icons.point_of_sale,
            size: 30,
            color: Colors.black,
          ),
          Icon(
            Icons.perm_identity,
            size: 30,
            color: Colors.black,
          ),
        ],
        color: Colors.blue.shade400,
        buttonBackgroundColor: Colors.blue.shade400,
        backgroundColor: Colors.black,
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 600),
        // onTap: (index) {
        //   setState(() {
        //     _page = index;
        //   });
        // },
        // letIndexChange: (index) => true,
      ),
      body: ProgressHUD(
        child: new Form(
          key: globalKey,
          child: _formUI(),
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
                        this.model.phone = value,
                      }, onValidate: (value) {
                if (value.toString().isEmpty) {
                  return "Please enter Contact Number";
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
                            context, "Gazak", "Registration Sucessful", "Ok",
                            () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => OrderComplete(
                                        id: 2,
                                        firstName: model.firstName,
                                        lastName: model.lastName,
                                        email: model.email,
                                        phone: model.phone,
                                        password: model.password,
                                      )));
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
  // else

  bool valideAndSave() {
    final form = globalKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  // Widget _productsList() {
  //   return new FutureBuilder(
  //       future: SQLiteDbProvider.db.getAllUsers(),
  //       builder: (BuildContext context, AsyncSnapshot<List<User>> model) {
  //         if (model.hasData) {
  //           hasAccount = true;

  //           return _buildList(model.data);
  //         }
  //         return Center(child: CircularProgressIndicator());
  //       });
  // }

  // Widget _buildList(List<User> item) {
  //   return Container(
  //       color: Colors.black,
  //       alignment: Alignment.centerLeft,
  //       child: ListView.builder(
  //           shrinkWrap: true,
  //           physics: ClampingScrollPhysics(),
  //           scrollDirection: Axis.vertical,
  //           itemCount: item.length,
  //           itemBuilder: (context, index) {
  //             var data = item[index];
  //             this.mid = data.id;
  //             this.mfirstName = data.firstName;
  //             this.mlastName = data.lastName;
  //             this.mphone = data.phone;
  //             this.memail = data.email;
  //             this.mpassword = data.password;
  //             return Container(
  //                 margin: EdgeInsets.all(7),
  //                 padding: EdgeInsets.all(5),
  //                 color: Color.fromRGBO(30, 30, 30, 1),
  //                 child: Column(
  //                   crossAxisAlignment: CrossAxisAlignment.stretch,
  //                   children: <Widget>[
  //                     Container(
  //                       decoration: BoxDecoration(border: Border.all()),
  //                       padding: EdgeInsets.all(10),
  //                       child: Row(
  //                         children: [
  //                           Flexible(
  //                               flex: 1,
  //                               fit: FlexFit.tight,
  //                               child: Container(
  //                                 padding: EdgeInsets.all(5),
  //                                 child: Icon(Icons.radio_button_unchecked,
  //                                     size: 30,
  //                                     color: Color.fromRGBO(132, 131, 133, 1)),
  //                               )),
  //                           Flexible(
  //                               flex: 6,
  //                               fit: FlexFit.tight,
  //                               child: Container(
  //                                 child: Text(
  //                                   data.firstName.toString() +
  //                                       data.id.toString() +
  //                                       item.length.toString(),
  //                                   textAlign: TextAlign.left,
  //                                   style: TextStyle(
  //                                       fontFamily: "Roboto Condensed",
  //                                       fontWeight: FontWeight.w600,
  //                                       color:
  //                                           Color.fromRGBO(132, 131, 133, 1)),

  //                                   // color: Colors.blueAccent[100]),
  //                                 ),
  //                               )),
  //                           Flexible(
  //                               flex: 1,
  //                               fit: FlexFit.tight,
  //                               child: Container(
  //                                 child: Icon(Icons.arrow_right,
  //                                     size: 30,
  //                                     color: Color.fromRGBO(132, 131, 133, 1)),
  //                               )),
  //                         ],
  //                       ),
  //                     ),
  //                   ],
  //                 ));
  //           }));
  // }

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
    );
  }
}
