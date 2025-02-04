import 'package:flutter/material.dart';

class FlipWidget extends StatefulWidget {
  final bool playing;
  final String language;
  final List<String> row;

  const FlipWidget({super.key, required this.playing, required this.row, required this.language});

  @override
  _FlipWidgetState createState() => _FlipWidgetState();
}

class _FlipWidgetState extends State<FlipWidget> with SingleTickerProviderStateMixin {
  bool _isFront = true;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _flip() {
    if (_isFront) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
    setState(() {
      _isFront = !_isFront;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _flip,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          final angle = _controller.value * 3.14;
          return Transform(
            transform: Matrix4.rotationY(angle),
            alignment: Alignment.center,
            child: Container(color: Colors.transparent, child: _isFront ? front() : back()),
          );
        },
      ),
    );
  }

  Widget front() {
    return Column(
      children: [
        if (widget.playing)
          Align(
            alignment: Alignment.topRight,
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.volume_up_rounded, color: Colors.white, size: 40),
            ),
          ),
        const SizedBox(height: 50),
        Text(
          !widget.playing ? "Thanks You!" : widget.row[0].toString(),
          textAlign: TextAlign.center,
          style: const TextStyle(color: Colors.white, fontSize: 60, fontWeight: FontWeight.bold),
        ),
        if (!widget.playing)
          Text(
            "for learning ${widget.language}",
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
          ),
        const SizedBox(height: 100),
      ],
    );
  }

  Widget back() {
    return Column(
      children: [
        if (widget.playing)
          Align(
            alignment: Alignment.topRight,
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.volume_up_rounded, color: Colors.white, size: 40),
            ),
          ),
        const SizedBox(height: 50),
        Text(
          !widget.playing ? "Thanks You!" : widget.row[0].toString(),
          textAlign: TextAlign.center,
          style: const TextStyle(color: Colors.white, fontSize: 60, fontWeight: FontWeight.bold),
        ),
        if (!widget.playing)
          Text(
            "for learning ${widget.language}",
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
          ),
        const SizedBox(height: 100),
      ],
    );
  }
}
