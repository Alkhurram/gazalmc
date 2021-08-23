import 'package:flutter/material.dart';
import 'package:gazal/pages/Category_page.dart';
import 'package:gazal/models/database.dart';
import 'package:gazal/models/apiService.dart';
import 'package:gazal/models/orderRetrive.dart';
import 'package:gazal/pages/order_page.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
// import 'package:flutter_open_whatsapp/flutter_open_whatsapp.dart';
import 'package:gazal/pages/product_page.dart';
import 'package:url_launcher/url_launcher.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();

  DashboardPage({Key key}) : super(key: key);
}

_launchweb() async {
  const url = 'https://gazal.ae';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

_launchwhatsapp() async {
  const url = 'https://api.whatsapp.com/send?phone=054221885';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}



_launchface() async {
  const url = 'https://www.facebook.com/AlGazalAE';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

_launchins() async {
  const url = 'https://www.instagram.com/algazal_ae';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

_launchyou() async {
  const url = 'https://www.youtube.com/channel/UC4A5je-BpLaSpaFWbhd8coA';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

int id = 0;
String firstName;
String lastName;
String phone;
String email;
String password;
bool hasUser = false;

List<String> check2;
int customer = 0;
double jk;
String status2;

class _DashboardPageState extends State<DashboardPage> {
  APIService apiService = new APIService();

  // Color _containerColor = Colors.lightBlueAccent;

  double progressValue = 0.0;
  double secondaryProgressValue = 0.0;

  Widget build(BuildContext context) {
    SQLiteDbProvider.db.delete(189);

    return Scaffold(
        body: Container(
            color: Colors.black,
            child: Container(
                color: Colors.black,
                child: ListView(children: <Widget>[
                  Container(
                      child: Row(
                    children: [
                      Flexible(
                          flex: 2,
                          fit: FlexFit.tight,
                          child: Container(
                              height: 45,
                              margin: EdgeInsets.all(3),
                              padding: EdgeInsets.all(3),
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(40, 40, 40, 1),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Center(
                                child: Text(
                                  "Reach Us",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ))),

                      Flexible(
                          flex: 1,
                          fit: FlexFit.tight,
                          child: Container(
                            height: 45,
                            margin: EdgeInsets.all(3),
                            padding: EdgeInsets.all(3),
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(40, 40, 40, 1),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Center(
                                child: MaterialButton(
                                  padding: EdgeInsets.all(0),
                                  minWidth: 0,
                                  onPressed: () {
                                    _launchweb();
                                  },
                                  child: Image.asset("images/web.png",
                                      width: 30),
                                )),
                          )),


                      Flexible(
                          flex: 1,
                          fit: FlexFit.tight,
                          child: Container(
                            height: 45,
                            margin: EdgeInsets.all(3),
                            padding: EdgeInsets.all(3),
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(40, 40, 40, 1),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Center(
                              child: MaterialButton(
                                padding: EdgeInsets.all(0),
                                minWidth: 0,
                                onPressed: () {

                                  _launchwhatsapp();
                                  // FlutterOpenWhatsapp.sendSingleMessage(
                                  //     "+971542211885", "Hello");
                                },
                                child: Image.asset("images/whatsapp.png",
                                    width: 30),
                              ),
                            ),
                          )),
                      Flexible(
                          flex: 1,
                          fit: FlexFit.tight,
                          child: Container(
                            height: 45,
                            margin: EdgeInsets.all(3),
                            padding: EdgeInsets.all(3),
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(40, 40, 40, 1),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Center(
                                child: MaterialButton(
                              padding: EdgeInsets.all(0),
                              minWidth: 0,
                              onPressed: () {
                                _launchface();
                              },
                              child: Image.asset(
                                "images/FaceBook.png",
                                width: 30,
                              ),
                            )),
                          )),
                      Flexible(
                          flex: 1,
                          fit: FlexFit.tight,
                          child: Container(
                            height: 45,
                            margin: EdgeInsets.all(3),
                            padding: EdgeInsets.all(3),
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(40, 40, 40, 1),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Center(
                                child: MaterialButton(
                              padding: EdgeInsets.all(0),
                              minWidth: 0,
                              onPressed: () {
                                _launchins();
                              },
                              child: Image.asset("images/instigram.png",
                                  width: 30),
                            )),
                          )),
                      Flexible(
                          flex: 1,
                          fit: FlexFit.tight,
                          child: Container(
                            height: 45,
                            margin: EdgeInsets.all(3),
                            padding: EdgeInsets.all(3),
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(40, 40, 40, 1),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Center(
                                child: MaterialButton(
                              padding: EdgeInsets.all(0),
                              minWidth: 0,
                              onPressed: () {
                                _launchyou();
                              },
                              child: Image.asset(
                                "images/youtube.png",
                                width: 30,
                              ),
                            )),
                          )),
                    ],
                  )),

                  imageCarosual(context),

                  SizedBox(height: 20),
                  _productsList(),
                  // _productsList2(),

                  // _productList3(),
                ]))));
  }

  Widget imageCarosual(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 50.0,
      child: new
          // Carousel(
          // overlayShadow: false,
          // borderRadius: true,
          // boxFit: BoxFit.none,
          // autoplay: true,
          // dotSize: 4.0,
          // images: [
          FittedBox(
        fit: BoxFit.fill,
        child:
            Image.network("https://gazal.ae/wp-content/uploads/2021/01/11.jpg"),
      ),
      // ]
      // ),
    );
  }

  // get user details

  //

  Widget _productsList() {
    return Container(
        child: Column(
      children: [
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
        ]),

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
                        child: Icon(Icons.rotate_right,
                            color: Colors.amber, semanticLabel: 'Semantics'),
                      ))),
                  Flexible(
                      flex: 1,
                      fit: FlexFit.tight,
                      child: Container(
                          child: Center(
                        child: Icon(Icons.no_cell,
                            color: const Color(0xff7c94b6),
                            semanticLabel: 'Semantics'),
                      ))),
                  Flexible(
                      flex: 1,
                      fit: FlexFit.tight,
                      child: Container(
                          child: Center(
                        child: Icon(Icons.no_cell,
                            color: const Color(0xff7c94b6),
                            semanticLabel: 'Semantics'),
                      ))),
                  Flexible(
                      flex: 1,
                      fit: FlexFit.tight,
                      child: Container(
                          child: Center(
                        child: Icon(Icons.no_cell,
                            // color: Colors.grey,
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
                            color: Colors.amber,

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
                            color: const Color(0xff7c94b6),

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
                            color: const Color(0xff7c94b6),
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
                            color: const Color(0xff7c94b6),

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
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Container(
                child: Text("Tab Your Model",
                    style: TextStyle(
                      fontFamily: "Roboto Condensed",
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: Colors.lightBlueAccent,
                    ))),
            Container(
              child: Icon(
                Icons.touch_app,
                color: Colors.lightBlueAccent,
                size: 40,
              ),
            ),
          ]),
        ),

        GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ProductPage(
                            categoryid: 30,
                          )));
            },
            child: Container(
                margin: EdgeInsets.all(5),
                padding: EdgeInsets.all(5),
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
                                  "Apple",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      fontFamily: "Roboto Condensed",
                                      fontWeight: FontWeight.w600,
                                      color: Color.fromRGBO(132, 131, 133, 1)),
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
        GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ProductPage(
                            categoryid: 31,

                            // name: data.name.toString(),
                          )));
            },
            child: Container(
                margin: EdgeInsets.all(5),
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: Color.fromRGBO(40, 40, 40, 1),
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
                                  "Samsung",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      fontFamily: "Roboto Condensed",
                                      fontWeight: FontWeight.w600,
                                      color: Color.fromRGBO(132, 131, 133, 1)),
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
        GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ProductPage(
                            categoryid: 32,
                          )));
            },
            child: Container(
                margin: EdgeInsets.all(5),
                padding: EdgeInsets.all(5),
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
                      // decoration: BoxDecoration(border: Border.all()),
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
                                  "Huawei",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      fontFamily: "Roboto Condensed",
                                      fontWeight: FontWeight.w600,
                                      color: Color.fromRGBO(132, 131, 133, 1)),
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
        GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ProductPage(
                            categoryid: 54,
                          )));
            },
            child: Container(
                margin: EdgeInsets.all(5),
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: Color.fromRGBO(40, 40, 40, 1),
                  // border: Border.all(
                  //     ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Container(
                      // decoration: BoxDecoration(border: Border.all()),
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
                                  "Others",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      fontFamily: "Roboto Condensed",
                                      fontWeight: FontWeight.w600,
                                      color: Color.fromRGBO(132, 131, 133, 1)),
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
      ],
    ));
  }

