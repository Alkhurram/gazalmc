import 'package:flutter/material.dart';
import 'package:gazal/pages/base_page.dart';

import 'package:gazal/models/database.dart';
import 'package:gazal/models/users.dart';
import 'package:gazal/models/apiService.dart';
import 'package:gazal/models/orderRetrive.dart';
import 'dart:async';

import 'package:syncfusion_flutter_gauges/gauges.dart';

// ignore: must_be_immutable
class OrderDetails extends BasePage {
  OrderDetails({Key key, this.categoryid}) : super(key: key);
  int categoryid;
  @override
  _OrderDetailsState createState() => _OrderDetailsState();
}

List<String> check2;
int customer = 0;
double jk;
String status2;

class _OrderDetailsState extends BasePageState<OrderDetails> {
  APIService apiService = new APIService();

  Timer _timer;
  double progressValue = 60.0;
  double secondaryProgressValue = 60.0;
  // ignore: sort_constructors_first
  _OrderDetailsState() {
    _timer = Timer.periodic(const Duration(milliseconds: 100), (Timer _timer) {
      setState(() {
        progressValue++;
        secondaryProgressValue = secondaryProgressValue + 2;
        if (progressValue == 100) {
          _timer.cancel();
        }
        if (secondaryProgressValue > 100) {
          secondaryProgressValue = 100;
        }
      });
    });
  }
  Widget pageUI() {
    //  return (Container(child: Text(this.widget.categoryid.toString())));

    return Container(
        color: Colors.black,
        // color: Color.fromRGBO(17, 3, 77, 1),
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
                              fontSize: 16,
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
                          child: Icon(Icons.rotate_right,
                              color: Colors.amber, semanticLabel: 'Semantics'),
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
                              color: Colors.amber,

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
                                      fontSize: 14,
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
                                      fontSize: 14,
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
                                      fontSize: 14,
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
                                      fontSize: 14,
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
                            fontSize: 18,
                            color: Colors.blue.shade300,
                          ))),
                  Container(
                    child: Icon(
                      Icons.touch_app,
                      color: Colors.blue.shade300,
                      size: 40,
                    ),
                  ),
                ]),
          ),
          _productsList(),
          _orderList(customer)
        ]));
  }

  Widget _productsList() {
    return new FutureBuilder(
        future: SQLiteDbProvider.db.getAllUsers(),
        builder: (BuildContext context, AsyncSnapshot<List<User>> model) {
          // customer = model.data.first.id;

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
              customer = data.id;
              return Container(
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
                                      color: Colors.blue.shade400),
                                  // color: Color.fromRGBO(132, 131, 133, 1)),
                                )),
                            Flexible(
                                flex: 6,
                                fit: FlexFit.tight,
                                child: Container(
                                  child: Text(
                                    "Welcome " +
                                        data.firstName.toString().toUpperCase(),
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontFamily: "Roboto Condensed",
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                        // color:Color.fromRGBO(132, 131, 133, 1)),

                                        color: Colors.blue.shade400),
                                  ),
                                )),
                            Flexible(
                                flex: 1,
                                fit: FlexFit.tight,
                                child: Container(
                                  child: Icon(Icons.arrow_circle_down,
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

//retrive OrderData
  Widget _orderList(int localCustomer) {
    print(localCustomer.toString() + "here you go");
    return new FutureBuilder(
        future: apiService.getOrder(localCustomer),
        builder:
            (BuildContext context, AsyncSnapshot<List<OrderRetrive>> model) {
          if (model.hasData) {
            return _buildorderList(model.data);
          }
          return Center(child: CircularProgressIndicator());
        });
  }

  Widget _buildorderList(List<OrderRetrive> item) {
    print("item.length");

    print(item.length+5);
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
            // customer = data.id;
            print("item.length is");

            status2 = "Booking Complete";
            jk = 40.0;
            print(data.status + "status working fine");
            print(data.status + "status working fine");

            if (data.status == "pending") {
              status2 = "Booking Complete";
              jk = 40.0;

              return Container(
                  child: Column(
                children: [
//product Details

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
                                  color: Colors.blue.shade400,
                                )),
                            Expanded(
                                child: Container(
                                    margin: EdgeInsets.all(5),
                                    padding: EdgeInsets.all(5),
                                    // color: Color.fromRGBO(60, 60, 60, 1),
                                    child: Text(
                                      // "not text",
                                      "dataLine",
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
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                  margin: EdgeInsets.all(5),
                                  padding: EdgeInsets.all(5),
                                  // color: Color.fromRGBO(60, 60, 60, 1),
                                  child: Icon(
                                    Icons.error,
                                    size: 25,
                                    color: Colors.blue.shade400,
                                  )),
                              Expanded(
                                  child: Container(
                                      margin: EdgeInsets.all(5),
                                      padding: EdgeInsets.all(5),
                                      // color: Color.fromRGBO(60, 60, 60, 1),
                                      child: Text(
                                        "dataLine",
                                        // data.line_items.first.name
                                        //     .split("--")[0],
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            fontFamily: "Roboto Condensed",
                                            fontWeight: FontWeight.w600,
                                            fontSize: 12,
                                            color: Color.fromRGBO(
                                                132, 131, 133, 1)),
                                      ))),
                            ]),
                      ],
                    ),
                  ),
                  //or

//Product Details

                  Container(
                      child: Text(
                    jk.toString() + "% Process has  been completed",
                    style: TextStyle(
                        fontFamily: "Roboto Condensed",
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                        color: Color.fromRGBO(132, 131, 133, 1)),
                  )),

                  Center(
                    child: Container(
                      child: getFilledTrackStyle(jk),
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
                                                child: Text("Delivery",
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
                                              color: Colors.blue.shade400),
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
                                              color: Colors.blue.shade400),
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
                                              color: Colors.blue.shade400),
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
                                              color: Colors.blue.shade400),
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
              status2 = "Fixing";
              jk = 80.0;

              return Container(
                  child: Column(
                children: [
//product Details

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
                                  color: Colors.blue.shade400,
                                )),
                            Expanded(
                                child: Container(
                                    margin: EdgeInsets.all(5),
                                    padding: EdgeInsets.all(5),
                                    // color: Color.fromRGBO(60, 60, 60, 1),
                                    child: Text(
                                      // "not text",
                                      "lineData",
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
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                  margin: EdgeInsets.all(5),
                                  padding: EdgeInsets.all(5),
                                  // color: Color.fromRGBO(60, 60, 60, 1),
                                  child: Icon(
                                    Icons.error,
                                    size: 25,
                                    color: Colors.blue.shade400,
                                  )),
                              Expanded(
                                  child: Container(
                                      margin: EdgeInsets.all(5),
                                      padding: EdgeInsets.all(5),
                                      // color: Color.fromRGBO(60, 60, 60, 1),
                                      child: Text(
                                        "linedata",
                                        // data.line_items.first.name
                                        //     .split("--")[0],
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            fontFamily: "Roboto Condensed",
                                            fontWeight: FontWeight.w600,
                                            fontSize: 12,
                                            color: Color.fromRGBO(
                                                132, 131, 133, 1)),
                                      ))),
                            ]),
                      ],
                    ),
                  ),
                  //or

