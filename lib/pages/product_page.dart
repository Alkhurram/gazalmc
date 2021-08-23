import 'package:flutter/material.dart';
import 'package:gazal/pages/base_page.dart';
import 'package:gazal/pages/single_product.dart';
import 'package:gazal/models/product.dart';
import 'package:gazal/models/apiService.dart';
import 'package:url_launcher/url_launcher.dart';

// ignore: must_be_immutable
class ProductPage extends BasePage {
  ProductPage({
    Key key,
    this.categoryid,
  }) : super(key: key);
  int categoryid;

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends BasePageState<ProductPage> {
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
        // color: Color.fromRGBO(17, 3, 77, 1),
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
                      child: Image.asset("images/web.png", width: 30),
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
                          //     "+971501531777", "Hello");
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
                              color: const Color(0xff7c94b6),
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
                              color: const Color(0xff7c94b6),
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
                            fontSize: 15,
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
          _productsList()
        ]));
  }

  Widget _productsList() {
    return Container(
        color: Colors.black,
        // color: Color.fromRGBO(17, 3, 77, 1),
        child: new FutureBuilder(
            future: apiService.getProduct(
                categoryid: this.widget.categoryid.toString()),
            builder:
                (BuildContext context, AsyncSnapshot<List<Product>> model) {
              if (model.hasData) {
                return _buildList(model.data);
              }
              return Center(child: CircularProgressIndicator());
            }));
  }
// Widget _buildList(List<Product> items){
// return Container(
// height:200,
// child:ListView.builder(
// shrinkWrap: true,
// physics: ClampingScrollPhysics(),
// scrollDirection: Axis.horizontal,
// itemCount: items.length,
// itemBuilder: (context, index){
// var data=items[index];
// return ProductCard(data:data,);

// }

// )

// );

// }

  Widget _buildList(List<Product> item) {
    return Container(
        alignment: Alignment.centerLeft,
        child: ListView.builder(
            shrinkWrap: true,
            physics: ClampingScrollPhysics(),
            scrollDirection: Axis.vertical,
            itemCount: item.length,
            itemBuilder: (context, index) {
              var data = item[index];

              return

                  // GestureDetector(
                  //   onTap: () {
                  MaterialButton(
                      padding: EdgeInsets.all(0),
                      minWidth: 0,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SingleProduct(
                                      id: data.id,
                                      name: data.name.toString(),
                                    )));
                      },
                      child: Container(
                          margin: EdgeInsets.all(3),
                          // padding: EdgeInsets.all(5),
                          // color: Color.fromRGBO(60, 60, 60, 1),
                          // color: Color.fromRGBO(46, 22, 148, 1),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              Container(
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(40, 40, 40, 1),
                                  border: Border.all(
                                      // color: Color.fromRGBO(54, 54, 54, 1),
                                      ),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),

                                // color: Color.fromRGBO(46, 22, 148, 1))),
                                padding: EdgeInsets.all(10),
                                child: Row(
                                  // mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Flexible(
                                        flex: 1,
                                        fit: FlexFit.tight,
                                        child: Container(
                                          padding: EdgeInsets.all(5),
                                          child: Icon(
                                            Icons.phonelink_setup,
                                            size: 20,
                                            color: Colors.lightBlueAccent,

                                            // Color.fromRGBO(132, 131, 133, 1)
                                          ),

                                          // color: Colors.blueAccent[100]),
                                        )),
                                    Flexible(
                                        flex: 6,
                                        fit: FlexFit.tight,
                                        child: Container(
                                          child: Text(
                                            data.name.toString(),
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                                fontFamily: "Roboto Condensed",
                                                fontWeight: FontWeight.w600,
                                                color: Color.fromRGBO(
                                                    132, 131, 133, 1)),

                                            // color: Colors.blueAccent[100]),
                                          ),
                                        )),
                                    Flexible(
                                        flex: 1,
                                        fit: FlexFit.tight,
                                        child: Container(
                                          child: Icon(Icons.arrow_right,
                                              size: 20,
                                              color: Colors.lightBlueAccent),
                                        )),
                                  ],
                                ),
                              ),
                            ],
                          )));
            }));
  }
}
