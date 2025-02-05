import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoApp extends StatefulWidget {
  final String source;
  final bool play;

  const VideoApp({super.key, required this.source, this.play = true});

  @override
  _VideoAppState createState() => _VideoAppState();
}

class _VideoAppState extends State<VideoApp> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();

    _controller = VideoPlayerController.asset(widget.source)
      ..initialize().then((_) {
        setState(() {
          // if (widget.play) {
          //   _controller.play();
          //   _controller.setLooping(true);
          // }
        });
      });

    // _controller = VideoPlayerController.networkUrl(
    // Uri.parse('https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4'))
    // Uri.parse('https://sample-videos.com/video321/mp4/720/big_buck_bunny_720p_20mb.mp4'))
    // ..initialize().then((_) {
    //   setState(() {});
    // _controller.play();
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _controller.value.isInitialized
          ? SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: FittedBox(
                fit: BoxFit.cover,
                child: SizedBox(
                  width: _controller.value.size.width,
                  height: _controller.value.size.height,
                  child: VideoPlayer(_controller),
                ),
              ),
            )
          : const SizedBox(),
    );

    return Scaffold(
      body: Center(
        child: _controller.value.isInitialized
            ? AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(_controller),
              )
            : Container(),
      ),

      ///////////////////
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     setState(() {
      //       _controller.value.isPlaying ? _controller.pause() : _controller.play();
      //     });
      //   },
      //   child: Icon(_controller.value.isPlaying ? Icons.pause : Icons.play_arrow),
      // ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
