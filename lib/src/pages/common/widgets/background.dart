import 'package:flutter/material.dart';
import 'package:tyba_test/src/pages/common/widgets/background_circle.dart';
import 'package:tyba_test/src/pages/common/widgets/background_gradient.dart';
import 'package:tyba_test/src/pages/common/widgets/logo_widget.dart';

class Background extends StatelessWidget {
  const Background({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackgroundGradient(),
        Positioned(
          top: 90,
          left: 30,
          child: CircleBackground(),
        ),
        Positioned(
          top: -40,
          right: -30,
          child: CircleBackground(),
        ),
        Positioned(
          bottom: -50,
          right: -10,
          child: CircleBackground(),
        ),
        LogoApp(),
      ],
    );
  }
}
