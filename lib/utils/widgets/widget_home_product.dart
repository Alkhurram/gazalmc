import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gazal/models/ApiService.dart';
import 'package:gazal/models/product.dart';
import 'package:gazal/pages/product_page.dart';

// ignore: must_be_immutable
class WidgetsProducts extends StatefulWidget {
  //  WidgetsProducts({Key key,this.lablename,this.tagid}):super(key:key);

  // String lablename;
  // String tagid;

  WidgetsProducts({Key key, this.categoryid}) : super(key: key);

  String categoryid;

  @override
  _WidgetsProductsState createState() => _WidgetsProductsState();
}

class _WidgetsProductsState extends State<WidgetsProducts> {
  APIService apiService;
  @override
  void initState() {
    apiService = new APIService();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // color:  Color.fromRGBO(29, 25, 75, .5),

      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // Padding(
              //   padding: EdgeInsets.only(left: 16, right: 16, top: 4),
              //   child: Text(
              //     "this.widget.lablename",
              //     textAlign: TextAlign.center,
              //     style: TextStyle(
              //         fontFamily: "CartIcons",
              //         fontWeight: FontWeight.bold,
              //         fontSize: 18,
              //         color: Colors.blueAccent[800]),
              //   ),
              // ),
              // Padding(
              //   padding: EdgeInsets.only(right: 10, top: 10),
              //   child: Text(
              //     "View All",
              //     style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              //   ),
              // ),
            ],
          ),
          _productsList(),
        ],
      ),
    );
  }

  Widget _productsList() {
    return new FutureBuilder(
        future: apiService.getProduct(
            categoryid: this.widget.categoryid.toString()),
        builder: (
          BuildContext context,
          AsyncSnapshot<List<Product>> model,
        ) {
          if (model.hasData) {
            return _buildList(model.data);
            // return Container(child:
            // Text(this.widget.categoryid.toString()),
            // );
          }
          return Center(child: CircularProgressIndicator());
        });
  }

  Widget _buildList(List<Product> item) {
    return Container(
        height: 250,
        alignment: Alignment.centerLeft,
        child: ListView.builder(
            shrinkWrap: true,
            physics: ClampingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: item.length,
            itemBuilder: (context, index) {
              var data = item[index];

              return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ProductPage(
                                  categoryid: data.id,
                                )));
                  },
                  child: Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.all(5),
                        width: 130,
                        height: 180,
                        alignment: Alignment.center,
                        child: Image.network(
                          data.images[0].src,
                          width: 120,
                          height: 120,
                        ),
                        decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            color: Color.fromRGBO(46, 22, 148, 1),

                            // color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black12,
                                  offset: Offset(0, 5),
                                  blurRadius: 12)
                            ]),
                      ),
                      Container(
                        child: Text(
                          data.name.toString(),
                          style: TextStyle(
                              fontFamily: "Roboto Condensed",
                              fontWeight: FontWeight.w700,
                              fontSize: 12,
                              color: Colors.white),
                        ),
                      ),
                    ],
                  ));
            }));
  }
}