//Product Details

                  Container(
                      child: Text(
                    jk.toString() + "% Process has  been completed",
                    style: TextStyle(
                        fontFamily: "Roboto Condensed",
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                        color: Color.fromRGBO(132, 131, 133, 1)),
                  )),

                  Center(
                    child: Container(
                      child: getFilledTrackStyle(jk),
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
                                                child: Text("Delivery",
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
                                              color: Colors.blue.shade400),
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
                                              color: Colors.blue.shade400),
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
                                              color: Colors.blue.shade400),
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
                                              color: Colors.blue.shade400),
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
            else if (data.status == "complete") {
              status2 = "Delivery";
              jk = 100.0;
              return Container(
                  child: Column(
                children: [
//product Details

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
                                  color: Colors.blue.shade400,
                                )),
                            Expanded(
                                child: Container(
                                    margin: EdgeInsets.all(5),
                                    padding: EdgeInsets.all(5),
                                    // color: Color.fromRGBO(60, 60, 60, 1),
                                    child: Text(
                                      // "not text",
                                      "linedata",
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
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                  margin: EdgeInsets.all(5),
                                  padding: EdgeInsets.all(5),
                                  // color: Color.fromRGBO(60, 60, 60, 1),
                                  child: Icon(
                                    Icons.error,
                                    size: 25,
                                    color: Colors.blue.shade400,
                                  )),
                              Expanded(
                                  child: Container(
                                      margin: EdgeInsets.all(5),
                                      padding: EdgeInsets.all(5),
                                      // color: Color.fromRGBO(60, 60, 60, 1),
                                      child: Text(
                                        "linedata",
                                        // data.line_items.first.name
                                        //     .split("--")[0],
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            fontFamily: "Roboto Condensed",
                                            fontWeight: FontWeight.w600,
                                            fontSize: 12,
                                            color: Color.fromRGBO(
                                                132, 131, 133, 1)),
                                      ))),
                            ]),
                      ],
                    ),
                  ),
                  //or

