import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Messages {
 Future<bool?> showSuccessToast(String Message) {
    return Fluttertoast.showToast(
        msg: Message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green.shade400,
        textColor: Colors.white
    );
  }

Future<bool?> showWorningToast(String Message) {
    return Fluttertoast.showToast(
        msg: Message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red.shade400,
        textColor: Colors.white
    );
  }

  void FlutterSnakBar(BuildContext context, String Message){
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          Message)));
}
}