import 'package:flutter/material.dart';
import 'package:gazal/pages/base_page2.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:gazal/models/apiService.dart';

// ignore: must_be_immutable
class AboutUs extends BasePages {
  @override
  _AboutUsState createState() => _AboutUsState();
}

class _AboutUsState extends BasePagesState<AboutUs> {
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
                        child: Text("Mobile Repair Booking At Your Doorstep",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: "Roboto Condensed",
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: Colors.amber,
                            )))),
              ])),

//Product Apple
          Container(
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
                  FittedBox(
                    fit: BoxFit.fill,
                    child: Image.network(
                        "https://gazal.ae/wp-content/uploads/2021/01/11.jpg"),
                  ),
                  Container(
                    // padding: EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Flexible(
                            flex: 6,
                            fit: FlexFit.tight,
                            child: Container(
                              child: Text(
                                "\n\nThe efficiency of the mobile phone repair depends on the level of professionalism of the service center masters. Modern centers, performing phones and smartphones repair at your doorstep in Dubai, perform the repair of the phones of various brands and any complexity. Gazal is the leader among service centers of Dubai. Masters from our service are ready to bring your phone back to life and work with  Samsung, HTC,and Apple iPhone  and other devices." +
                                    "\n\nAbsolutely all works are performed on modern equipment. The technological process in our workshops is very efficient, so will get your repaired mobile phone or smartphone right in time. We work with both hardware and software problems! If for example, the phone screen does not turn off while calling, we will help you even with it.",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontSize: 13,
                                    fontFamily: "Roboto Condensed",
                                    // fontWeight: FontWeight.w600,
                                    color: Color.fromRGBO(132, 131, 133, 1)),
                              ),
                            )),
                      ],
                    ),
                  ),
                ],
              )),
          //Product Sumsung
        ]));
    //Product Sumsung
  }
}
