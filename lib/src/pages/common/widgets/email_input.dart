import 'package:flutter/material.dart';
import 'package:tyba_test/src/bloc/login_bloc.dart';

class EmailInput extends StatelessWidget {
  final String email;
  final Function onChangeText;
  final LoginBloc bloc;

  const EmailInput({
    this.onChangeText,
    this.email,
    this.bloc,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: bloc.emailStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Container(
          padding: EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: TextField(
            onChanged: (value) => bloc.changeEmail(value),
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              labelStyle: TextStyle(
                color: Colors.deepPurple,
              ),
              focusColor: Colors.deepPurple,
              hoverColor: Colors.deepPurple,
              hintText: 'correo@mail.com',
              labelText: 'Correo electrónico',
              errorText: snapshot.error,
              suffixIcon: Icon(
                Icons.account_circle_outlined,
                color: Colors.deepPurple,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(
                  20,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
