// ignore_for_file: prefer_const_constructors, prefer_is_empty

import 'dart:io';

import 'package:fitness_support/Components/Musicdata.dart';
import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../Components/VedioPlayer.dart';

class LikedSongsComponent extends StatefulWidget {
  const LikedSongsComponent({Key? key}) : super(key: key);

  @override
  State<LikedSongsComponent> createState() => _playListSongsState();
}

// ignore: camel_case_types
class _playListSongsState extends State<LikedSongsComponent> {
  late VideoPlayerController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: LikedVideos.length > 0
              ? ListView.builder(
                  itemBuilder: (context, index) => Container(
                    margin: EdgeInsets.all(10),
                    child: GestureDetector(
                      onTap: () {
                        controller = VideoPlayerController.file(
                            File(LikedVideos[index].Path as String))
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
                        title: Text(LikedVideos[index].Name),
                        trailing: const Icon(
                          Icons.play_circle,
                          color: Colors.indigo,
                        ),
                      ),
                    ),
                  ),
                  itemCount: LikedVideos.length,
                )
              : const Center(child: Text("No Liked songs found"))),
    );
  }
}
