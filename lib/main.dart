import 'package:flutter/material.dart';
import 'package:tyba_test/config/userPreferences/user_preferences.dart';
import 'package:tyba_test/src/bloc/provider_bloc.dart';
import 'package:tyba_test/src/pages/default_page.dart';
import 'package:tyba_test/src/routes/routes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = new UserPreferences();
  await prefs.initPrefs();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final prefs = new UserPreferences();
    final String _token = prefs.token;
    return Provider(
      child: MaterialApp(
        title: '¿Donde Comer?',
        debugShowCheckedModeBanner: false,
        initialRoute: _token.isEmpty ? 'login' : 'home',
        routes: getApplicationRoutes(),
        onGenerateRoute: (settings) => MaterialPageRoute(
          builder: (context) => DefaultPage(),
        ),
        theme: ThemeData(
          primaryColor: Colors.deepPurple,
          primarySwatch: Colors.deepPurple,
        ),
      ),
    );
  }
}
