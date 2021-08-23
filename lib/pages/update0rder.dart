import 'package:flutter/material.dart';
import 'package:gazal/pages/base_page.dart';
import 'package:gazal/pages/home_page.dart';



// ignore: must_be_immutable
class UpdateOrder extends BasePage {


  @override
  _UpdateOrderState createState() => _UpdateOrderState();
}
class _UpdateOrderState extends BasePageState<UpdateOrder> {


    Widget pageUI() {
      //  return (Container(child: Text(this.widget.categoryid.toString())));

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
                              "Mobile Repair Booking At Your Doorstep In \n 4 Easy Steps"
                              ,
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [


                    Expanded(
                        child:


                        Text("You have Sucessfully Submitted your Mobile Repair Issue one of our Represetaive will Contact you shotly.",

                            style: TextStyle(
                              fontFamily: "Roboto Condensed",
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.amber,
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
                          builder: (context) =>
                              HomePage(


                                // name: data.name.toString(),
                              )));
                },
                child: Container(
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.lightBlueAccent,
                      // color: Color.fromRGBO(40, 40, 40, 1),
                      borderRadius: BorderRadius.circular(20.0),
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
                                        size: 20, color: Colors.black
                                      // color: Color.fromRGBO(132, 131, 133, 1)
                                    ),
                                  )),
                              Flexible(
                                  flex: 6,
                                  fit: FlexFit.tight,
                                  child:
                                  Center(child:
                                  Container(
                                    child: Text(
                                      "Tap your order details",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          fontFamily: "Roboto Condensed",
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black),

                                    ),
                                  ))),
                              Flexible(
                                  flex: 1,
                                  fit: FlexFit.tight,
                                  child: Container(
                                    child: Icon(Icons.arrow_right,
                                        size: 20, color: Colors.black

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
  }