//retrive product

  Widget _productsList2(int customer) {
    print(customer);

    return Container(
        color: Colors.black,
        // color: Color.fromRGBO(17, 3, 77, 1),
        child: new FutureBuilder(
            future: apiService.getOrder(customer),
            builder: (BuildContext context,
                AsyncSnapshot<List<OrderRetrive>> model) {
              if (model.hasData) {
                return _buildorderList(model.data);
              }
              return Center(child: CircularProgressIndicator());
            }));
  }

  Widget _buildorderList(List<OrderRetrive> item) {
    print(customer);

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
            if (item.length == 0) {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CategoryPage()));
            }

            var data = item[index];

            firtName = data.billing.firstName;
            lastName = data.billing.lastName;
            email = data.billing.lastName;
            phone = data.billing.phone;

            // customer = data.id;
            print("item.length that");
            print(customer);

            status2 = "Booking Complete";
            jk = 40.0;

            if (data.status == "pending") {
              status2 = "Booking Complete";
              jk = 40.0;

              return Container(
                  child: Column(
                children: [
//product Details
                  Container(
                      margin: EdgeInsets.all(7),
                      padding: EdgeInsets.all(5),
                      // color: Color.fromRGBO(90, 90, 90, 1),
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
                                        child: Icon(
                                            Icons.supervised_user_circle_sharp,
                                            size: 30,
                                            color: Colors.lightBlueAccent),
                                        // color: Color.fromRGBO(132, 131, 133, 1)),
                                      )),
                                  Flexible(
                                      flex: 6,
                                      fit: FlexFit.tight,
                                      child: Container(
                                        child: Text(
                                          data.billing.firstName
                                                  .toString()
                                                  .toUpperCase() +
                                              " Your Booking Status Below",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontFamily: "Roboto Condensed",
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14,
                                              // color:Color.fromRGBO(132, 131, 133, 1)),

                                              color: Colors.lightBlueAccent),
                                        ),
                                      )),
                                  Flexible(
                                      flex: 1,
                                      fit: FlexFit.tight,
                                      child: Container(
                                        child: Icon(Icons.arrow_circle_down,
                                            size: 30,
                                            color: Color.fromRGBO(
                                                132, 131, 133, 1)),
                                      )),
                                ],
                              ),
                            )
                          ])),

