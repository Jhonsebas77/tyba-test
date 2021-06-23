import 'package:flutter/material.dart';

class CircleBackground extends StatelessWidget {
  const CircleBackground({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          100,
        ),
        color: Color.fromRGBO(
          255,
          255,
          255,
          0.05,
        ),
      ),
    );
  }
}
