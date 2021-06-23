import 'package:flutter/material.dart';

class LogoApp extends StatelessWidget {
  const LogoApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 80,
      ),
      child: Column(
        children: [
          Image(
            image: AssetImage(
              'assets/img/logo_white.webp',
            ),
            height: 90,
            width: 90,
            fit: BoxFit.contain,
          ),
          SizedBox(
            height: 10,
            width: double.infinity,
          ),
          Text(
            '¿Donde Comer?',
            style: TextStyle(
              color: Colors.white,
              fontSize: 25,
            ),
          ),
        ],
      ),
    );
  }
}
