import 'package:flutter/material.dart';
import 'package:tyba_test/src/bloc/login_bloc.dart';

class PasswordInput extends StatefulWidget {
  final String password;
  final Function onChangeText;
  final LoginBloc bloc;

  const PasswordInput({
    this.onChangeText,
    this.password,
    this.bloc,
    Key key,
  }) : super(key: key);

  @override
  _PasswordInputState createState() => _PasswordInputState();
}

class _PasswordInputState extends State<PasswordInput> {
  bool _hidden = true;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: widget.bloc.passwordStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Container(
          padding: EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: TextField(
            onChanged: widget.bloc.changePassword,
            obscureText: _hidden,
            maxLength: 12,
            decoration: InputDecoration(
              labelStyle: TextStyle(
                color: Colors.deepPurple,
              ),
              focusColor: Colors.deepPurple,
              hoverColor: Colors.deepPurple,
              hintText: 'Contraseña',
              labelText: 'Contraseña',
              errorText: snapshot.error,
              suffixIcon: IconButton(
                icon: Icon(
                  (_hidden) ? Icons.visibility : Icons.visibility_off_rounded,
                  color: Colors.deepPurple,
                ),
                onPressed: () {
                  setState(() {
                    _hidden = !_hidden;
                  });
                },
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
