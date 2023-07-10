// ignore_for_file: prefer_const_constructors, file_names

import 'package:fitness_support/Screens/ProfileScreen.dart';
import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';

import '../Screens/Home.dart';
import '../Screens/Schedules.dart';
import '../Screens/VedioScreen.dart';
import 'LikedSongs.dart';
import 'PlayList.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _selectedIndex = 0;
  static final List<Widget> _widgetOptions = <Widget>[
    const Home(),
    Schedules(),
    const VideoScreen(),
    const playListspage(),
    const ProfileScreen(),
    const LikedSongsComponent()
  ];

  void _onItemTapped(int index) {
    // ignore: avoid_print, unnecessary_brace_in_string_interps
    print("selected index is :${_selectedIndex}");
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: _widgetOptions[_selectedIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.indigo.shade400,
        unselectedItemColor: Color(0xFF526480),
        elevation: 10,
        items: const [
          BottomNavigationBarItem(
            label: "Home",
            icon: Icon(FluentSystemIcons.ic_fluent_home_regular),
            activeIcon: Icon(FluentSystemIcons.ic_fluent_home_filled),
          ),
          BottomNavigationBarItem(
              label: "Schedules",
              icon: Icon(Icons.today_outlined),
              activeIcon: Icon(Icons.today)),
          BottomNavigationBarItem(
              label: "VideoSelector",
              icon: Icon(FluentSystemIcons.ic_fluent_video_clip_regular),
              activeIcon: Icon(FluentSystemIcons.ic_fluent_video_clip_filled)),
          BottomNavigationBarItem(
            label: "PlayList",
            icon: Icon(FluentSystemIcons.ic_fluent_switch_video_regular),
            activeIcon: Icon(FluentSystemIcons.ic_fluent_switch_video_filled),
          ),
          BottomNavigationBarItem(
            label: "Profile",
            icon: Icon(FluentSystemIcons.ic_fluent_person_accounts_regular),
            activeIcon:
                Icon(FluentSystemIcons.ic_fluent_person_accounts_filled),
          ),
          BottomNavigationBarItem(
            label: "Liked Songs",
            icon: Icon(FluentSystemIcons.ic_fluent_favorites_regular),
            activeIcon:
                Icon(FluentSystemIcons.ic_fluent_favorites_filled),
          ),
        ],
      ),
    );
  }
}
