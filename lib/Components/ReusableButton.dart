// ignore_for_file: file_names, non_constant_identifier_names, prefer_const_constructors

import 'package:flutter/material.dart';

class SubmitButton extends StatelessWidget {
  final String Lable;
  final Function SubmitNow;
  final bool isLoading ;
  const SubmitButton({Key? key, required this.Lable, required this.SubmitNow, required this.isLoading}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(horizontal: 10),
      height: 50,
      child: ElevatedButton(
        onPressed: (){
          SubmitNow();
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.indigo.shade300,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10))),
        child: isLoading?const CircularProgressIndicator(): Text(Lable),
      ),
    );
  }
}
