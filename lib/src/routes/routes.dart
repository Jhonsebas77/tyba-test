import 'package:flutter/material.dart';
import 'package:tyba_test/src/pages/home/home_page.dart';
import 'package:tyba_test/src/pages/login/login_page.dart';
import 'package:tyba_test/src/pages/register/register_page.dart';

Map<String, WidgetBuilder> getApplicationRoutes() => <String, WidgetBuilder>{
      'home': (BuildContext context) => HomePage(),
      'login': (BuildContext context) => LoginPage(),
      'register': (BuildContext context) => RegisterPage(),
    };
