import 'package:flutter/material.dart';
import 'package:henry_harvin_showcase/language.dart';
import 'package:henry_harvin_showcase/video_player.dart';

class Activities extends StatefulWidget {
  const Activities({super.key});

  @override
  State<Activities> createState() => _ActivitiesState();
}

class _ActivitiesState extends State<Activities> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Stack(children: [
        const VideoApp(source: 'assets/big_buck_bunny.mp4',),
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              button("Flipping Cards", (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => const Language()));
              }),
              button("Coming Soon !", (){}),
              button("Coming Soon !", (){}),
            ],
          ),
        )
        ///////////
      ]),
    );
  }

  Widget button(text, onTap) {
    return InkWell(
      borderRadius: BorderRadius.circular(30),
      onTap: onTap,
      child: Container(
        width: 260,
        decoration: BoxDecoration(
          color: Colors.black26,
          borderRadius: BorderRadius.circular(30),
        ),
        padding: const EdgeInsets.only(bottom: 12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.play_arrow_rounded, size: 200, color: Colors.white),
            Text(
              text,
              style: const TextStyle(color: Colors.white, fontSize: 34),
            ),
          ],
        ),
      ),
    );
  }
}
