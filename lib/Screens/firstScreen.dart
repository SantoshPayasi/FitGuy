// ignore_for_file: prefer_const_constructors, file_names

import 'package:fitness_support/Screens/Auth/Signin.dart';
import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';

import '../Components/BottomBar.dart';
import '../Components/Drower.dart';
class ControlScreen extends StatefulWidget {
  const ControlScreen({Key? key}) : super(key: key);

  @override
  State<ControlScreen> createState() => _ControlScreenState();
}

class _ControlScreenState extends State<ControlScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.indigo.shade400,
        actions: [
          IconButton(onPressed: (){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>SignIn()));
          }, icon: Icon(FluentSystemIcons.ic_fluent_sign_out_filled))
        ],
      ),
      drawer: Drawer(child: Drower(Name: 'Hello User',),) ,
      body: BottomBar(),
    );
  }
}
