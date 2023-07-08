// ignore_for_file: file_names, camel_case_types, sized_box_for_whitespace, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class videoPlayer extends StatelessWidget {
  final VideoPlayerController controller;

  const videoPlayer({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return controller.value.isInitialized
        ? buildVideo()
        : Container(
            height: 200,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
  }

  Widget buildVideo() {
    return Stack(
      children: [
        buildVideoPlayer(),
        BasicOverlayWidget(controller: controller),
      ],
    );
  }

  Widget buildVideoPlayer() {
    return AspectRatio(
      aspectRatio: controller.value.aspectRatio,
      child: VideoPlayer(controller),
    );
  }
}

class BasicOverlayWidget extends StatefulWidget {
  final VideoPlayerController controller;

  const BasicOverlayWidget({Key? key, required this.controller})
      : super(key: key);

  @override
  State<BasicOverlayWidget> createState() => _BasicOverlayWidgetState();
}

class _BasicOverlayWidgetState extends State<BasicOverlayWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => widget.controller.value.isPlaying
          ? setState(() {
              widget.controller.pause();
            })
          : setState(() {
              widget.controller.play();
            }),
      child: Stack(children: [
        buildPlay(),
              Positioned(bottom: 60, left: 0, child: buildIndicator(context)),
              Positioned(
                bottom: 50,
                right: 10,
                child: GestureDetector(
                  onTap: (){
                    if(widget.controller.value.volume==0){
                      setState(() {
                        widget.controller.setVolume(1);
                      });
                    }
                    else{
                      setState(() {
                        widget.controller.setVolume(0);
                      });
                    }
                  },
                  child: widget.controller.value.volume==0?Icon(Icons.volume_mute_outlined, color: Colors.indigo.shade200, size: 30,):Icon(Icons.volume_mute, color: Colors.indigo.shade200, size: 30,),
                ),
              )
      ]),
    );
  }

  Widget buildIndicator(BuildContext context) {
    return Container(
      height: 20,
      width: MediaQuery.of(context).size.width - 50,
      child: VideoProgressIndicator(
        widget.controller,
        allowScrubbing: true,
      ),
    );
  }

  Widget buildPlay() {
    return widget.controller.value.isPlaying
        ? Container()
        : Container(
            alignment: Alignment.center,
            color: Colors.transparent,
            child: Icon(
              Icons.play_arrow,
              color: Colors.white12,
              size: 80,
            ),
          );
  }
}
