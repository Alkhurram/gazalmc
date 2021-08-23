import 'package:flutter/material.dart';
import 'package:gazal/pages/base_page.dart';
import 'package:gazal/pages/product_page.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:gazal/models/apiService.dart';

// ignore: must_be_immutable
class CategoryPage extends BasePage {
  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends BasePageState<CategoryPage> {
  APIService apiService = new APIService();

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
    const url = 'https://www.facebook.com/AlGazalAEe';
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

  Future<Map<String, dynamic>> getproduct() async {
    Map<String, dynamic> productlist = {
      "0": {
        "name": "apple",
        "id": 30,
      },
      "1": {
        "name": "Sumsung",
        "id": 31,
      },
      "2": {
        "name": "Huawei",
        "id": 32,
      },
      "3": {
        "name": "56",
        "id": 32,
      },
    };
    return productlist;
  }

  Widget pageUI() {
    //  return (Container(child: Text(this.widget.categoryid.toString())));

    return Container(
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
                  child: Center(
                    child: Container(
                      height: 45,
                      margin: EdgeInsets.all(3),
                      padding: EdgeInsets.all(3),
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(40, 40, 40, 1),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: MaterialButton(
                        padding: EdgeInsets.all(0),
                        minWidth: 0,
                        onPressed: () {
                          _launchweb();
                        },
                        child: Image.asset("images/web.png", width: 30),
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
                          // FlutterOpenWhatsapp.sendSingleMessage(
                          //     "00971542211885", "Hello");
                          _launchwhatsapp();
                        },
                        child: Image.asset("images/whatsapp.png", width: 30),
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
                      child: Image.asset("images/instigram.png", width: 30),
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
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
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

//Product Apple
          GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ProductPage(
                              categoryid: 43,
                            )));
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
                                    "Apple",
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
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(10),
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
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(10),
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
        ]));
    //Product Sumsung
  }
}
