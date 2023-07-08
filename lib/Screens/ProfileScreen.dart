import 'package:fitness_support/commonStyles.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          color: Colors.white,
          child: Stack(children: [
            Column(
              children: [
                Container(
                  height: 200,
                  margin: EdgeInsets.all(10),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Styles.backgroundColor.withOpacity(0.1),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(10))),
                  child: Center(
                    child: Text(
                      'FitGuy',
                      style: GoogleFonts.dancingScript(
                          fontSize: 50,
                          fontWeight: FontWeight.w600,
                          color: Styles.backgroundColor),
                    ),
                  ),
                ),
                const CircleAvatar(
                  radius: 30,
                  child: Image(
                    image: AssetImage(
                      'assets/images/Profile.png',
                    ),
                    fit: BoxFit.cover,
                    width: 60,
                  ),
                ),
                const Gap(10),
                Text(
                  "Santosh Kumar Payasi",
                  style: GoogleFonts.albertSans(
                    fontSize: 20,
                  ),
                ),
                Gap(10),
                Text(
                  "Ui, Ux Designer and Flutter Developer",
                  style: GoogleFonts.albertSans(
                    fontSize: 15,
                    color: Colors.grey.shade400
                  ),
                ),
                Text(
                  "Sangram Colony Satna",
                  style: GoogleFonts.albertSans(
                    fontSize: 15,
                    color: Colors.grey.shade400
                  ),
                ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        margin:EdgeInsets.all(10),
                        height:50,
                        width:150,
                        decoration: BoxDecoration(
                          color: Colors.indigo.shade200,
                          borderRadius: const BorderRadius.all(Radius.circular(10))
                        ),
                        child: const Text('See your Schedules', style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),),
                      ),
                      Container(
                        alignment: Alignment.center,
                        margin:EdgeInsets.all(10),
                        height:50,
                        width:150,
                        decoration: BoxDecoration(
                            color: Colors.indigo.shade200,
                            borderRadius: const BorderRadius.all(Radius.circular(10))
                        ),
                        child: const Text('Class Details', style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),),
                      )
                    ],
                  ),
                Container(
                  margin: EdgeInsets.only(left: 30, right:30, top:10, bottom: 10),
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                      border: Border.all(color: Colors.indigo.shade100),
                    borderRadius: const BorderRadius.all(Radius.circular(10))
                  ),
                  child:ListTile(
                    leading: Icon(Icons.subscriptions, color: Colors.indigo,),
                    title: Text("See subscriptions Details", style: GoogleFonts.actor(color: Colors.indigo.shade200),),
                  ),
                ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        margin:EdgeInsets.all(10),
                        height:150,
                        width:150,
                        decoration: BoxDecoration(
                          color: Colors.indigo.shade200,
                          borderRadius: const BorderRadius.all(Radius.circular(10))
                        ),
                        child: const Text('See your Schedules', style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),),
                      ),

                      Container(
                        alignment: Alignment.center,
                        margin:EdgeInsets.all(10),
                        height:150,
                        width:150,
                        decoration: BoxDecoration(
                            color: Colors.indigo.shade200,
                            borderRadius: const BorderRadius.all(Radius.circular(10))
                        ),
                        child: const Text('Class Details', style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),),
                      )
                    ],
                  ),

              ],
            ),
          ])),
    );
  }
}
