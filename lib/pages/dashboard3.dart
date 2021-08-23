import 'package:flutter/material.dart';
import 'package:gazal/models/database.dart';
import 'package:gazal/models/apiService.dart';


import 'package:url_launcher/url_launcher.dart';
import 'package:gazal/pages/home_page.dart';

class DashboardPagess extends StatefulWidget {
  @override
  _DashboardPagessState createState() => _DashboardPagessState();

  DashboardPagess({Key key}) : super(key: key);
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

class _DashboardPagessState extends State<DashboardPagess> {
  APIService apiService = new APIService();

  Color _containerColor = Colors.lightBlueAccent;

  double progressValue = 0.0;
  double secondaryProgressValue = 0.0;

  Widget build(BuildContext context) {
    setState(() {
      deactivate();
    });
    SQLiteDbProvider.db.delete(183);

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
                                  // FlutterOpenWhatsapp.sendSingleMessage(
                                  //     "+971542211885", "Hello Gazal");
                                  _launchwhatsapp();

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
                        child: Icon(Icons.done,
                            color: Colors.green,
                            // color: const Color(0xff7c94b6),
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
                            color: Colors.green,
                            // color: const Color(0xff7c94b6),
                            border: Border.all(
                              // color: Colors.green,
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
                            // color: const Color(0xff7c94b6),

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
                child: Text("Your booking has been Successfully Submited",
                    style: TextStyle(
                      fontFamily: "Roboto Condensed",
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: Colors.lightBlueAccent,
                    ))),
            Container(
              child: Icon(
                Icons.update,
                color: Colors.lightBlueAccent,
                size: 20,
              ),
            ),
          ]),
        ),
        GestureDetector(
            onTap: () {
              setState(() {
                _containerColor = Colors.red;

                _containerColor =
                    _containerColor == Colors.blue ? Colors.red : Colors.blue;
              });

              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => HomePage()));
            },

            // child: Flexible(
            //     flex: 1,
            //     fit: FlexFit.tight,
            child: Container(
              margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
              padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
              decoration: BoxDecoration(
                // color: const Color(0xff7c94b6),
                color: Color.fromRGBO(40, 40, 40, 1),
                // Colors.lightBlueAccent,
                // color: Color.fromRGBO(71, 71, 71, 1),

                border: Border.all(
                  color: Color.fromRGBO(66, 66, 66, 1),
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(40.0),
              ),
              child: (Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  // Flexible(
                  //     flex: 1,
                  //     fit: FlexFit.tight,
                  //     child:

                  Container(
                      // margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                      // padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                      child: Icon(
                    Icons.tap_and_play,
                    color: Colors.grey,
                  )),
                  // ),

                  //main containet

                  // Flexible(
                  //     flex: 2,
                  //     fit: FlexFit.tight,
                  //     child:

                  Container(
                      child: Text("Tab For Booking Screen",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: "Roboto Condensed",
                            fontSize: 16,
                            color: Colors.grey,
                          ))),

//end icons

                  // Flexible(
                  //     flex: 1,
                  //     fit: FlexFit.tight,
                  //     child:

                  Container(
                      margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
                      padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                      child: Icon(
                        Icons.arrow_right,
                        color: Colors.grey,
                      ))
                ],
              )),
            )),
      ],
    ));
  }

//   @override
  void dispose() {
    // _timer.cancel();
    super.dispose();
  }
}
