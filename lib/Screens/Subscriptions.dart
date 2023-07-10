// ignore_for_file: prefer_const_constructors, file_names

import 'package:fitness_support/commonStyles.dart';
import 'package:flutter/material.dart';

class Subscriptions extends StatelessWidget {
  const Subscriptions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Container(
        color: Styles.backgroundColor.withOpacity(0.2),
        child: Center(
          child: Text('Subscriptions'),
        ),
      ),
    );
  }
}
