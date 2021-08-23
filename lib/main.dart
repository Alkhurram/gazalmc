import 'package:flutter/material.dart';
import 'package:gazal/utils/testClass.dart';
import 'package:gazal/pages/home_page.dart';

TestClass testClass = new TestClass();

void main() {
  runApp(Home());
}

HomePage homePage = new HomePage();

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: SignupPage(),

      home: homePage,
    );
  }
}
