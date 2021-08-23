import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gazal/models/product.dart';

// ignore: must_be_immutable
class ProductCard extends StatelessWidget {
  ProductCard({Key key, this.data}) : super(key: key);
  Product data;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFFFFFFFF),
        borderRadius: BorderRadius.all(Radius.circular(20)),
        boxShadow: <BoxShadow>[
          BoxShadow(color: Color(0xfff8f8f8), blurRadius: 15, spreadRadius: 10),
        ],
      ),
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Stack(alignment: Alignment.center, children: <Widget>[
            Column(
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Flexible(
                      child: Stack(
                        alignment: Alignment.center,
                        children: <Widget>[
                          CircleAvatar(
                            backgroundColor: Color(0xfff8f8f8).withAlpha(40),
                          ),
                          Image.network(
                            data.images.length > 0
                                ? data.images[0].src
                                : "http://gazal.ae/wp-content/uploads/2020/12/Hawaei-1.jpg",
                            height: 150,
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      data.name,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                )
              ],
            )
          ])),
      // color:  Color.fromRGBO(29, 25, 75, .5),
    );
  }
}
