import 'package:flutter/material.dart';

class ReactButton extends StatefulWidget {
  final Widget child;
  final VoidCallback? onTap;
  final int bounceDuration;

  ReactButton({
    required this.child,
    this.onTap,
    this.bounceDuration = 200,
  });

  @override
  _ReactButtonState createState() => _ReactButtonState();
}

class _ReactButtonState extends State<ReactButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: widget.bounceDuration),
      lowerBound: 0.0,
      upperBound: 0.1,
    )..addListener(() {
        setState(() {});
      });
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
      child: InkWell(
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
        child: widget.child,
      ),
      builder: (_, child) {
        final scale = 1 + _controller.value;
        return Transform.scale(
          scale: scale,
          child: child,
        );
      },
    );
  }
}
