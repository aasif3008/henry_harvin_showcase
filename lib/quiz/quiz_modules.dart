import 'package:flutter/material.dart';

import '../video_quiz/quiz.dart';
import '../video_quiz/video_quiz.dart';

class QuizModules extends StatefulWidget {
  final String language;

  const QuizModules({super.key, required this.language});

  @override
  State<QuizModules> createState() => _QuizModulesState();
}

class _QuizModulesState extends State<QuizModules> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
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
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Quiz(
                      language: widget.language,
                      module: text,
                      quiz: true,
                    )));
      },
      child: Container(
        // width: 250,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(color: Colors.black38, borderRadius: BorderRadius.circular(30)),
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Quiz Set', style: TextStyle(color: Colors.white, fontSize: 34)),
            Text(text,
                style: const TextStyle(color: Colors.white, fontSize: 80, fontWeight: FontWeight.bold)),
            Text('${widget.language} Speaking',
                style: const TextStyle(color: Colors.white, fontSize: 30)),
          ],
        ),
      ),
    );
  }
}