//here the order table starts
                  Center(
                    child: Container(
                      child: Text(
                        "Booking Number " + data.id.toString(),
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: "Roboto Condensed",
                          fontWeight: FontWeight.w600,
                          color: Colors.grey,
                          // color: Color.fromRGBO(132, 131, 133, 1)
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      // color: const Color(0xff7c94b6),
                      // color: Colors.black,
                      // color: Color.fromRGBO(60, 60, 60, 1),

                      border: Border.all(
                        color: Color.fromRGBO(80, 80, 80, 1),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Center(
                          child: Container(
                            child: Text(
                              "Mobile Details",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 16,
                                fontFamily: "Roboto Condensed",
                                fontWeight: FontWeight.w600,
                                color: Colors.amber,
                                // color: Color.fromRGBO(132, 131, 133, 1)
                              ),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                                margin: EdgeInsets.all(5),
                                padding: EdgeInsets.all(5),
                                // color: Color.fromRGBO(60, 60, 60, 1),
                                child: Icon(
                                  Icons.mobile_friendly,
                                  size: 25,
                                  color: Colors.lightBlueAccent,
                                )),
                            Expanded(
                                child: Container(
                                    margin: EdgeInsets.all(5),
                                    padding: EdgeInsets.all(5),
                                    // color: Color.fromRGBO(60, 60, 60, 1),
                                    child: Text(
                                      // "not text",
                                      data.line_items.first.name
                                          .replaceAll("-", "\n"),
                                      // data.line_items.first.name.split("--")[1],
                                      // textAlign: TextAlign.left,
                                      style: TextStyle(
                                          fontFamily: "Roboto Condensed",
                                          fontWeight: FontWeight.w600,
                                          fontSize: 14,
                                          color:
                                              Color.fromRGBO(132, 131, 133, 1)),
                                    ))),
                          ],
                        ),
                      ],
                    ),
                  ),
                  //or

