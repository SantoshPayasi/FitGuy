// ignore_for_file: avoid_print, prefer_const_constructors, unnecessary_brace_in_string_interps, file_names, avoid_unnecessary_containers, body_might_complete_normally_nullable

import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../Components/Musicdata.dart';
import '../Components/PlayList.dart';
import '../Components/VedioPlayer.dart';

class VideoScreen extends StatefulWidget {
  const VideoScreen({Key? key}) : super(key: key);

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  late VideoPlayerController controller;
  int selectedSongs = 0;
  bool isListFound = false;
  bool isLiked = false;

  void changeselectedSongs() {
    setState(() {
      selectedSongs = 0;
      SelectedVideos.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: selectedSongs != 0
            ? Text(
                "Selected:  ${selectedSongs}",
                style: TextStyle(color: Colors.indigo.shade400),
              )
            : Text(""),
        actions: [
          TextButton.icon(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => playListspage(
                          Songs: SelectedVideos,
                          ChangeselectedSongs: changeselectedSongs)));
            },
            icon: Icon(Icons.add),
            label: Text("Add To playlist"),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          setState(() {
            isListFound = true;
          });
          pickVideoFile();
        },
      ),
      body: isListFound == false
          ? Center(
              child: Text("Please select videos to play"),
            )
          : Container(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onLongPress: () {
                      bool isPresent = false;
                      setState(() {
                        for (int i = 0; i < SelectedVideos.length; i++) {
                          if (SelectedVideos[i].Path == VideoList[index].Path) {
                            isPresent = true;
                            break;
                          }
                        }
                        if (!isPresent) {
                          SelectedVideos.add(VideoList[index]);
                          selectedSongs += 1;
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text("Video is already selected")));
                        }
                      });
                      print(SelectedVideos);
                    },
                    onDoubleTap: () {
                      bool isPresent = false;
                      MusicDetails? Element;

                      for(int i=0;i<SelectedVideos.length;i++) {
                        if (SelectedVideos[i].Path == VideoList[index].Path) {
                          Element = SelectedVideos[i];
                          isPresent = true;
                        }
                      }
                        if (isPresent) {
                          SelectedVideos.remove(Element!);
                          setState(() {
                            selectedSongs = selectedSongs - 1;
                          });
                        }
                        else{
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Video is not selected")));
                        }
                      },

                    child: Container(
                      margin: EdgeInsets.only(bottom: 10, left: 10, right: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width - 50,
                            child: ListTile(
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              tileColor: Colors.indigo.shade100,
                              leading: const Icon(Icons.video_call_sharp),
                              title: Text(VideoList[index].Name),
                              trailing: GestureDetector(
                                  onTap: () {
                                    controller = VideoPlayerController.file(
                                        File(VideoList[index].Path as String))
                                      ..addListener(() => setState(() {}))
                                      ..setLooping(true)
                                      ..initialize().then((_) {
                                        controller.play();
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    videoPlayer(
                                                      controller: controller,
                                                    )));
                                      });
                                    // Navigator.push(context, MaterialPageRoute(builder: (context)=>))
                                  },
                                  child: Icon(Icons.play_circle,
                                      color: Colors.indigo.shade400)),
                            ),
                          ),
                          GestureDetector(
                              onTap: () {
                                changeFevriotStatus(index);
                                print(LikedVideos);
                                setState(() {});
                              },
                              child: Icon(
                                VideoList[index].isLiked == false
                                    ? FluentSystemIcons.ic_fluent_heart_regular
                                    : FluentSystemIcons.ic_fluent_heart_filled,
                                color: VideoList[index].isLiked == true
                                    ? Colors.red
                                    : Colors.grey,
                              ))
                        ],
                      ),
                    ),
                  );
                },
                itemCount: VideoList.length,
              ),
            ),
    );
  }

  Future<File?> pickVideoFile() async {
    final result = await FilePicker.platform
        .pickFiles(type: FileType.video, allowMultiple: true);
    print("These are total files ${result?.files.length}");
    for (int i = 0; i < result!.files.length; i++) {
      MusicDetails newVideo =
          MusicDetails(Name: result.files[i].name, Path: result.files[i].path);
      VideoList.add(newVideo);
    }
    setState(() {});
  }
}
