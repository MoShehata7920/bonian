import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

//Stateless
//Stateful

//class MyPP

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  //constructor
  //build

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: Scaffold());
  }
}
