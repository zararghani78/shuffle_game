import 'package:flutter/material.dart';

class Buttons extends StatefulWidget {
  final String title;
  final VoidCallback? onPressed;
  final double height;
  final double  width;
final  shadowColor;
  const Buttons({
    super.key,
    required this.title,
    required this.height,
    required this. width,
     this.shadowColor,
    this.onPressed,
  });

  @override
  _ButtonsState createState() => _ButtonsState();
}

class _ButtonsState extends State<Buttons> {
  final Color _buttonColor = Colors.white;
  double _scale = 1.0;

  void _onTapDown(TapDownDetails details) {
    setState(() {
      _scale = 1.1;
    });
  }

  void _onTapUp(TapUpDetails details) {
    setState(() {
      _scale = 1.0;
    });
    if (widget.onPressed != null) {
      widget.onPressed!();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: _onTapDown,
      onTapUp: _onTapUp,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        curve: Curves.easeInOut,
        margin: const EdgeInsets.all(10),
        alignment: Alignment.center,
        height: widget.height * _scale,
        width: widget.width * _scale,
        decoration: BoxDecoration(
          color: _buttonColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          widget.title,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 13,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
