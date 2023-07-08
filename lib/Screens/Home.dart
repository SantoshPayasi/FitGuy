import 'package:flutter/material.dart';

import '../commonStyles.dart';

class Home extends StatefulWidget {
  final String? name;

  const Home({Key? key, this.name}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(color: Styles.backgroundColor.withOpacity(0.1),

      ),
       child: const Text('Home Screen'),
    ));
  }
}
