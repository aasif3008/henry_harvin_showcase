import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Realistic Flip Card Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FlipCard(),
    );
  }
}

class FlipCard extends StatefulWidget {
  @override
  _FlipCardState createState() => _FlipCardState();
}

class _FlipCardState extends State<FlipCard> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool _isFront = true;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );
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
    setState(() {
      _isFront = !_isFront;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Realistic Flip Card Example'),
      ),
      body: Center(
        child: GestureDetector(
          onTap: _flipCard,
          child: Stack(
            children: [
              _buildCard('Back', Colors.red, _controller.value),
              _buildCard('Front', Colors.blue, 1 - _controller.value),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCard(String text, Color color, double animationValue) {
    return Transform(
      transform: Matrix4.identity()
        ..setEntry(3, 2, 0.001) // Perspective
        ..rotateY(animationValue * 3.14), // Rotate around Y-axis
      alignment: Alignment.center,
      child: Opacity(
        opacity: animationValue,
        child: Container(
          width: 200,
          height: 200,
          color: color,
          child: Center(
            child: Text(
              text,
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
          ),
        ),
      ),
    );
  }
}