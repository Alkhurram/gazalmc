import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gazal/models/ApiService.dart';
import 'package:gazal/models/category.dart';
import 'package:gazal/pages/product_page.dart';

class Widgetcategory extends StatefulWidget {
  @override
  _WidgetcategoryState createState() => _WidgetcategoryState();
}

class _WidgetcategoryState extends State<Widgetcategory> {
  APIService apiService;
  Category categorymodel;
  @override
  void initState() {
    apiService = new APIService();
    categorymodel = new Category();
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
              Padding(
                padding: EdgeInsets.only(left: 16, right: 16, top: 4),
                child: Text(
                  "Select Your Brand To Fix",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: "CartIcons",
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.blueAccent[800]),
                ),
              ),
              // Padding(
              //   padding: EdgeInsets.only(right: 10, top: 10),
              //   child: Text(
              //     "View All",
              //     style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              //   ),
              // ),
            ],
          ),
          _categiresList(),
        ],
      ),
    );
  }

  Widget _categiresList() {
    return new FutureBuilder(
        future: apiService.getCategories(),
        builder: (
          BuildContext context,
          AsyncSnapshot<List<Category>> model,
        ) {
          if (model.hasData) {
            return _buildCategoryList(model.data);
          }
          return Center(child: CircularProgressIndicator());
        });
  }

  Widget _buildCategoryList(List<Category> category) {
    return Container(
        height: 150,
        alignment: Alignment.centerLeft,
        child: ListView.builder(
            shrinkWrap: true,
            physics: ClampingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: category.length,
            itemBuilder: (context, index) {
              var data = category[index];

              return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ProductPage(
                                  categoryid: data.categoryid,
                                )));
                  },
                  child: Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.all(5),
                        width: 80,
                        height: 80,
                        alignment: Alignment.center,
                        child: Text("find"
                            // Image.network(
                            //   data.image.url,
                            //   width: 70,
                            //   height: 70,
                            ),
                        decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black12,
                                  offset: Offset(0, 5),
                                  blurRadius: 3)
                            ]),
                      ),
                      Container(
                        child: Text(
                          data.categoryName.toString(),
                          style: TextStyle(
                              fontFamily: "Roboto Condensed",
                              fontWeight: FontWeight.w700,
                              color: Colors.black54),
                        ),
                      ),
                    ],
                  ));
            }));
  }
}
