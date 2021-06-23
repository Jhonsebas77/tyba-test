import 'package:flutter/material.dart';
import 'package:tyba_test/src/pages/login/login_page.dart';
import 'package:tyba_test/src/providers/user_provider.dart';
import 'package:tyba_test/src/utils/utils.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final userProvider = new UserProvider();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bienvenido'),
        actions: [
          _buildLogoutButton(context),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: Text(
                    'Bienvenido',
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }

  _buildLogoutButton(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.logout),
      onPressed: () => showAlertMessage(
        context: context,
        message: handlerAlertMessage('LOGOUT'),
        title: handlerAlertTitle('LOGOUT'),
        primaryAction: () => _logOut(context),
        primaryActionText: 'Cerrar Sesion',
      ),
    );
  }

  _logOut(BuildContext context) {
    userProvider.logOut();
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => LoginPage(),
      ),
      (route) => false,
    );
  }
}
