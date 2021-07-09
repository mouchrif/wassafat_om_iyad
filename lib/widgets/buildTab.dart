import 'package:flutter/material.dart';

class BuildTab extends StatelessWidget {
  final String text;
  final Color color;
  final double width;
  BuildTab({
    this.text,
    this.color,
    this.width,
  });
  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(29),
          border: Border.all(color: color, width: width),
        ),
        child: Align(
          alignment: Alignment.center,
          child: Text(text),
        ),
      ),
    );
  }
}