//Product Details

                  Center(
                    child: Container(
                      child: getFilledTrackStyle(jk),
                    ),
                  ),
                  Container(
                      child: Text(
                    jk.toString() + "% Process has  been completed",
                    style: TextStyle(
                        fontFamily: "Roboto Condensed",
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                        color: Color.fromRGBO(132, 131, 133, 1)),
                  )),
                  //here the order table starts

                  Container(
                      margin: EdgeInsets.all(10),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        // color: const Color(0xff7c94b6),
                        // color: Colors.black,
                        // color: Color.fromRGBO(60, 60, 60, 1),

                        border: Border.all(
                          color: Color.fromRGBO(80, 80, 80, 1),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
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
                                              color: Colors.green,
                                              semanticLabel: 'Semantics'),
                                        ))),
                                    Flexible(
                                        flex: 1,
                                        fit: FlexFit.tight,
                                        child: Container(
                                            child: Center(
                                          child: Icon(Icons.rotate_right,
                                              color: Colors.amber,
                                              semanticLabel: 'Semantics'),
                                        ))),
                                    Flexible(
                                        flex: 1,
                                        fit: FlexFit.tight,
                                        child: Container(
                                            child: Center(
                                          child: Icon(Icons.no_cell,
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
                                                color: Color.fromRGBO(
                                                    87, 198, 255, 1),
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
                                              color: Colors.amber,

                                              border: Border.all(
                                                color: Color.fromRGBO(
                                                    87, 198, 255, 1),
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

                                              border: Border.all(
                                                color: Color.fromRGBO(
                                                    87, 198, 255, 1),
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
                                                child: Text("Booking",
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      fontFamily:
                                                          "Roboto Condensed",
                                                      fontSize: 14,
                                                      color: Color.fromRGBO(
                                                          132, 131, 133, 1),

                                                      // color: Colors.blue.shade300
                                                    ))))),
                                    Flexible(
                                        flex: 1,
                                        fit: FlexFit.tight,
                                        child: Container(
                                            child: Center(
                                                child: Text("Fixing",
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      fontFamily:
                                                          "Roboto Condensed",
                                                      fontSize: 14,
                                                      color: Color.fromRGBO(
                                                          132, 131, 133, 1),

                                                      // color: Colors.blue.shade300
                                                    ))))),
                                    Flexible(
                                        flex: 1,
                                        fit: FlexFit.tight,
                                        child: Container(
                                            child: Center(
                                                child: Text("Deliverd",
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      fontFamily:
                                                          "Roboto Condensed",
                                                      fontSize: 14,
                                                      color: Color.fromRGBO(
                                                          132, 131, 133, 1),

                                                      // color: Colors.blue.shade300
                                                    ))))),
                                  ]),
                                ),
                              ),
                            ],
                          ),
                          Center(
                            child: Container(
                              child: Text(
                                "Order Details",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.amber,
                                  fontFamily: "Roboto Condensed",
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                  width: 100,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                          margin: EdgeInsets.all(5),
                                          padding: EdgeInsets.all(5),
                                          child: Text(
                                            "Order Id",
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                                fontFamily: "Roboto Condensed",
                                                fontWeight: FontWeight.w600,
                                                color: Color.fromRGBO(
                                                    132, 131, 133, 1)),
                                          )),
                                      Container(
                                          margin: EdgeInsets.all(5),
                                          padding: EdgeInsets.all(5),
                                          child: Text(
                                            "Order Date",
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                                fontFamily: "Roboto Condensed",
                                                fontWeight: FontWeight.w600,
                                                color: Color.fromRGBO(
                                                    132, 131, 133, 1)),
                                          )),
                                      Container(
                                          margin: EdgeInsets.all(5),
                                          padding: EdgeInsets.all(5),
                                          child: Text(
                                            "Status",
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                                fontFamily: "Roboto Condensed",
                                                fontWeight: FontWeight.w600,
                                                color: Color.fromRGBO(
                                                    132, 131, 133, 1)),
                                          )),
                                      Container(
                                          margin: EdgeInsets.all(5),
                                          padding: EdgeInsets.all(5),
                                          child: Text(
                                            "Cost",
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                                fontFamily: "Roboto Condensed",
                                                fontWeight: FontWeight.w600,
                                                color: Color.fromRGBO(
                                                    132, 131, 133, 1)),
                                          )),
                                    ],
                                  )),
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                        margin: EdgeInsets.all(5),
                                        padding: EdgeInsets.all(5),
                                        child: Text(
                                          data.id.toString(),
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                              fontFamily: "Roboto Condensed",
                                              fontWeight: FontWeight.w600,
                                              color: Colors.lightBlueAccent),
                                        )),
                                    Container(
                                        margin: EdgeInsets.all(5),
                                        padding: EdgeInsets.all(5),
                                        child: Text(
                                          (data.dateCreated
                                                      .toString()
                                                      .split("-")[2])
                                                  .split("T")[0] +
                                              "/" +
                                              data.dateCreated
                                                  .toString()
                                                  .split("-")[1] +
                                              "/" +
                                              data.dateCreated
                                                  .toString()
                                                  .split("-")[0],
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                              fontFamily: "Roboto Condensed",
                                              fontWeight: FontWeight.w600,
                                              color: Colors.lightBlueAccent),
                                        )),
                                    Container(
                                        margin: EdgeInsets.all(5),
                                        padding: EdgeInsets.all(5),
                                        child: Text(
                                          status2,
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                              fontFamily: "Roboto Condensed",
                                              fontWeight: FontWeight.w600,
                                              color: Colors.lightBlueAccent),
                                        )),
                                    Container(
                                        margin: EdgeInsets.all(5),
                                        padding: EdgeInsets.all(5),
                                        child: Text(
                                          "AED " + data.total.toString(),
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                              fontFamily: "Roboto Condensed",
                                              fontWeight: FontWeight.w600,
                                              color: Colors.lightBlueAccent),
                                        )),
                                  ]),
                            ],
                          ),
                        ],
                      )),
                  //order table ends
                ],
              ));
            }
            //second one

            else if (data.status == "processing") {
              status2 = "Under Fixing";
              jk = 80.0;

              return Container(
                  child: Column(
                children: [
//product Details
                  Center(
                    child: Container(
                      child: Text(
                        "Booking Number " + data.id.toString(),
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: "Roboto Condensed",
                          fontWeight: FontWeight.w600,
                          color: Colors.grey,
                          // color: Color.fromRGBO(132, 131, 133, 1)
                        ),
                      ),
                    ),
                  ),

//here the order table starts

                  Container(
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      // color: const Color(0xff7c94b6),
                      // color: Colors.black,
                      // color: Color.fromRGBO(60, 60, 60, 1),

                      border: Border.all(
                        color: Color.fromRGBO(80, 80, 80, 1),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Center(
                          child: Container(
                            child: Text(
                              "Mobile Details",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 16,
                                fontFamily: "Roboto Condensed",
                                fontWeight: FontWeight.w600,
                                color: Colors.amber,
                                // color: Color.fromRGBO(132, 131, 133, 1)
                              ),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                                margin: EdgeInsets.all(5),
                                padding: EdgeInsets.all(5),
                                // color: Color.fromRGBO(60, 60, 60, 1),
                                child: Icon(
                                  Icons.mobile_friendly,
                                  size: 25,
                                  color: Colors.lightBlueAccent,
                                )),
                            Expanded(
                                child: Container(
                                    margin: EdgeInsets.all(5),
                                    padding: EdgeInsets.all(5),
                                    // color: Color.fromRGBO(60, 60, 60, 1),
                                    child: Text(
                                      // "not text",
                                      data.line_items.first.name
                                          .replaceAll("--", "\nIssue : "),
                                      // data.line_items.first.name.split("--")[1],
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          fontFamily: "Roboto Condensed",
                                          fontWeight: FontWeight.w600,
                                          fontSize: 14,
                                          color:
                                              Color.fromRGBO(132, 131, 133, 1)),
                                    ))),
                          ],
                        ),
                      ],
                    ),
                  ),
                  //or

