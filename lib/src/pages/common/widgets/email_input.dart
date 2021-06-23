import 'package:flutter/material.dart';

class EmailInput extends StatelessWidget {
  final String email;
  final Function onChangeText;
  const EmailInput({
    this.onChangeText,
    this.email,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: TextField(
        onChanged: (value) => onChangeText(value),
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          labelStyle: TextStyle(
            color: Colors.green,
          ),
          focusColor: Colors.green,
          hoverColor: Colors.green,
          hintText: 'correo@mail.com',
          labelText: 'Correo electrónico',
          suffixIcon: Icon(
            Icons.account_circle_outlined,
            color: Colors.green,
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
