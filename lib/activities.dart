import 'package:flutter/material.dart';
import 'package:henry_harvin_showcase/language.dart';

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
        // const VideoApp(source: 'assets/big_buck_bunny.mp4',),
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
              button(Icons.flip_rounded, "Flipping Cards", () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => const Language(activity: "A")));
              }),
              button(Icons.video_collection_outlined, "Interactive Quiz", () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => const Language(activity: "B")));
              }),
              button(Icons.quiz_outlined, "MCQ Quiz", () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => const Language(activity: "C")));
              }),
            ],
          ),
        )
        ///////////
      ]),
    );
  }

  Widget button(icon, text, onTap) {
    return InkWell(
      borderRadius: BorderRadius.circular(30),
      onTap: onTap,
      child: Container(
        width: 280,
        decoration: BoxDecoration(
          color: Colors.black26,
          borderRadius: BorderRadius.circular(30),
        ),
        padding: const EdgeInsets.only(bottom: 12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 20),
            Icon(icon, size: 160, color: Colors.white),
            const SizedBox(height: 20),
            Text(
              text,
              style: const TextStyle(color: Colors.white, fontSize: 34),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
