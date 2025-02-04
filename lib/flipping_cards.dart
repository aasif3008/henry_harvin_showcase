import 'package:flutter/material.dart';
import 'package:henry_harvin_showcase/video_player.dart';

import 'flipping_card_data.dart';
import 'flipping_widget.dart';

class FlippingCards extends StatefulWidget {
  final String language;

  const FlippingCards({super.key, required this.language});

  @override
  State<FlippingCards> createState() => _FlippingCardsState();
}

class _FlippingCardsState extends State<FlippingCards> {
  final japaneseWords = getJapaneseWords();

  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          const VideoApp(source: 'assets/big_buck_bunny.mp4'),
          Align(
            alignment: Alignment.topCenter,
            child: Text("\n${widget.language} Learning",
                textAlign: TextAlign.center,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 46,
                    fontWeight: FontWeight.bold,
                    shadows: [Shadow(color: Colors.black, offset: Offset(2, 2))])),
          ),
          Container(
            width: 650,
            decoration: BoxDecoration(color: Colors.black38, borderRadius: BorderRadius.circular(30)),
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                FlipWidget(
                    playing: japaneseWords.length != index,
                    row: japaneseWords[index],
                    language: widget.language),
                if (japaneseWords.length == index)
                  OutlinedButton(
                      onPressed: () => Navigator.pop(context),
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Colors.white),
                        padding: const EdgeInsets.only(left: 40, right: 40),
                      ),
                      child: const Text('Close', style: TextStyle(color: Colors.white, fontSize: 30))),
                if (japaneseWords.length != index)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      OutlinedButton(
                          onPressed: () {
                            if (index > 0) setState(() => index--);
                          },
                          style: OutlinedButton.styleFrom(
                            side: BorderSide(color: index == 0 ? Colors.grey : Colors.white),
                            padding: const EdgeInsets.only(left: 20, right: 30),
                          ),
                          child: Row(
                            children: [
                              Icon(Icons.arrow_back_ios_rounded,
                                  color: index == 0 ? Colors.grey : Colors.white, size: 28),
                              const SizedBox(width: 12),
                              Text(
                                'Previous',
                                style: TextStyle(
                                    color: index == 0 ? Colors.grey : Colors.white, fontSize: 30),
                              ),
                            ],
                          )),
                      Text(
                        "${index + 1}/${japaneseWords.length}",
                        style: const TextStyle(
                            color: Colors.white, fontSize: 34, fontWeight: FontWeight.bold),
                      ),
                      OutlinedButton(
                          onPressed: () {
                            setState(() {
                              index++;
                            });
                          },
                          style: OutlinedButton.styleFrom(
                            side: const BorderSide(color: Colors.white),
                            padding: const EdgeInsets.only(left: 30, right: 20),
                          ),
                          child: Row(
                            children: [
                              Text(japaneseWords.length == index + 1 ? "Done    " : 'Next     ',
                                  style: const TextStyle(color: Colors.white, fontSize: 30)),
                              const SizedBox(width: 12),
                              const Icon(Icons.arrow_forward_ios_rounded, color: Colors.white, size: 28),
                            ],
                          ))
                    ],
                  )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
