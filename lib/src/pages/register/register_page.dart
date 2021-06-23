import 'package:flutter/material.dart';
import 'package:tyba_test/src/pages/common/widgets/custom_flat_button.dart';
import 'package:tyba_test/src/pages/common/widgets/email_input.dart';
import 'package:tyba_test/src/pages/common/widgets/logo_widget.dart';
import 'package:tyba_test/src/pages/common/widgets/password_input.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _buildBackground(context),
          _buildLoginForm(context),
        ],
      ),
    );
  }

  Widget _buildBackgroundColor(BuildContext context) {
    final _sizeScreen = MediaQuery.of(context).size;
    return Container(
      height: _sizeScreen.height * 0.4,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: <Color>[
            Color.fromRGBO(15, 15, 18, 1.0),
            Color.fromRGBO(89, 125, 30, 1.0)
          ],
        ),
      ),
    );
  }

  Widget _buildCircle() => Container(
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

  Widget _buildBackground(BuildContext context) {
    return Stack(
      children: [
        _buildBackgroundColor(context),
        Positioned(
          top: 90,
          left: 30,
          child: _buildCircle(),
        ),
        Positioned(
          top: -40,
          right: -30,
          child: _buildCircle(),
        ),
        Positioned(
          bottom: -50,
          right: -10,
          child: _buildCircle(),
        ),
        LogoApp(),
      ],
    );
  }

  Widget _buildLoginForm(BuildContext context) {
    final _sizeScreen = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          SafeArea(
            child: Container(
              height: 190,
            ),
          ),
          Container(
            width: _sizeScreen.width * 0.85,
            margin: EdgeInsets.symmetric(
              vertical: 30,
            ),
            padding: EdgeInsets.symmetric(
              vertical: 50,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(
                5,
              ),
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 3.0,
                  offset: Offset(
                    0.0,
                    5.0,
                  ),
                  spreadRadius: 1,
                )
              ],
            ),
            child: Column(
              children: [
                Icon(
                  Icons.person_add,
                  color: Colors.green,
                  size: 40,
                ),
                Text(
                  'Crea una cuenta para comenzar a buscar los mejores restaurantes',
                ),
                SizedBox(
                  height: 60,
                ),
                EmailInput(),
                SizedBox(
                  height: 30,
                ),
                PasswordInput(),
                SizedBox(
                  height: 30,
                ),
                _buildButton(),
              ],
            ),
          ),
          FlatButton(
            onPressed: () => Navigator.pushReplacementNamed(context, 'login'),
            child: Text('Ya tienes una cuenta?'),
          ),
          SizedBox(
            height: 100,
          ),
        ],
      ),
    );
  }

  Widget _buildButton() {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 26,
      ),
      child: CustomFlatButton(
        buttonAction: () {},
        title: 'Crear cuenta',
        backgroundColor: Colors.green[900],
        titleColor: Colors.white,
        borderColor: Colors.transparent,
        width: 100,
        height: 50,
        borderRadius: 5,
        borderWidth: 2,
      ),
    );
  }
}
