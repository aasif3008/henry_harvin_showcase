import 'dart:async';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../video_player.dart';
import 'quiz.dart';

class VideoQuiz extends StatefulWidget {
  final String language, module;

  const VideoQuiz({super.key, required this.language, required this.module});

  @override
  State<VideoQuiz> createState() => _VideoQuizState();
}

class _VideoQuizState extends State<VideoQuiz> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();

    _controller = VideoPlayerController.asset('assets/${widget.language}${widget.module}.mp4')
      ..initialize().then((_) {
        setState(() {
          _controller.play();
        });
      });

    _controller.addListener(() {
      if (_controller.value.position == _controller.value.duration) {
        startHighlighting();
      }
    });
  }

  Color buttonColor = Colors.black26;
  Timer? timer;

  void startHighlighting() {
    timer = Timer.periodic(const Duration(milliseconds: 300), (Timer t) {
      setState(() {
        // Toggle between two colors
        buttonColor =
            buttonColor == Colors.deepPurple[400] ? Colors.deepPurple[200]! : Colors.deepPurple[400]!;
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Image.asset(
          //   "assets/hhBackground.png",
          //   fit: BoxFit.cover,
          //   height: double.maxFinite,
          //   width: double.maxFinite,
          // ),

          _controller.value.isInitialized
              ? SizedBox(
                  width: double.infinity,
                  height: double.infinity,
                  child: FittedBox(
                    fit: BoxFit.contain,
                    child: SizedBox(
                      width: _controller.value.size.width,
                      height: _controller.value.size.height,
                      child: VideoPlayer(_controller),
                    ),
                  ),
                )
              : const SizedBox(),
        ],
      ),
      //////
      floatingActionButton: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const SizedBox(width: 36),
          TextButton(
            onPressed: () {
              if (_controller.value.isPlaying) _controller.pause();
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Quiz(language: widget.language, module: widget.module)));
            },
            style: IconButton.styleFrom(
              // backgroundColor: Colors.black26,
              backgroundColor: buttonColor,
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            ),
            child: const Row(
              children: [
                Icon(Icons.quiz_rounded, size: 50, color: Colors.white),
                Text('  Start Quiz', style: TextStyle(fontSize: 30, color: Colors.white))
              ],
            ),
          ),
          const Expanded(child: SizedBox()),
          TextButton(
            onPressed: () {
              setState(() {
                _controller.seekTo(Duration.zero);
                _controller.play();
              });
            },
            style: IconButton.styleFrom(
              backgroundColor: Colors.black26,
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            ),
            child: const Row(
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Icon(Icons.play_arrow_rounded, color: Colors.white),
                    Icon(Icons.sync_rounded, size: 50, color: Colors.white),
                  ],
                ),
                Text('  Restart Video', style: TextStyle(fontSize: 30, color: Colors.white))
              ],
            ),
          ),
          ////////
        ],
      ),
    );
  }
}
