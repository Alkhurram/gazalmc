import 'package:flutter/material.dart';
class TestClass extends StatefulWidget {
  @override
  _TestClassState createState() => _TestClassState();
}

class _TestClassState extends State<TestClass> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:Scaffold(
appBar:AppBar(title: Text("working fine"),),
body: Container(child: Text("working fine")),
      ),
    );
  }
}