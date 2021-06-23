import 'package:flutter/material.dart';

class DefaultPage extends StatelessWidget {
  const DefaultPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '404',
        ),
        backgroundColor: Colors.deepPurple,
      ),
    );
  }
}
