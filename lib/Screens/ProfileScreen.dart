import 'package:fitness_support/commonStyles.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Styles.backgroundColor.withOpacity(0.2),
        child: Center(
          child: Text('Profile Page'),
        ),
      ),
    );
  }
}