//Product Details

                  Container(
                      child: Text(
                    jk.toString() + "% Process has  been completed",
                    style: TextStyle(
                        fontFamily: "Roboto Condensed",
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                        color: Color.fromRGBO(132, 131, 133, 1)),
                  )),

                  Center(
                    child: Container(
                      child: getFilledTrackStyle(jk),
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
                                                child: Text("Delivery",
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
                                              color: Colors.blue.shade400),
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
                                              color: Colors.blue.shade400),
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
                                              color: Colors.blue.shade400),
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
                                              color: Colors.blue.shade400),
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
  Widget getNormalProgressStyle() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          height: 120,
          width: 120,
          child: SfRadialGauge(axes: <RadialAxis>[
            RadialAxis(
                minimum: 0,
                maximum: 100,
                showLabels: false,
                showTicks: false,
                radiusFactor: 0.8,
                axisLineStyle: AxisLineStyle(
                  thickness: 0.2,
                  cornerStyle: CornerStyle.bothCurve,
                  color: const Color.fromARGB(30, 0, 169, 181),
                  thicknessUnit: GaugeSizeUnit.factor,
                ),
                pointers: <GaugePointer>[
                  RangePointer(
                      value: progressValue,
                      cornerStyle: CornerStyle.bothCurve,
                      width: 0.2,
                      sizeUnit: GaugeSizeUnit.factor,
                      enableAnimation: true,
                      animationDuration: 100,
                      animationType: AnimationType.linear)
                ],
                annotations: <GaugeAnnotation>[
                  GaugeAnnotation(
                      positionFactor: 0.1,
                      angle: 90,
                      widget: Text(
                        progressValue.toStringAsFixed(0) + ' / 100',
                        style: const TextStyle(fontSize: 11),
                      ))
                ])
          ]),
        ),
        Container(
          height: 120,
          width: 120,
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
                  thickness: 0.05,
                  color: const Color.fromARGB(30, 0, 169, 181),
                  thicknessUnit: GaugeSizeUnit.factor,
                ),
                pointers: <GaugePointer>[
                  RangePointer(
                      value: progressValue,
                      width: 0.05,
                      sizeUnit: GaugeSizeUnit.factor,
                      enableAnimation: true,
                      animationDuration: 100,
                      animationType: AnimationType.linear)
                ],
                annotations: <GaugeAnnotation>[
                  GaugeAnnotation(
                      positionFactor: 0,
                      widget: Text(progressValue.toStringAsFixed(0) + '%'))
                ])
          ]),
        ),
      ],
    );
  }

  /// Returns filled track style circular progress bar.
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
                  width: 0.08,
                  enableAnimation: true,
                  animationDuration: 100,
                  color: Colors.blueAccent.shade100,
                  pointerOffset: 0.1,
                  cornerStyle: CornerStyle.bothCurve,
                  animationType: AnimationType.linear,
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

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}
