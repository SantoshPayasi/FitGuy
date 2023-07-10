import 'dart:math';

import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexagon/hexagon.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';

import '../Components/Cards.dart';
import '../commonStyles.dart';

class Home extends StatefulWidget {
  final String? name;

  const Home({Key? key, this.name}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late String Date = "00 000 0000";
  late int HealthScore = 0;

  @override
  void initState() {
    super.initState();
    final DateFormat formatter = DateFormat("dd MMM yyyy");
    Date = formatter.format(DateTime.now());
    HealthScore = Random().nextInt(100);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: const EdgeInsets.all(10),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Styles.backgroundColor.withOpacity(0.1),
      ),
      child: ListView(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        children: [
          const Gap(10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    Date,
                    style: GoogleFonts.actor(
                        color: Colors.indigo.shade200, fontSize: 20),
                  ),
                  Text('Hello User',
                      style:
                          GoogleFonts.sen(color: Colors.black45, fontSize: 30))
                ],
              ),
              CircleAvatar(
                backgroundColor: Colors.blue.shade100,
                radius: 30,
                child: const Icon(
                    FluentSystemIcons.ic_fluent_person_accounts_filled),
              )
            ],
          ),
          Gap(20),
          Container(
            height: 150,
            padding: EdgeInsets.all(10),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: Colors.indigo.shade100,
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                HexagonWidget.pointy(
                  width: 80,
                  color: Colors.indigo.shade300,
                  padding: 4.0,
                  child: Text(
                    "${HealthScore}",
                    style: GoogleFonts.albertSans(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 4),
                      child: Text(
                        'Health Score',
                        style: GoogleFonts.albertSans(
                            fontWeight: FontWeight.bold,
                            color: Colors.indigo,
                            fontSize: 20),
                      ),
                    ),
                    Gap(10),
                    Text(
                      " According to our analysis your \n health score is ${HealthScore} \n which is ${HealthScore > 50 ? "Good" : "Bad"} for your body",
                      style: GoogleFonts.albertSans(
                          fontWeight: FontWeight.w500,
                          color: Colors.indigo.shade300,
                          fontSize: 15),
                    ),
                  ],
                )
              ],
            ),
          ),
          const Gap(20),
          const SectionHeading(Heading: "Metrics"),
          SizedBox(
            height: 400,
            child: GridView.count(
              physics: NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              padding: EdgeInsets.all(10),
              children: [
                Cards(
                    Heading: 'Calories',
                    AnimationString:
                        "https://assets10.lottiefiles.com/packages/lf20_6vltyryr.json",
                    Value: "500 Cal",
                    BoxColor: Colors.indigo.shade600),
                Cards(
                    Heading: 'Weight',
                    AnimationString:
                        "https://assets4.lottiefiles.com/packages/lf20_szvfehji.json",
                    Value: "60 Kg",
                    BoxColor: Colors.lightBlue.shade600),
                Cards(
                    Heading: 'Water Intake',
                    AnimationString:
                        "https://assets10.lottiefiles.com/packages/lf20_fjwc7dtd.json",
                    Value: "60 L/day",
                    BoxColor: Colors.lightBlue.shade400),
                Cards(
                    Heading: 'Steps Count',
                    AnimationString:
                        "https://assets5.lottiefiles.com/packages/lf20_oIPJZuqFT1.json",
                    Value: "10km/day",
                    BoxColor: Colors.purpleAccent.shade400),
              ],
            ),
          ),
          const SectionHeading(Heading: "Offers"),
          const Gap(10),
          const AdvertismentCard(
              Name: "Ram Singh",
              Duration: "140 Hours",
              Price: "1200/-",
              Heading: "Yoga Classes"),
          Gap(10),
          const AdvertismentCard(
              Name: "Santosh Payasi",
              Duration: "120 Hours",
              Price: "12000/-",
              Heading: "Workout Classes"),
        ],
      ),
    ));
  }
}

class SectionHeading extends StatelessWidget {
  final String Heading;

  const SectionHeading({super.key, required this.Heading});

  @override
  Widget build(BuildContext context) {
    return Text(
      Heading,
      style: GoogleFonts.albertSans(
          color: Colors.indigo.shade400,
          fontSize: 20,
          fontWeight: FontWeight.bold),
    );
  }
}

class AdvertismentCard extends StatelessWidget {
  final String Name;
  final String Duration;
  final String Price;
  final String Heading;

  const AdvertismentCard(
      {super.key,
      required this.Heading,
      required this.Name,
      required this.Duration,
      required this.Price});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      padding: EdgeInsets.only(left: 10, right: 10),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: Colors.indigo.shade100,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.topRight,
              colors: [Colors.indigo.shade200, Colors.purpleAccent.shade200])),
      child: Row(
        children: [
          Lottie.network(
              'https://assets9.lottiefiles.com/packages/lf20_2g9di3mi.json',
              width: 80),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(left: 50, top: 20),
                child: Text(
                  Heading,
                  style: GoogleFonts.albertSans(
                      fontWeight: FontWeight.bold,
                      color: Colors.indigo,
                      fontSize: 20),
                ),
              ),
              Gap(5),
              Container(
                margin: EdgeInsets.only(left: 50),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            'Instructor :',
                            style: GoogleFonts.albertSans(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                          Text(' ${Name}',
                              style: GoogleFonts.albertSans(
                                  color: Colors.white70,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18)),
                        ]),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            'Duration :',
                            style: GoogleFonts.albertSans(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                          Text('${Duration}',
                              style: GoogleFonts.albertSans(
                                  color: Colors.white70,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 18)),
                        ]),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            'Price :',
                            style: GoogleFonts.albertSans(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                          Text(Price,
                              style: GoogleFonts.albertSans(
                                  color: Colors.white70,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 18)),
                        ]),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
