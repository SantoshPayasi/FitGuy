// ignore_for_file: file_names, non_constant_identifier_names, unused_import

import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

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
    CoolAlert.show(
      context: context,
      type: CoolAlertType.warning,
      text: Message,
    );
}


void animatedAlert(BuildContext context, String Message){
  CoolAlert.show(
    context: context,
    type: CoolAlertType.success,
    text: Message,
  );
}


}