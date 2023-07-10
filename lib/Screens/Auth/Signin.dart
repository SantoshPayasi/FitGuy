// ignore_for_file: non_constant_identifier_names, file_names, prefer_const_constructors

import 'package:email_validator/email_validator.dart';
import 'package:fitness_support/commonStyles.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../../Components/InputElement.dart';
import '../../Components/ReusableButton.dart';
import '../firstScreen.dart';
import 'SignUp.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final TextEditingController EmailController = TextEditingController();
  final TextEditingController PasswordController = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  bool isLoading = false;

  void ChangeScreen() {
    setState(() {
      isLoading = true;
    });
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => ControlScreen()));
    setState(() {
      isLoading = false;
      EmailController.clear();
      PasswordController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Container(
            padding: EdgeInsets.all(10),
            color: Styles.backgroundColor.withOpacity(0.1),
            child: Column(
              children: [
                Container(
                    height: 200,
                    width: MediaQuery.of(context).size.width,
                    child: Lottie.network(
                        'https://assets3.lottiefiles.com/packages/lf20_ZyCSQa.json',
                        repeat: true)),
                Text(
                  'FitGuy',
                  style: GoogleFonts.dancingScript(
                      fontSize: 50,
                      fontWeight: FontWeight.w600,
                      color: Styles.backgroundColor),
                ),
                Container(
                    margin: EdgeInsets.only(top: 40),
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Login Now",
                      style: GoogleFonts.albertSans(fontSize: 30),
                    )),
                Form(
                  key: _key,
                  child: Column(
                    children: [
                      FormTextField(
                        obscureText: false,
                        Label: 'Email',
                        Text: 'Enter Your Email',
                        controller: EmailController,
                        icon: Icons.email_rounded,
                      ),
                      const Gap(5),
                      FormTextField(
                        obscureText: true,
                        Label: 'Password',
                        Text: 'Enter Your Password',
                        controller: PasswordController,
                        icon: Icons.lock,
                      ),
                      const Gap(3),
                      SubmitButton(
                        Lable: 'Sign In',
                        isLoading: isLoading,
                        SubmitNow: () async {
                          bool goodEmail = false;
                          bool goodPassword = false;
                          print('Key is presses');
                          if (EmailController.text.isNotEmpty) {
                            final isValidEmail =
                                EmailValidator.validate(EmailController.text);
                            if (isValidEmail) {
                              goodEmail = true;
                            }
                          }
                          if (PasswordController.text.isNotEmpty) {
                            if (PasswordController.text.length > 6) {
                              print(
                                  "Password is also Validated ${PasswordController.text}");
                              goodPassword = true;
                            }
                          }

                          if (goodPassword && goodEmail) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('Validated Successfully')));
                            // Messages().animatedAlert(context, "Validated Successfully");
                            Future.delayed(const Duration(seconds: 2));
                            ChangeScreen();
                          }
                          if (goodPassword == false && goodEmail == false) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text(
                                        'Please Enter Valid Email and Password')));
                            EmailController.clear();
                            PasswordController.clear();
                          }
                          if (goodPassword == false && goodEmail == true) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text('Please Enter Valid Password')));
                            PasswordController.clear();
                          }
                          if (goodPassword == true && goodEmail == false) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text('Please Enter Valid Email')));
                            EmailController.clear();
                          }
                        },
                      ),
                      const Gap(20),
                      const Text(
                        'Or',
                        style: TextStyle(fontSize: 20, color: Colors.grey),
                      ),
                      const Gap(4),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Don\'t Have an account ?',
                            style: TextStyle(fontSize: 18, color: Colors.grey),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SignUp()));
                            },
                            child: Container(
                                margin: const EdgeInsets.only(left: 2),
                                child: const Text(
                                  'Register Now',
                                  style: TextStyle(
                                      color: Colors.lightBlue, fontSize: 18),
                                )),
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }
}
