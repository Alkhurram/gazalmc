import 'package:flutter/material.dart';
import 'package:gazal/models/Attribute.dart';
import 'package:gazal/pages/base_page.dart';

import 'package:gazal/models/apiService.dart';

// ignore: must_be_immutable
class SingleProduct extends BasePage {
  SingleProduct({Key key, this.name}) : super(key: key);
  String name;
  @override
  _SingleProductState createState() => _SingleProductState();
}

class _SingleProductState extends BasePageState<SingleProduct> {
  APIService apiService = new APIService();

  Widget pageUI() {
    // return (Container(child: Text(this.widget.name.toString())));

    return _productsAttributeList();
  }

  Widget _productsAttributeList() {
    return new FutureBuilder(
        future: apiService.getAttributes(),
        builder: (BuildContext context, AsyncSnapshot<List<Attributes>> model) {
          if (model.hasData) {
            return _buildList(model.data);

// return (Container(child:Text(model.data.toString())));

          }
          return Center(child: CircularProgressIndicator());
        });
  }

  Widget _buildList(List<Attributes> item) {
    var data = item[0];
    return Container(
        alignment: Alignment.centerLeft,
        child: GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SingleProduct(
                            name: data.name,
                          )));
            },
            child: Container(
                margin: EdgeInsets.all(2),
                padding: EdgeInsets.all(1),
                color: Colors.blue[800],
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.blueAccent)),
                      padding: EdgeInsets.all(10),
                      child: Text(
                        data.name.toString() + item.length.toString(),
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontFamily: "Roboto Condensed",
                            fontWeight: FontWeight.w700,
                            color: Colors.black54),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.blueAccent)),
                      padding: EdgeInsets.all(10),
                      child: Text(data.id.toString()),
                    ),
                  ],
                ))));
  }
}
