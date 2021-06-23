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
          Icon(
            Icons.food_bank,
            color: Colors.white,
            size: 100,
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