//Product Details

                  Center(
                    child: Container(
                      child: getFilledTrackStyle(jk),
                    ),
                  ),
                  Container(
                      child: Text(
                    jk.toString() + "% Process has  been completed",
                    style: TextStyle(
                        fontFamily: "Roboto Condensed",
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                        color: Color.fromRGBO(132, 131, 133, 1)),
                  )),
                  //here the order table starts

                  Container(
                      margin: EdgeInsets.all(10),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        // color: const Color(0xff7c94b6),
                        // color: Colors.black,
                        // color: Color.fromRGBO(60, 60, 60, 1),

                        border: Border.all(
                          color: Color.fromRGBO(80, 80, 80, 1),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
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
                                              color: Colors.green,
                                              semanticLabel: 'Semantics'),
                                        ))),
                                    Flexible(
                                        flex: 1,
                                        fit: FlexFit.tight,
                                        child: Container(
                                            child: Center(
                                          child: Icon(Icons.done,
                                              color: Colors.green,
                                              semanticLabel: 'Semantics'),
                                        ))),
                                    Flexible(
                                        flex: 1,
                                        fit: FlexFit.tight,
                                        child: Container(
                                            child: Center(
                                          child: Icon(Icons.rotate_right,
                                              color: Colors.amber,
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
                                                color: Color.fromRGBO(
                                                    87, 198, 255, 1),
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
                                                color: Color.fromRGBO(
                                                    87, 198, 255, 1),
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

                                              border: Border.all(
                                                color: Color.fromRGBO(
                                                    87, 198, 255, 1),
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
                                                child: Text("Booking",
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      fontFamily:
                                                          "Roboto Condensed",
                                                      fontSize: 14,
                                                      color: Color.fromRGBO(
                                                          132, 131, 133, 1),

                                                      // color: Colors.blue.shade300
                                                    ))))),
                                    Flexible(
                                        flex: 1,
                                        fit: FlexFit.tight,
                                        child: Container(
                                            child: Center(
                                                child: Text("Fixing",
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      fontFamily:
                                                          "Roboto Condensed",
                                                      fontSize: 14,
                                                      color: Color.fromRGBO(
                                                          132, 131, 133, 1),

                                                      // color: Colors.blue.shade300
                                                    ))))),
                                    Flexible(
                                        flex: 1,
                                        fit: FlexFit.tight,
                                        child: Container(
                                            child: Center(
                                                child: Text("Deliverd",
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      fontFamily:
                                                          "Roboto Condensed",
                                                      fontSize: 14,
                                                      color: Color.fromRGBO(
                                                          132, 131, 133, 1),

                                                      // color: Colors.blue.shade300
                                                    ))))),
                                  ]),
                                ),
                              ),
                            ],
                          ),
                          Center(
                            child: Container(
                              child: Text(
                                "Order Details",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.amber,
                                  fontFamily: "Roboto Condensed",
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                  width: 100,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                          margin: EdgeInsets.all(5),
                                          padding: EdgeInsets.all(5),
                                          child: Text(
                                            "Order Id",
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                                fontFamily: "Roboto Condensed",
                                                fontWeight: FontWeight.w600,
                                                color: Color.fromRGBO(
                                                    132, 131, 133, 1)),
                                          )),
                                      Container(
                                          margin: EdgeInsets.all(5),
                                          padding: EdgeInsets.all(5),
                                          child: Text(
                                            "Order Date",
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                                fontFamily: "Roboto Condensed",
                                                fontWeight: FontWeight.w600,
                                                color: Color.fromRGBO(
                                                    132, 131, 133, 1)),
                                          )),
                                      Container(
                                          margin: EdgeInsets.all(5),
                                          padding: EdgeInsets.all(5),
                                          child: Text(
                                            "Status",
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                                fontFamily: "Roboto Condensed",
                                                fontWeight: FontWeight.w600,
                                                color: Color.fromRGBO(
                                                    132, 131, 133, 1)),
                                          )),
                                      Container(
                                          margin: EdgeInsets.all(5),
                                          padding: EdgeInsets.all(5),
                                          child: Text(
                                            "Cost",
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                                fontFamily: "Roboto Condensed",
                                                fontWeight: FontWeight.w600,
                                                color: Color.fromRGBO(
                                                    132, 131, 133, 1)),
                                          )),
                                    ],
                                  )),
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                        margin: EdgeInsets.all(5),
                                        padding: EdgeInsets.all(5),
                                        child: Text(
                                          data.id.toString(),
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                              fontFamily: "Roboto Condensed",
                                              fontWeight: FontWeight.w600,
                                              color: Colors.lightBlueAccent),
                                        )),
                                    Container(
                                        margin: EdgeInsets.all(5),
                                        padding: EdgeInsets.all(5),
                                        child: Text(
                                          (data.dateCreated
                                                      .toString()
                                                      .split("-")[2])
                                                  .split("T")[0] +
                                              "/" +
                                              data.dateCreated
                                                  .toString()
                                                  .split("-")[1] +
                                              "/" +
                                              data.dateCreated
                                                  .toString()
                                                  .split("-")[0],
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                              fontFamily: "Roboto Condensed",
                                              fontWeight: FontWeight.w600,
                                              color: Colors.lightBlueAccent),
                                        )),
                                    Container(
                                        margin: EdgeInsets.all(5),
                                        padding: EdgeInsets.all(5),
                                        child: Text(
                                          status2,
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                              fontFamily: "Roboto Condensed",
                                              fontWeight: FontWeight.w600,
                                              color: Colors.lightBlueAccent),
                                        )),
                                    Container(
                                        margin: EdgeInsets.all(5),
                                        padding: EdgeInsets.all(5),
                                        child: Text(
                                          "AED " + data.total.toString(),
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                              fontFamily: "Roboto Condensed",
                                              fontWeight: FontWeight.w600,
                                              color: Colors.lightBlueAccent),
                                        )),
                                  ]),
                            ],
                          ),
                        ],
                      )),
                  //order table ends
                ],
              ));
            }

