import 'package:flutter/material.dart';

import 'Screens/splashScreen.dart';

void main(){
  runApp(fitnessApp());
}

class fitnessApp extends StatelessWidget {
  const fitnessApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        accentColor: Color(0xff6138F8)
      ),
      home: splashScreen(),
    );
  }
}
