import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';
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
      body: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            "assets/hhBackground.png",
            fit: BoxFit.cover,
            height: double.maxFinite,
            width: double.maxFinite,
          ),
          IconButton(
            onPressed: () =>
                Navigator.push(context, MaterialPageRoute(builder: (context) => const Activities())),
            icon: const Icon(Icons.play_arrow_rounded, size: 200, color: Colors.white),
            style: IconButton.styleFrom(backgroundColor: Colors.black38),
          ),
        ],
      ),
      // floatingActionButton: Padding(
      //   padding: const EdgeInsets.all(10),
      //   child: IconButton(
      //     onPressed: () =>
      //         Navigator.push(context, MaterialPageRoute(builder: (context) => const Activities())),
      //     icon: const Icon(Icons.play_arrow_rounded, size: 200, color: Colors.white),
      //     style: IconButton.styleFrom(backgroundColor: Colors.black38),
      //   ),
      // ),
    );
  }
}