//complete
            else if (data.status == "completed") {
              status2 = "Deliverd";
              jk = 100.0;
              return Container(
                  child: Column(
                children: [
//product Details
                  Center(
                    child: Container(
                      child: Text(
                        "Booking Number " + data.id.toString(),
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: "Roboto Condensed",
                          fontWeight: FontWeight.w600,
                          color: Colors.grey,
                          // color: Color.fromRGBO(132, 131, 133, 1)
                        ),
                      ),
                    ),
                  ),
//here the order table starts

                  Container(
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      // color: const Color(0xff7c94b6),
                      // color: Colors.black,
                      // color: Color.fromRGBO(60, 60, 60, 1),

                      border: Border.all(
                        color: Color.fromRGBO(80, 80, 80, 1),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Center(
                          child: Container(
                            child: Text(
                              "Mobile Details",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 16,
                                fontFamily: "Roboto Condensed",
                                fontWeight: FontWeight.w600,
                                color: Colors.amber,
                                // color: Color.fromRGBO(132, 131, 133, 1)
                              ),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                                margin: EdgeInsets.all(5),
                                padding: EdgeInsets.all(5),
                                // color: Color.fromRGBO(60, 60, 60, 1),
                                child: Icon(
                                  Icons.mobile_friendly,
                                  size: 25,
                                  color: Colors.lightBlueAccent,
                                )),
                            Expanded(
                                child: Container(
                                    margin: EdgeInsets.all(5),
                                    padding: EdgeInsets.all(5),
                                    // color: Color.fromRGBO(60, 60, 60, 1),
                                    child: Text(
                                      // "not text",
                                      // "linedata",
                                      data.line_items.first.name
                                          .replaceAll("--", "\nIssue : "),
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          fontFamily: "Roboto Condensed",
                                          fontWeight: FontWeight.w600,
                                          fontSize: 14,
                                          color:
                                              Color.fromRGBO(132, 131, 133, 1)),
                                    ))),
                          ],
                        ),
                      ],
                    ),
                  ),
                  //or

