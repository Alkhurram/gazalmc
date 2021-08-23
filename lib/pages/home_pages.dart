import 'package:flutter/material.dart';
import 'package:gazal/pages/dashboord2_page.dart';
import 'package:gazal/pages/aboutus.dart';
import 'package:gazal/pages/home_page.dart';
import 'package:share/share.dart';


// ignore: must_be_immutable
class HomePages extends StatefulWidget {
  HomePages({Key key, this.id, this.name, this.email}) : super(key: key);

  int id;
  String name;
  String email;
  @override
  _HomePagesState createState() => _HomePagesState();
}

class _HomePagesState extends State<HomePages> {
  List<Widget> _widgetList = [
    DashboardPages(),
    DashboardPages(),
    DashboardPages(),
    DashboardPages(),
    DashboardPages(),
    DashboardPages(),
  ];
  String name;
  String email;
  int _index = 1;

  GlobalKey _bottomNavigationKey = GlobalKey();

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: _buildAppbar(),
      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
        child: _buttomBar(),
      ),
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
      body: _widgetList[_index],
    );
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

  Widget _buttomBar() {
    return Container(
      child: Row(children: [
        Flexible(
            flex: 1,
            fit: FlexFit.tight,
            child: Container(
              height: 60,
              margin: EdgeInsets.all(1),
              padding: EdgeInsets.all(1),
              decoration: BoxDecoration(
                color: Colors.lightBlueAccent,
                // color: Color.fromRGBO(40, 40, 40, 1),
                border: Border.all(
                  width: 1,
                  color: Color.fromRGBO(40, 40, 40, 1),
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Center(
                  child: MaterialButton(
                padding: EdgeInsets.all(0),
                minWidth: 0,
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomePage()));
                },
                child: Container(
                    child: Column(
                  children: [
                    Icon(Icons.update,
                        color: Colors.black, semanticLabel: 'Semantics'),
                    SizedBox(height: 5),
                    Container(
                      child: Text(
                        "Booking",
                        style: TextStyle(
                          fontFamily: "Roboto Condensed",
                          fontWeight: FontWeight.bold,
                          fontSize: 11,
                          color: Colors.black,
                        ),
                      ),
                    )
                  ],
                )),
              )),
            )),

        //Second one

        Flexible(
            flex: 1,
            fit: FlexFit.tight,
            child: Container(
              height: 60,
              margin: EdgeInsets.all(1),
              padding: EdgeInsets.all(1),
              decoration: BoxDecoration(
                color: Colors.amber,
                // color: Color.fromRGBO(40, 40, 40, 1),
                border: Border.all(
                  width: 1,
                  color: Color.fromRGBO(40, 40, 40, 1),
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Center(
                  child: MaterialButton(
                padding: EdgeInsets.all(0),
                minWidth: 0,
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomePages()));
                },
                child: Container(
                    child: Column(
                  children: [
                    Icon(Icons.tap_and_play,
                        color: Colors.black, semanticLabel: 'Semantics'),
                    SizedBox(height: 5),
                    Container(
                      child: Text(
                        "Booking Details",
                        style: TextStyle(
                          fontFamily: "Roboto Condensed",
                          fontWeight: FontWeight.bold,
                          fontSize: 11,
                          color: Colors.black,
                        ),
                      ),
                    )
                  ],
                )),
              )),
            )),

        Flexible(
            flex: 1,
            fit: FlexFit.tight,
            child: Container(
              height: 60,
              margin: EdgeInsets.all(1),
              padding: EdgeInsets.all(1),
              decoration: BoxDecoration(
                color: Colors.lightBlueAccent,
                // color: Color.fromRGBO(40, 40, 40, 1),
                border: Border.all(
                  width: 1,
                  color: Color.fromRGBO(40, 40, 40, 1),
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Center(
                  child: MaterialButton(
                padding: EdgeInsets.all(0),
                minWidth: 0,
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AboutUs()));
                },
                child: Container(
                    child: Column(
                  children: [
                    Icon(Icons.mobile_friendly_sharp,
                        color: Colors.black, semanticLabel: 'Semantics'),
                    SizedBox(height: 5),
                    Container(
                      child: Text(
                        "About Gazal",
                        style: TextStyle(
                          fontFamily: "Roboto Condensed",
                          fontWeight: FontWeight.bold,
                          fontSize: 11,
                          color: Colors.black,
                        ),
                      ),
                    )
                  ],
                )),
              )),
            )),

        Flexible(
            flex: 1,
            fit: FlexFit.tight,
            child: Container(
              height: 60,
              margin: EdgeInsets.all(1),
              padding: EdgeInsets.all(1),
              decoration: BoxDecoration(
                color: Colors.lightBlueAccent,
                // color: Color.fromRGBO(40, 40, 40, 1),
                border: Border.all(
                  width: 1,
                  color: Color.fromRGBO(40, 40, 40, 1),
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Center(
                  child: MaterialButton(
                padding: EdgeInsets.all(0),
                minWidth: 0,
                onPressed: () {
                  Share.share('check out Gazal  website https://gazal.ae' +
                      "Repair your Mobile at your Doorstep.You can download IOS and" +
                      "Andriod app from Apple store and Google play.");
                },
                child: Container(
                    child: Column(
                  children: [
                    Icon(Icons.share,
                        color: Colors.black, semanticLabel: 'Semantics'),
                    SizedBox(height: 5),
                    Container(
                      child: Text(
                        "Share App",
                        style: TextStyle(
                          fontFamily: "Roboto Condensed",
                          fontWeight: FontWeight.bold,
                          fontSize: 11,
                          color: Colors.black,
                        ),
                      ),
                    )
                  ],
                )),
              )),
            )),
      ]),
      // )
      //     ])  // buttomBar(),
    );
  }
}
