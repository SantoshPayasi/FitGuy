import 'package:fitness_support/commonStyles.dart';
import 'package:flutter/material.dart';

class FormTextField extends StatefulWidget {
  final TextEditingController controller;
  final String Label;
  final String Text;
  final bool obscureText;
  final IconData icon;


  const FormTextField(
      {super.key,
      required this.controller,
      required this.Text,
      required this.obscureText,
      required this.Label,
      required this.icon,});

  @override
  State<FormTextField> createState() => _FormTextFieldState();
}

class _FormTextFieldState extends State<FormTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      height: 70,
      child: TextFormField(
        controller: widget.controller,
        obscureText: widget.obscureText,
        style: const TextStyle(
            fontSize: 15, fontWeight: FontWeight.w400, letterSpacing: 1.5),
        decoration: InputDecoration(
          errorStyle: const TextStyle(color: Colors.redAccent),
          prefixIcon: Icon(
            widget.icon,
            color: Colors.indigo.shade400,
          ),
          label: Text(widget.Label),
          labelStyle: TextStyle(color: Colors.grey.shade400, fontSize: 18),
          hintText: widget.Text,
          hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 18),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(color: Colors.grey.shade400)),
          enabledBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              borderSide:
                  BorderSide(color: Styles.backgroundColor.withOpacity(0.2))),
        ),
      ),
    );
  }
}
