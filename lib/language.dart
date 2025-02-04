import 'package:flutter/material.dart';
import 'package:henry_harvin_showcase/video_player.dart';

import 'flipping_cards.dart';

class Language extends StatefulWidget {
  const Language({super.key});

  @override
  State<Language> createState() => _LanguageState();
}

class _LanguageState extends State<Language> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(children: [
        const VideoApp(source: 'assets/big_buck_bunny.mp4'),
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              button("flag_japanese.jpg", "Japanese"),
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
        Navigator.push(context, MaterialPageRoute(builder: (context) => FlippingCards(language: text)));
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
