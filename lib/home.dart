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
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () =>
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const Activities())),
                icon: const Icon(Icons.play_arrow_rounded, size: 200, color: Colors.white),
                style: IconButton.styleFrom(backgroundColor: Colors.black38),
              ),
              const SizedBox(height: 20),
              const Text('Click on the icon above...',
                  style: TextStyle(fontSize: 30, color: Colors.white))
            ],
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
