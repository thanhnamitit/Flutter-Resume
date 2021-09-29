import 'package:flutter/material.dart';

import '../app.dart';

class AnimatedText extends StatefulWidget {
  final VoidCallback? onTap;
  final int bounceDuration;
  final String text;

  AnimatedText({
    required this.onTap,
    required this.text,
    this.bounceDuration = 200,
  });

  @override
  _AnimatedTextState createState() => _AnimatedTextState();
}

class _AnimatedTextState extends State<AnimatedText>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  late Animation<Color?> _colorTween;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: widget.bounceDuration),
    );
    _colorTween = ColorTween(
      begin: Colors.black87,
      end: SUB_COLOR,
    ).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onTapDown() {
    _controller.forward();
  }

  void _onTapUp() {
    _controller.reverse();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (_, child) {
        return InkWell(
          highlightColor: Colors.transparent,
          focusColor: Colors.transparent,
          hoverColor: Colors.transparent,
          splashColor: Colors.transparent,
          onHover: (value) {
            if (value)
              _onTapDown();
            else
              _onTapUp();
          },
          onTap: widget.onTap,
          child: Text(
            widget.text,
            style: TextStyle(
              color: _colorTween.value,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        );
      },
    );
  }
}
