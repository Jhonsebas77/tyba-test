import 'package:flutter/material.dart';
import 'package:tyba_test/src/bloc/login_bloc.dart';
import 'package:tyba_test/src/bloc/provider_bloc.dart';
import 'package:tyba_test/src/pages/common/widgets/background.dart';
import 'package:tyba_test/src/pages/common/widgets/custom_button.dart';
import 'package:tyba_test/src/pages/common/widgets/email_input.dart';
import 'package:tyba_test/src/pages/common/widgets/password_input.dart';
import 'package:tyba_test/src/providers/user_provider.dart';
import 'package:tyba_test/src/utils/utils.dart';

class RegisterPage extends StatelessWidget {
  final userProvider = new UserProvider();
  RegisterPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Background(),
          _buildLoginForm(context),
        ],
      ),
    );
  }

  Widget _buildLoginForm(BuildContext context) {
    final bloc = Provider.of(context);
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
              vertical: 20,
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
                  color: Colors.deepPurple,
                  size: 40,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    'Crea una cuenta para comenzar a buscar los mejores restaurantes',
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                EmailInput(
                  bloc: bloc,
                ),
                SizedBox(
                  height: 20,
                ),
                PasswordInput(
                  bloc: bloc,
                ),
                SizedBox(
                  height: 20,
                ),
                _buildRegisterButton(bloc),
                // _buildRegisterButton(bloc),
              ],
            ),
          ),
          FlatButton(
            onPressed: () => Navigator.pushReplacementNamed(
              context,
              'login',
            ),
            child: Text('Ya tienes una cuenta?'),
          ),
          SizedBox(
            height: 100,
          ),
        ],
      ),
    );
  }

  Widget _buildRegisterButton(LoginBloc bloc) {
    return StreamBuilder(
      stream: bloc.formValidStream,
      builder: (
        BuildContext context,
        AsyncSnapshot snapshot,
      ) {
        return Container(
          padding: EdgeInsets.symmetric(
            horizontal: 26,
          ),
          child: CustomFlatButton(
            buttonAction:
                snapshot.hasData ? () => _register(bloc, context) : null,
            title: 'Crear cuenta',
            backgroundColor: Colors.deepPurple[900],
            titleColor: Colors.white,
            borderColor: Colors.transparent,
            width: 100,
            height: 50,
            borderRadius: 5,
            borderWidth: 2,
          ),
        );
      },
    );
  }

  _register(LoginBloc bloc, BuildContext context) async {
    Map info = await userProvider.newUser(bloc.email, bloc.password);
    if (info['ok']) {
      Navigator.pushReplacementNamed(context, 'home');
    } else {
      showAlertMessage(
        context: context,
        message: handlerAlertMessage(info['message']),
        title: handlerAlertTitle(info['message']),
      );
    }
  }
}
