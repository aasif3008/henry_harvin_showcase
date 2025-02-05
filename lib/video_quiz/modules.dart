import 'package:flutter/material.dart';
import '../video_player.dart';
import 'video_quiz.dart';

class ChooseModules extends StatefulWidget {
  final String language;

  const ChooseModules({super.key, required this.language});

  @override
  State<ChooseModules> createState() => _ChooseModulesState();
}

class _ChooseModulesState extends State<ChooseModules> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // const VideoApp(source: 'assets/big_buck_bunny.mp4'),
          Image.asset(
            "assets/hhBackground.png",
            fit: BoxFit.cover,
            height: double.maxFinite,
            width: double.maxFinite,
          ),
          /////////////////
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    module("A"),
                    const SizedBox(width: 40),
                    module("B"),
                  ],
                ),
                const SizedBox(height: 40),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    module("C"),
                    const SizedBox(width: 40),
                    module("D"),
                  ],
                ),
              ],
            ),
          ),
          /////////////////
        ],
      ),
    );
  }

  Widget module(text) {
    return InkWell(
      borderRadius: BorderRadius.circular(30),
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => VideoQuiz(language: widget.language, module: text)));
      },
      child: Container(
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(color: Colors.black38, borderRadius: BorderRadius.circular(30)),
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Module', style: TextStyle(color: Colors.white, fontSize: 30)),
            Text(text,
                style: const TextStyle(color: Colors.white, fontSize: 80, fontWeight: FontWeight.bold)),
            const Text('Video & Quiz', style: TextStyle(color: Colors.white, fontSize: 34)),
          ],
        ),
      ),
    );
  }
}
