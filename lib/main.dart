import 'package:flutter/material.dart';
import 'package:tyba_test/src/pages/default_page.dart';
import 'package:tyba_test/src/routes/routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '¿Donde Comer?',
      debugShowCheckedModeBanner: false,
      initialRoute: 'login',
      routes: getApplicationRoutes(),
      onGenerateRoute: (settings) => MaterialPageRoute(
        builder: (context) => DefaultPage(),
      ),
      theme: ThemeData(
        primaryColor: Colors.deepPurple,
        primarySwatch: Colors.deepPurple,
      ),
    );
  }
}
