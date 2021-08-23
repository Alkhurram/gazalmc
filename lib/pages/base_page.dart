import 'package:flutter/material.dart';
import 'package:gazal/pages/home_page.dart';
import 'package:gazal/pages/home_pages.dart';

import 'package:gazal/utils/ProgressHUD.dart';
import 'package:gazal/pages/aboutus.dart';
import 'package:share/share.dart';

class BasePage extends StatefulWidget {
  BasePage({Key key}) : super(key: key);

  @override
  BasePageState createState() => BasePageState();
}

class BasePageState<T extends BasePage> extends State<T> {
  String name;

  bool isApiCallProces = false;

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,

      appBar: _buildAppbar(),
      bottomNavigationBar: BottomAppBar(
        color:Colors.black,

        // color: Color.fromRGBO(60, 60, 60, 1),
        child:
        _buttomBar(),
      ),
      body: ProgressHUD(
        child: pageUI(),
        inAsyncCall: isApiCallProces,
        opacity: 0.3,
      ),
    );
  }

  Widget pageUI() {
    return null;
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
        )
      ],
    );
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
                margin: EdgeInsets.all(1),
                padding: EdgeInsets.all(1),
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
                margin: EdgeInsets.all(1),
                padding: EdgeInsets.all(1),
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
                margin: EdgeInsets.all(1),
                padding: EdgeInsets.all(1),
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
                margin: EdgeInsets.all(1),
                padding: EdgeInsets.all(1),
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
