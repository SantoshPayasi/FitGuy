import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:fitness_support/commonStyles.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import 'Auth/Signin.dart';

class splashScreen extends StatefulWidget {
  const splashScreen({Key? key}) : super(key: key);

  @override
  State<splashScreen> createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {
  Future<void> changeScreen() async {
    await Future.delayed(const Duration(seconds: 2));
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const SignIn()));
  }
@override
void initState() {
    // TODO: implement initState
    super.initState();
    changeScreen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Styles.backgroundColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height:70,
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width,
              child: Text('Welcome', style: GoogleFonts.dancingScript(
                fontWeight: FontWeight.bold,
                color: Color(0xffea1898),
                fontSize: 50,
              ),),),
              // child: Lottie.network(
              //     'https://assets10.lottiefiles.com/packages/lf20_cUG5w8.json',
              //     controller: _controller, onLoaded: (composition) {
              //   _controller
              //     ..duration = composition.duration
              //     ..forward();
              // }),
            // ),
            Text('To', style: GoogleFonts.dancingScript(
              fontWeight: FontWeight.w600,
              color: Colors.white,
              fontSize: 50,
            ),),
            Text('FitGuy', style: GoogleFonts.dancingScript(
              fontWeight: FontWeight.w600,
              color:Color(0xffEC6600),
              fontSize: 50,
            ),),

          ],
        ),
      ),
    );
  }
}
