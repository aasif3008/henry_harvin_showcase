import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class FlipWidget extends StatefulWidget {
  final int index;
  final String language;
  final List<dynamic> row;

  const FlipWidget({super.key, required this.index, required this.row, required this.language});

  @override
  _FlipWidgetState createState() => _FlipWidgetState();
}

class _FlipWidgetState extends State<FlipWidget> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  bool _isFront = true;

  final FlutterTts _flutterTts = FlutterTts();

  Future<void> _speak(text) async {
    if (text.isNotEmpty) {
      await _flutterTts.speak(text);
    }
  }

  @override
  void initState() {
    super.initState();

    _flutterTts.setLanguage("en-US");
    _flutterTts.setPitch(1.0);
    //////////

    _controller = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _flipCard() {
    if (_isFront) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
    _isFront = !_isFront;
  }

  @override
  Widget build(BuildContext context) {
    _controller.reverse();

    return GestureDetector(
      onTap: _flipCard,
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          final angle = _animation.value * 3.14159; // PI radians
          final isUnder = _animation.value > 0.5;

          return Transform(
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.002) // Perspective
              ..rotateY(angle),
            alignment: Alignment.center,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.black26,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
              child: isUnder ? back() : front(),
            ),

            // isUnder? backCard(widget.card, screenWidth): frontCard(widget.card, screenWidth),
          );
        },
      ),
    );
  }

  Widget front() {
    // _speak(widget.row.length != widget.index
    //     ? widget.row[widget.index][0]
    //     : "Thank you");

    return Column(
      children: [
        if (widget.row.length != widget.index)
          Expanded(
            child: Align(
              alignment: Alignment.topRight,
              child: IconButton(
                onPressed: () {
                  _speak(widget.row[widget.index][0]);
                },
                icon: const Icon(Icons.volume_up_rounded, color: Colors.white, size: 40),
              ),
            ),
          ),
        Expanded(
          child: Center(
            child: Text(
              widget.row.length == widget.index ? "Thank You!" : widget.row[widget.index][0].toString(),
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.white, fontSize: 60, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        const Expanded(
          child: Align(
            alignment: Alignment.bottomRight,
            child: Text(
              'Click to Flip',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
        )
      ],
    );
  }

  Widget back() {
    _speak(widget.row.length != widget.index ? widget.row[widget.index][1] : 'Arigatou');
    return Transform(
      alignment: Alignment.center,
      transform: Matrix4.rotationY(3.14159),
      child: Column(
        children: [
          if (widget.row.length != widget.index)
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                onPressed: () {
                  _speak(widget.row[widget.index][1]);
                },
                icon: const Icon(Icons.volume_up_rounded, color: Colors.white, size: 40),
              ),
            ),
          Expanded(
            child: Text(
              widget.row.length == widget.index ? "Arigatou" : widget.row[widget.index][1].toString(),
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.white, fontSize: 60, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: Text(
              widget.row.length == widget.index ? "ありがとう" : widget.row[widget.index][2].toString(),
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.white, fontSize: 50, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 30, width: double.maxFinite)
        ],
      ),
    );
  }
}
