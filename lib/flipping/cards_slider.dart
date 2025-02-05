import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../quiz_data.dart';
import '../video_player.dart';
import 'flipping_card.dart';

class CardsSlider extends StatefulWidget {
  final String language;

  const CardsSlider({super.key, required this.language});

  @override
  State<CardsSlider> createState() => _CardsSliderState();
}

class _CardsSliderState extends State<CardsSlider> {
  List<dynamic> list = [];

  @override
  void initState() {
    super.initState();
    list = widget.language == "Japanese"
        ? getJapaneseWords()
        : widget.language == "German"
            ? getGermanWords()
            : getEnglishWords();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: AlignmentDirectional.center,
        children: [

          // const VideoApp(source: 'assets/big_buck_bunny.mp4', play: false),

          Image.asset(
            "assets/hhBackground.png",
            fit: BoxFit.cover,
            height: double.maxFinite,
            width: double.maxFinite,
          ),
          ////////////
          CarouselSlider(
            options: CarouselOptions(
              height: 700.0,
              enlargeCenterPage: true,
              viewportFraction: 0.6,
            ),
            items: list.map((row) {
              return Builder(
                builder: (BuildContext context) => FlippingCard(row: row, language: widget.language),
              );
            }).toList(),
          )

          ///////////
        ],
      ),
    );
  }
}
