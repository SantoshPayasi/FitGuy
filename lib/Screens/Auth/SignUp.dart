import 'package:email_validator/email_validator.dart';
import 'package:fitness_support/FlutterMessages.dart';
import 'package:fitness_support/commonStyles.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Components/InputElement.dart';
import '../../Components/ReusableButton.dart';
import '../Home.dart';
import 'Signin.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController EmailController = TextEditingController();
  final TextEditingController Name = TextEditingController();
  final TextEditingController PasswordController = TextEditingController();
  final TextEditingController ConfirmPassword = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  bool isLoading = false;
  AuthenticateUser(String Name, String Email, String Password ){
   setState(() {
     isLoading = true;
     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Home(name: Name)));
   });
   // Future.delayed(Duration(seconds: 2));


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          margin: EdgeInsets.only(top: 20),
          padding: EdgeInsets.all(10),
          color: Styles.backgroundColor.withOpacity(0.1),
          child: Column(
            children: [
              Text(
                'FitGuy',
                style: GoogleFonts.dancingScript(
                    fontSize: 50,
                    fontWeight: FontWeight.w600,
                    color: Styles.backgroundColor),
              ),
              Container(
                  margin: EdgeInsets.only(top: 70),
                  alignment: Alignment.topCenter,
                  child: Text(
                    "Register Now",
                    style: GoogleFonts.albertSans(fontSize: 30),
                  )),
              Gap(60),
              Form(
                key: _key,
                child: Column(
                  children: [
                    FormTextField(
                      obscureText: false,
                      Label: 'Name',
                      Text: 'Enter Your Name',
                      controller: Name,
                      icon: Icons.abc,
                    ),
                    Gap(5),
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
                    const Gap(5),
                    FormTextField(
                      obscureText: true,
                      Label: 'Confirm Password',
                      Text: 'Enter Your Password',
                      controller: ConfirmPassword,
                      icon: Icons.lock,
                    ),
                    const Gap(3),
                    SubmitButton(
                      Lable: 'Sign Up',
                      isLoading: isLoading,
                      SubmitNow: () {
                        bool goodEmail = false;
                        bool goodPassword = false;
                        bool goodName = false;
                        print('Key is presses');
                        if (Name.text.isNotEmpty) {
                          if (kDebugMode) {
                            print(Name.text);
                          }

                          if (Name.text.length < 15 && Name.text.length > 0) {
                            goodName = true;
                          }
                        }
                        if (EmailController.text.isNotEmpty) {
                          final isValidEmail =
                              EmailValidator.validate(EmailController.text);
                          if (isValidEmail) {
                            goodEmail = true;
                          }
                        }
                        if (PasswordController.text.isNotEmpty &&
                            ConfirmPassword.text.isNotEmpty) {
                          if ((PasswordController.text.length >= 6) &&
                              (ConfirmPassword.text ==
                                  PasswordController.text)) {
                            print(
                                "Password is also Validated ${PasswordController.text}");
                            goodPassword = true;
                          }
                        }

                        if (goodPassword && goodEmail && goodName) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Validated Successfully')));
                              AuthenticateUser(Name.text, EmailController.text, PasswordController.text);
                          if (kDebugMode) {
                            print("All of then are Validated");
                            print(EmailController.text);
                            print(PasswordController.text);
                          }
                        } else if (!goodName && !goodEmail && !goodPassword) {
                          Messages().FlutterSnakBar(context,
                              'Please Enter Valid Email and Password(Atleast 6 Characters) and Name(Make Sure that Name must be less then 15 charactes)');
                          EmailController.clear();
                          PasswordController.clear();
                          ConfirmPassword.clear();
                          Name.clear();
                        } else if (goodPassword == false &&
                            goodEmail == true &&
                            goodName == true) {
                          Messages().FlutterSnakBar(context,
                              "Please Enter Valid Password(Atleast 6 Characters)");
                          PasswordController.clear();
                          ConfirmPassword.clear();
                        } else if (goodPassword == true &&
                            goodEmail == false &&
                            goodName == true) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Please Enter Valid Email')));
                          EmailController.clear();
                        } else if (goodPassword == true &&
                            goodEmail == true &&
                            goodName == false) {
                          Messages().FlutterSnakBar(
                              context, "Please Enter Valid name");
                          Name.clear();
                        } else {
                          Messages().FlutterSnakBar(context,
                              "Something Went Please check credentials");
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
                          'Already Have an account ?',
                          style: TextStyle(fontSize: 18, color: Colors.grey),
                        ),
                        GestureDetector(
                          onTap: () {
                            EmailController.clear();
                            PasswordController.clear();
                            ConfirmPassword.clear();
                            Name.clear();
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignIn()));
                          },
                          child: Container(
                              margin: const EdgeInsets.only(left: 2),
                              child: const Text(
                                'Login Now',
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
        ));
  }
}
