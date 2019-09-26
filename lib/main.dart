import 'package:flutter/material.dart';
import './listpage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: listpage(),
    );
  }
}

