import 'package:flutter/material.dart';

class PasswordInput extends StatefulWidget {
  final String password;
  final Function onChangeText;
  const PasswordInput({
    this.onChangeText,
    this.password,
    Key key,
  }) : super(key: key);

  @override
  _PasswordInputState createState() => _PasswordInputState();
}

class _PasswordInputState extends State<PasswordInput> {
  bool _hidden = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: TextField(
        onChanged: (value) => widget.onChangeText(value),
        obscureText: _hidden,
        decoration: InputDecoration(
          labelStyle: TextStyle(
            color: Colors.green,
          ),
          focusColor: Colors.green,
          hoverColor: Colors.green,
          hintText: 'Contraseña',
          labelText: 'Contraseña',
          suffixIcon: IconButton(
            icon: Icon(
              (_hidden) ? Icons.visibility : Icons.visibility_off_rounded,
              color: Colors.green,
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
  }
}
