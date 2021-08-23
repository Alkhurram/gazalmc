import 'package:flutter/material.dart';
import 'package:gazal/pages/dashboard3.dart';

import 'package:share/share.dart';


// ignore: must_be_immutable
class HomePagess extends StatefulWidget {
  HomePagess({Key key, this.id, this.name, this.email}) : super(key: key);

  int id;
  String name;
  String email;
  @override
  _HomePagessState createState() => _HomePagessState();
}

class _HomePagessState extends State<HomePagess> {
  List<Widget> _widgetList = [
    DashboardPagess(),
    DashboardPagess(),
    DashboardPagess(),
    DashboardPagess(),
    DashboardPagess(),
    DashboardPagess(),
  ];
  String name;
  String email;
  int _index = 1;

  GlobalKey _bottomNavigationKey = GlobalKey();

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,

        appBar: _buildAppbar(),
        drawer: Drawer(
          child: Container(

            // margin: EdgeInsets.all(3),
            // padding: EdgeInsets.all(3),
              color: Colors.lightBlueAccent,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: 40),
                  Center(
                    child: Container(
                      // width:200,
                      // height: 200,
                      child: Image.asset("images/logo2.png"),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      // color:Colors.blue.shade900,
                      // color: Color.fromRGBO(40, 40, 40, 1),
                      border: Border.all(
                        color: Color.fromRGBO(66, 66, 66, 1),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Text("About Gazal",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontFamily: "Roboto Condensed",
                                fontSize: 14,
                                color: Colors.black,
                              )),
                        ),
                        Container(
                          child: Icon(
                            Icons.arrow_circle_down,
                            color: Colors.black,
                            size: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                      child: Center(
                        child: Text("Mobile Repair at your doorstep",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: "Roboto Condensed",
                              fontSize: 16,
                              // color: Colors.black,
                            )),
                      )),
                  Container(
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      // color: Color.fromRGBO(40, 40, 40, 1),
                      // color: Colors.lightBlueAccent,
                      border: Border.all(
                        color: Color.fromRGBO(66, 66, 66, 1),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: Text(
                        "The efficiency of the mobile phone repair depends on the level of professionalism of the service center masters. Modern centers, performing phones and smartphones repair at your doorstep in Dubai, perform the repair of the phones of various brands and any complexity. Gazal is the leader among service centers of Dubai. Masters from our service are ready to bring your phone back to life and work with  Samsung, HTC,and Apple iPhone  and other devices." +
                            "\n\nAbsolutely all works are performed on modern equipment. The technological process in our workshops is very efficient, so will get your repaired mobile phone or smartphone right in time. We work with both hardware and software problems! If for example, the phone screen does not turn off while calling, we will help you even with it.",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontFamily: "Roboto Condensed",
                          fontSize: 14,
                          color: Colors.black,
                        )),
                  ),
                  Container(
                      margin: EdgeInsets.all(3),
                      padding: EdgeInsets.all(3),
                      child: Column(
                        children: [
                          Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    margin: EdgeInsets.all(3),
                                    padding: EdgeInsets.all(3),
                                    decoration: BoxDecoration(
                                      color: Color.fromRGBO(40, 40, 40, 1),
                                      border: Border.all(
                                        color: Color.fromRGBO(66, 66, 66, 1),
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                    child: Center(
                                        child: Icon(
                                          Icons.web,
                                          color: Colors.white,
                                          size: 20,
                                        )),
                                  ),
                                  Container(
                                    margin: EdgeInsets.all(3),
                                    padding: EdgeInsets.all(3),
                                    decoration: BoxDecoration(
                                      color: Color.fromRGBO(40, 40, 40, 1),
                                      border: Border.all(
                                        color: Color.fromRGBO(66, 66, 66, 1),
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                    child: Center(
                                        child: Icon(
                                          Icons.email,
                                          color: Colors.white,
                                          size: 20,
                                        )),
                                  ),
                                ],
                              )),
                          Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    margin: EdgeInsets.all(3),
                                    padding: EdgeInsets.all(3),
                                    decoration: BoxDecoration(
                                      color: Color.fromRGBO(40, 40, 40, 1),
                                      border: Border.all(
                                        color: Color.fromRGBO(66, 66, 66, 1),
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                    child: Center(
                                        child: Text("www.gazal.ae",
                                            style: TextStyle(
                                              fontSize: 13,
                                              color: Colors.white,
                                              // color: Color.fromRGBO(60, 60, 60, 1),
                                            ))),
                                  ),
                                  Container(
                                    margin: EdgeInsets.all(3),
                                    padding: EdgeInsets.all(3),
                                    decoration: BoxDecoration(
                                      color: Color.fromRGBO(40, 40, 40, 1),
                                      border: Border.all(
                                        color: Color.fromRGBO(66, 66, 66, 1),
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                    child: Center(
                                        child: Text("info@gazal.ae",
                                            style: TextStyle(
                                              fontSize: 13,
                                              color: Colors.white,
                                            ))),
                                  ),
                                ],
                              )),
                        ],
                      )),
                ],
              )),
        ),
        body: _widgetList[_index]);
    // );
  }

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
        ),

        // Icon(Icons.login_sharp, color: Colors.blue.shade200),
        // SizedBox(width: 10),
        // Icon(Icons.search, color: Colors.blue.shade200),
        // SizedBox(width: 10),
      ],
    );
  }
}
