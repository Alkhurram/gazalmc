import 'package:flutter/material.dart';
import 'package:gazal/pages/base_page.dart';

// ignore: must_be_immutable
class Orders extends BasePage {
  Orders(
      {Key key,
      this.productId,
      this.productName,
      this.attrubiteID,
      this.attrubiteName})
      : super(key: key);

  String productId;
  String productName;
  String attrubiteID;
  String attrubiteName;

  @override
  _OrdersState createState() => _OrdersState();
}

class _OrdersState extends BasePageState<Orders> {
  @override
  Widget pageUI() {
    return Container(
      child: Text("Product ID:" +
          this.widget.productId +
          "\n" +
          "Product Name:" +
          this.widget.productName +
          "\n" +
          "Attribute ID:" +
          this.widget.attrubiteID +
          "\n" +
          "Attribute Name:" +
          this.widget.attrubiteName),
    );
  }
}
