import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:henry_harvin_showcase/video_player.dart';
import 'activities.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const VideoApp(source: 'assets/big_buck_bunny.mp4'),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(10),
        child: IconButton(
          onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const Activities())),
          icon: const Icon(Icons.play_arrow_rounded, size: 200, color: Colors.white),
          style: IconButton.styleFrom(backgroundColor: Colors.black26),
        ),
      ),
    );
  }
}
