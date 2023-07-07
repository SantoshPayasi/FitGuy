import 'package:fitness_support/commonStyles.dart';
import 'package:flutter/material.dart';
class Schedules extends StatelessWidget {
  const Schedules({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
        color: Styles.backgroundColor.withOpacity(0.2),
        child: Center(
          child:Text("Schedule Page") ,
        ) ,
      )
       
    );
  }
}
