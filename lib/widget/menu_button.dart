import 'package:flutter/material.dart';

class MenuButton extends StatefulWidget {
  final Widget child;
  final VoidCallback? onTap;
  final int bounceDuration;

  MenuButton({
    required this.child,
    this.onTap,
    this.bounceDuration = 200,
  });

  @override
  _MenuButtonState createState() => _MenuButtonState();
}

class _MenuButtonState extends State<MenuButton>
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
        final xOffset = 128 * _controller.value;
        return Transform.translate(
          offset: Offset(xOffset, 0),
          child: child,
        );
      },
    );
  }
}
