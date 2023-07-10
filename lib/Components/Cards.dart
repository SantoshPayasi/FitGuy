// ignore_for_file: non_constant_identifier_names, prefer_if_null_operators, file_names, must_be_immutable, unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class Cards extends StatefulWidget {
  final Color? BoxColor;
  String Heading;
  String Value;
  String AnimationString;

  Cards(
      {Key? key,
      required this.Value,
      required this.Heading,
      this.BoxColor,
      required this.AnimationString})
      : super(key: key);

  @override
  State<Cards> createState() => _CardsState();
}

class _CardsState extends State<Cards> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.only(left: 10, top: 10),
      width: 150,
      decoration: BoxDecoration(
          color: widget.BoxColor == null
              ? Colors.indigo.shade500
              : widget.BoxColor,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          boxShadow: [
            BoxShadow(
                color: Colors.indigo.shade200, spreadRadius: 0.8, blurRadius: 4)
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
              child: Text(
            widget.Heading,
            style: GoogleFonts.albertSans(color: Colors.white70),
          )),
          const Gap(10),
          Center(
            child: Lottie.network(
                widget.AnimationString == null ? "https://assets10.lottiefiles.com/packages/lf20_6vltyryr.json" : widget.AnimationString, width: 50),
          ),
          const Gap(20),
          Text(
            "${widget.Value} ",
            style: const TextStyle(
                fontSize: 20,
                color: Colors.white70,
                fontWeight: FontWeight.bold),
          ),
          const Gap(2),
          Text(
            "Last Updates at 3m ",
            style: GoogleFonts.albertSans(
                fontSize: 15,
                color: Colors.grey.shade200,
                fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }
}
