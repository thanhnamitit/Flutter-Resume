import 'package:flutter/material.dart';

class BasePage extends StatelessWidget {
  final Color color;
  final Widget child;

  BasePage({
    this.color,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        color: color,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: child,
      ),
    );
  }
}
