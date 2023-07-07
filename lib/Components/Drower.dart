import 'package:fitness_support/Screens/Home.dart';
import 'package:fitness_support/Screens/ProfileScreen.dart';
import 'package:fitness_support/Screens/Schedules.dart';
import 'package:fitness_support/Screens/Subscriptions.dart';
import 'package:fitness_support/commonStyles.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class Drower extends StatelessWidget {
  final String? Name;

  const Drower({Key? key, required this.Name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 250,
          width: MediaQuery.of(context).size.width,
          color: Styles.backgroundColor.withOpacity(0.4),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
             Icon(Icons.account_circle, size:100, color:Colors.white ,),
              Text((Name!=null)?Name!:"Hello User", style: GoogleFonts.dancingScript(
                fontSize: 26,
                fontWeight: FontWeight.bold
              ),)
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
          child: Column(
            children: [
              RowList(icon: Icons.home, Label: 'Home', name: Name,),
              Gap(20),
              RowList(icon: Icons.schedule, Label: 'Schedule'),
              Gap(20),
              RowList(icon: Icons.account_circle, Label: 'Profile'),
              Gap(20),
              RowList(icon: Icons.subscriptions_outlined, Label: 'Subscriptions')
            ],
          ),
        )
      ],
    );
  }
}

class RowList extends StatelessWidget {
  final String Label;
  final IconData icon;
  final name;
  const RowList({
    super.key,
    required this.icon,
    required this.Label,
    this.name
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        NavigateScreen(Label, name, context);
      },
      child: Row(
        children: [
          Icon(icon, color: Colors.indigo.shade200,),
          const Gap(20),
          Text(Label, style: TextStyle(
            fontSize: 20,
            color: Colors.black45
          ),)
        ],
      ),
    );
  }
}


void NavigateScreen(String Lable, String?name, context ){
  if(Lable=='Home'){
    Navigator.push(context, MaterialPageRoute(builder: (context)=>Home(name: name,)));
  }
  if(Lable=='Schedule'){
    Navigator.push(context, MaterialPageRoute(builder: (context)=>const Schedules()));
  }
  if(Lable=='Profile'){
    Navigator.push(context, MaterialPageRoute(builder: (context)=>const ProfileScreen()));
  }
  if(Lable=='Subscriptions'){
    Navigator.push(context, MaterialPageRoute(builder: (context)=>const Subscriptions()));
  }
}