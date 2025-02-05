import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class FlippingCard extends StatefulWidget {
  final List<dynamic> row;
  final String language;

  const FlippingCard({super.key, required this.row, required this.language});

  @override
  _FlippingCardState createState() => _FlippingCardState();
}

class _FlippingCardState extends State<FlippingCard> with SingleTickerProviderStateMixin {
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
              margin: const EdgeInsets.symmetric(vertical: 150),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.black38,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
              child: isUnder ? back() : front(),
            ),
          );
        },
      ),
    );
  }

  Widget front() {
    return Column(
      children: [
        Expanded(
          child: Align(
            alignment: Alignment.topRight,
            child: IconButton(
              onPressed: () {
                _speak(widget.row[0]);
              },
              icon: const Icon(Icons.volume_up_rounded, color: Colors.white, size: 40),
            ),
          ),
        ),
        Expanded(
          child: Center(
            child: Text(
              widget.row[0].toString(),
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.white, fontSize: 70, fontWeight: FontWeight.bold),
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
    _speak(widget.language == "German" ? widget.row[1] : widget.row[2]);

    return Transform(
      alignment: Alignment.center,
      transform: Matrix4.rotationY(3.14159),
      child: Column(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: IconButton(
              onPressed: () {
                _speak(widget.row[1]);
              },
              icon: const Icon(Icons.volume_up_rounded, color: Colors.white, size: 40),
            ),
          ),
          if (widget.language == "German") const SizedBox(height: 60),
          Expanded(
            child: Center(
              child: Text(
                widget.row[1],
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 60,
                  fontWeight: FontWeight.bold,
                  decoration:
                      widget.language == "English" ? TextDecoration.lineThrough : TextDecoration.none,
                  decorationColor: Colors.red,
                ),
              ),
            ),
          ),
          Expanded(
            child: widget.language == "German"
                ? const SizedBox()
                : Text(
                    widget.row[2].toString(),
                    textAlign: TextAlign.center,
                    style:
                        const TextStyle(color: Colors.white, fontSize: 50, fontWeight: FontWeight.bold),
                  ),
          ),
        ],
      ),
    );
  }
}
