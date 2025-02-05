import 'package:flutter/material.dart';
import 'package:henry_harvin_showcase/flipping/cards_slider.dart';
import 'package:henry_harvin_showcase/quiz/quiz_modules.dart';
import 'package:henry_harvin_showcase/video_player.dart';

import 'flipping_cards.dart';
import 'video_quiz/modules.dart';

class Language extends StatefulWidget {
  final String activity;

  const Language({super.key, required this.activity});

  @override
  State<Language> createState() => _LanguageState();
}

class _LanguageState extends State<Language> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(children: [
        // const VideoApp(source: 'assets/big_buck_bunny.mp4'),
        Image.asset(
          "assets/hhBackground.png",
          fit: BoxFit.cover,
          height: double.maxFinite,
          width: double.maxFinite,
        ),
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              if (widget.activity != "B") button("flag_japanese.jpg", "Japanese"),
              button("flag_germany.png", "German"),
              button("flag_english.jpg", "English"),
            ],
          ),
        )
        ///////////
      ]),
    );
  }

  Widget button(image, text) {
    return InkWell(
      borderRadius: BorderRadius.circular(30),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => widget.activity == "A"
                  ? CardsSlider(language: text)
                  : widget.activity == "B"
                      ? ChooseModules(language: text)
                      : QuizModules(language: text),
            ));
      },
      child: Container(
        width: 260,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(color: Colors.black26, borderRadius: BorderRadius.circular(30)),
        padding: const EdgeInsets.only(bottom: 12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AspectRatio(aspectRatio: 16 / 9, child: Image.asset('assets/$image', fit: BoxFit.cover)),
            const SizedBox(height: 8),
            Text(text, style: const TextStyle(color: Colors.white, fontSize: 34)),
          ],
        ),
      ),
    );
  }
}