//Product Details

                  Center(
                    child: Container(
                      child: getFilledTrackStyle(jk),
                    ),
                  ),

                  Container(
                      child: Text(
                    jk.toString() + "% Process has  been completed",
                    style: TextStyle(
                        fontFamily: "Roboto Condensed",
                        fontWeight: FontWeight.w600,
                        fontSize: 13,
                        color: Color.fromRGBO(132, 131, 133, 1)),
                  )),
                  //here the order table starts

                  Container(
                      margin: EdgeInsets.all(10),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        // color: const Color(0xff7c94b6),
                        // color: Colors.black,
                        // color: Color.fromRGBO(60, 60, 60, 1),

                        border: Border.all(
                          color: Color.fromRGBO(80, 80, 80, 1),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
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
                                              color: Colors.green,
                                              semanticLabel: 'Semantics'),
                                        ))),
                                    Flexible(
                                        flex: 1,
                                        fit: FlexFit.tight,
                                        child: Container(
                                            child: Center(
                                          child: Icon(Icons.done,
                                              color: Colors.green,
                                              semanticLabel: 'Semantics'),
                                        ))),
                                    Flexible(
                                        flex: 1,
                                        fit: FlexFit.tight,
                                        child: Container(
                                            child: Center(
                                          child: Icon(Icons.done,
                                              color: Colors.green,
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
                                                color: Color.fromRGBO(
                                                    87, 198, 255, 1),
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
                                                color: Color.fromRGBO(
                                                    87, 198, 255, 1),
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
                                                color: Color.fromRGBO(
                                                    87, 198, 255, 1),
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
                                                child: Text("Booking",
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      fontFamily:
                                                          "Roboto Condensed",
                                                      fontSize: 14,
                                                      color: Color.fromRGBO(
                                                          132, 131, 133, 1),

                                                      // color: Colors.blue.shade300
                                                    ))))),
                                    Flexible(
                                        flex: 1,
                                        fit: FlexFit.tight,
                                        child: Container(
                                            child: Center(
                                                child: Text("Under Fixing",
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      fontFamily:
                                                          "Roboto Condensed",
                                                      fontSize: 14,
                                                      color: Color.fromRGBO(
                                                          132, 131, 133, 1),

                                                      // color: Colors.blue.shade300
                                                    ))))),
                                    Flexible(
                                        flex: 1,
                                        fit: FlexFit.tight,
                                        child: Container(
                                            child: Center(
                                                child: Text("Deliverd",
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      fontFamily:
                                                          "Roboto Condensed",
                                                      fontSize: 14,
                                                      color: Color.fromRGBO(
                                                          132, 131, 133, 1),

                                                      // color: Colors.blue.shade300
                                                    ))))),
                                  ]),
                                ),
                              ),
                            ],
                          ),
                          Center(
                            child: Container(
                              child: Text(
                                "Order Details",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.amber,
                                  fontFamily: "Roboto Condensed",
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                  width: 100,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                          margin: EdgeInsets.all(5),
                                          padding: EdgeInsets.all(5),
                                          child: Text(
                                            "Order Id",
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                                fontFamily: "Roboto Condensed",
                                                fontWeight: FontWeight.w600,
                                                color: Color.fromRGBO(
                                                    132, 131, 133, 1)),
                                          )),
                                      Container(
                                          margin: EdgeInsets.all(5),
                                          padding: EdgeInsets.all(5),
                                          child: Text(
                                            "Order Date",
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                                fontFamily: "Roboto Condensed",
                                                fontWeight: FontWeight.w600,
                                                color: Color.fromRGBO(
                                                    132, 131, 133, 1)),
                                          )),
                                      Container(
                                          margin: EdgeInsets.all(5),
                                          padding: EdgeInsets.all(5),
                                          child: Text(
                                            "Status",
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                                fontFamily: "Roboto Condensed",
                                                fontWeight: FontWeight.w600,
                                                color: Color.fromRGBO(
                                                    132, 131, 133, 1)),
                                          )),
                                      Container(
                                          margin: EdgeInsets.all(5),
                                          padding: EdgeInsets.all(5),
                                          child: Text(
                                            "Cost",
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                                fontFamily: "Roboto Condensed",
                                                fontWeight: FontWeight.w600,
                                                color: Color.fromRGBO(
                                                    132, 131, 133, 1)),
                                          )),
                                    ],
                                  )),
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                        margin: EdgeInsets.all(5),
                                        padding: EdgeInsets.all(5),
                                        child: Text(
                                          data.id.toString(),
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                              fontFamily: "Roboto Condensed",
                                              fontWeight: FontWeight.w600,
                                              color: Colors.lightBlueAccent),
                                        )),
                                    Container(
                                        margin: EdgeInsets.all(5),
                                        padding: EdgeInsets.all(5),
                                        child: Text(
                                          (data.dateCreated
                                                      .toString()
                                                      .split("-")[2])
                                                  .split("T")[0] +
                                              "/" +
                                              data.dateCreated
                                                  .toString()
                                                  .split("-")[1] +
                                              "/" +
                                              data.dateCreated
                                                  .toString()
                                                  .split("-")[0],
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                              fontFamily: "Roboto Condensed",
                                              fontWeight: FontWeight.w600,
                                              color: Colors.lightBlueAccent),
                                        )),
                                    Container(
                                        margin: EdgeInsets.all(5),
                                        padding: EdgeInsets.all(5),
                                        child: Text(
                                          status2,
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                              fontFamily: "Roboto Condensed",
                                              fontWeight: FontWeight.w600,
                                              color: Colors.lightBlueAccent),
                                        )),
                                    Container(
                                        margin: EdgeInsets.all(5),
                                        padding: EdgeInsets.all(5),
                                        child: Text(
                                          "AED " + data.total.toString(),
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                              fontFamily: "Roboto Condensed",
                                              fontWeight: FontWeight.w600,
                                              color: Colors.lightBlueAccent),
                                        )),
                                  ]),
                            ],
                          ),
                        ],
                      )),
                  //order table ends
                ],
              ));
            }
          }),
    );
  }

  /// Returns normal style circular progress bars.
  // Widget getNormalProgressStyle() {
  //   return Row(
  //     mainAxisAlignment: MainAxisAlignment.center,
  //     crossAxisAlignment: CrossAxisAlignment.center,
  //     children: <Widget>[
  //       Container(
  //         height: 120,
  //         width: 120,
  //         child: SfRadialGauge(axes: <RadialAxis>[
  //           RadialAxis(
  //               minimum: 0,
  //               maximum: 100,
  //               showLabels: false,
  //               showTicks: false,
  //               radiusFactor: 0.8,
  //               axisLineStyle: AxisLineStyle(
  //                 thickness: 0.2,
  //                 cornerStyle: CornerStyle.bothCurve,
  //                 color: const Color.fromARGB(30, 0, 169, 181),
  //                 thicknessUnit: GaugeSizeUnit.factor,
  //               ),
  //               pointers: <GaugePointer>[
  //                 RangePointer(
  //                     value: progressValue,
  //                     cornerStyle: CornerStyle.bothCurve,
  //                     width: 0.2,
  //                     sizeUnit: GaugeSizeUnit.factor,
  //                     enableAnimation: true,
  //                     animationDuration: 100,
  //                     animationType: AnimationType.linear)
  //               ],
  //               annotations: <GaugeAnnotation>[
  //                 GaugeAnnotation(
  //                     positionFactor: 0.1,
  //                     angle: 90,
  //                     widget: Text(
  //                       progressValue.toStringAsFixed(0) + ' / 100',
  //                       style: const TextStyle(fontSize: 11),
  //                     ))
  //               ])
  //         ]),
  //       ),
  //       Container(
  //         height: 120,
  //         width: 120,
  //         child: SfRadialGauge(axes: <RadialAxis>[
  //           RadialAxis(
  //               minimum: 0,
  //               maximum: 100,
  //               showLabels: false,
  //               showTicks: false,
  //               startAngle: 270,
  //               endAngle: 270,
  //               radiusFactor: 0.8,
  //               axisLineStyle: AxisLineStyle(
  //                 thickness: 0.05,
  //                 color: const Color.fromARGB(30, 0, 169, 181),
  //                 thicknessUnit: GaugeSizeUnit.factor,
  //               ),
  //               pointers: <GaugePointer>[
  //                 RangePointer(
  //                     value: progressValue,
  //                     width: 0.05,
  //                     sizeUnit: GaugeSizeUnit.factor,
  //                     enableAnimation: true,
  //                     animationDuration: 100,
  //                     animationType: AnimationType.linear)
  //               ],
  //               annotations: <GaugeAnnotation>[
  //                 GaugeAnnotation(
  //                     positionFactor: 0,
  //                     widget: Text(progressValue.toStringAsFixed(0) + '%'))
  //               ])
  //         ]),
  //       ),
  //     ],
  //   );
  // }
  //
  // /// Returns filled track style circular progress bar.
  Widget getFilledTrackStyle(double j) {
    progressValue = j;
    return Container(
        height: 200,
        width: 200,
        child: SfRadialGauge(axes: <RadialAxis>[
          RadialAxis(
              minimum: 0,
              maximum: 100,
              showLabels: false,
              showTicks: false,
              startAngle: 270,
              endAngle: 270,
              radiusFactor: 0.8,
              axisLineStyle: AxisLineStyle(
                thickness: 1,
                color: Color.fromRGBO(60, 60, 60, 1),
                // color: const Color.fromARGB(255, 0, 169, 181),
                thicknessUnit: GaugeSizeUnit.factor,
              ),
              pointers: <GaugePointer>[
                RangePointer(
                  value: j,
                  width: 0.17,
                  enableAnimation: true,
                  // animationDuration: 100,
                  color: Colors.amber,
                  pointerOffset: 0.1,
                  cornerStyle: CornerStyle.bothCurve,
                  // animationType: AnimationType.linear,
                  sizeUnit: GaugeSizeUnit.factor,
                )
              ],
              annotations: <GaugeAnnotation>[
                GaugeAnnotation(
                    positionFactor: 0.5,
                    widget: Text(progressValue.toStringAsFixed(0) + '%' + '\n',
                        style: const TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold)))
              ])
        ]));
  }

//   @override
//   void dispose() {
//     _timer.cancel();
//     super.dispose();
//   }
}
