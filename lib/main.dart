// ignore_for_file: prefer_const_constructors, duplicate_ignore

import 'package:flutter/material.dart';

import 'Screens/splashScreen.dart';

void main(){
  // ignore: prefer_const_constructors
  runApp(fitnessApp());
}

class fitnessApp extends StatelessWidget {
  const fitnessApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        hintColor: Color(0xff6138F8)
      ),
      home: splashScreen(),
    );
  }
}
