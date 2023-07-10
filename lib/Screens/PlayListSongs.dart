import 'dart:io';

import 'package:fitness_support/Components/Musicdata.dart';
import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

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
    // print(PlayListsArray[0]);
    if (PlayListsArray.length > 0) {
      for (int i = 0; i < PlayListsArray.length; i++) {
        if (PlayListsArray[i]["name"] == widget.UserName) {
          MusicData.add(PlayListsArray[i]["Songs"]);
          // print(MusicData[0][1].Name);
          setState(() {
            isLoaded = true;
          });
        }
        else{
          setState(() {
            isLoaded = true;
          });
        }
      }
    } else {
      setState(() {
        isLoaded = true;
      });
    }
  }

  late VideoPlayerController controller;
  bool isLoaded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Playlist Songs'),
        backgroundColor: Colors.indigo.shade300,
      ),
      body: isLoaded == false
          ? Center(child: Text("Loding songs"))
          // :Center(child: Text("This is the Data ${MusicData[0][1].Name} and ${MusicData[0].length}"),)
          : Container(
              child: MusicData.length > 0
                  ? ListView.builder(
                      itemBuilder: (context, index) => Container(
                        margin: EdgeInsets.all(10),
                        child: GestureDetector(
                          onTap: () {
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
                            tileColor: Colors.indigo.shade100,
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            leading: const Icon(
                                FluentSystemIcons.ic_fluent_video_clip_regular),
                            title: Text(MusicData[0][index].Name),
                            trailing: const Icon(
                              Icons.play_circle,
                              color: Colors.indigo,
                            ),
                          ),
                        ),
                      ),
                      itemCount: MusicData[0].length,
                    )
                  : const Center(child: Text("Songs not found"))),
    );
  }
}
