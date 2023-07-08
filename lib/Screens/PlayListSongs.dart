import 'package:fitness_support/Components/Musicdata.dart';
import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'dart:io';
import '../Components/VedioPlayer.dart';

class playListSongs extends StatefulWidget {
  final String UserName;

  const playListSongs({Key? key, required this.UserName}) : super(key: key);

  @override
  State<playListSongs> createState() => _playListSongsState();
}

class _playListSongsState extends State<playListSongs> {
  List MusicData = [];

  @override
  void initState() {
    super.initState();
    print(PlayListsArray[0]);
    for (int i = 0; i < PlayListsArray.length; i++) {
      if (PlayListsArray[i]["name"] == widget.UserName) {
        MusicData.add(PlayListsArray[i]["Songs"]);
        print(MusicData[0][1].Name);
        setState(() {
          isLoaded = true;
        });
      }
    }
  }
late VideoPlayerController controller;
  bool isLoaded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoaded == false
          ? Center(
              child: Text('Plase Wait ${PlayListsArray[0]["Songs"][0].Path}'))
          // :Center(child: Text("This is the Data ${MusicData[0][1].Name} and ${MusicData[0].length}"),)
          : Container(
              child: ListView.builder(
                itemBuilder: (context, index) => GestureDetector(
                  onTap: (){
                    controller = VideoPlayerController.file(
                        File(MusicData[0][index].Path as String))
                      ..addListener(() => setState(() {}))
                      ..setLooping(true)
                      ..initialize().then((_) {
                        controller.play();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => videoPlayer(
                                  controller: controller,
                                )));
                      });
                  },
                  child: ListTile(
                    leading: Icon(FluentSystemIcons.ic_fluent_video_clip_regular),
                    title: Text(MusicData[0][index].Name),
                    trailing: Icon(
                      Icons.play_circle,
                      color: Colors.indigo,
                    ),
                  ),
                ),
                itemCount: MusicData[0].length,
              ),
            ),
    );
  }
}
