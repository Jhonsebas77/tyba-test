import 'package:flutter/material.dart';

bool isNumeric(String value) {
  if (value.isEmpty) return false;
  final n = num.tryParse(value);
  return (n == null) ? false : true;
}

void showAlertMessage({
  BuildContext context,
  String message,
  String title,
  String primaryActionText,
  Function primaryAction,
}) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text(
        title,
      ),
      content: Text(
        message,
      ),
      actions: [
        primaryAction != null
            ? FlatButton(
                onPressed: primaryAction,
                child: Text(primaryActionText),
                color: Colors.deepPurple,
              )
            : Container(),
        FlatButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text('Cancelar'),
          textColor: Colors.deepPurple[600],
        ),
      ],
    ),
  );
}

final _messages = <String, String>{
  'MESSAGE': 'Lo sentimos',
  'LOGOUT': '¿Estás seguro de cerrar sesion?',
  'EMAIL_NOT_FOUND': 'No encontramos tu correo, verifica tu correo electronico',
  'INVALID_PASSWORD': 'La contraseña es incorrecta',
  'EMAIL_EXISTS': 'Mejor inicia sesion',
};
final _title = <String, String>{
  'MESSAGE': 'Usuario o contraseña incorrecto',
  'LOGOUT': 'Cerrar sesión',
  'EMAIL_NOT_FOUND': 'Correo no encontrado',
  'INVALID_PASSWORD': 'Clave incorrecta',
  'EMAIL_EXISTS': 'El correo ya existe',
};

String handlerAlertMessage(String message) =>
    _messages[message] != null ? _messages[message] : 'Algo salio mal';
String handlerAlertTitle(String title) =>
    _title[title] != null ? _title[title] : 'Lo sentimos';

Widget showLoading() {
  return Container(
    child: Center(
      child: CircularProgressIndicator(
        backgroundColor: Colors.deepPurple,
        strokeWidth: 5,
        valueColor: new AlwaysStoppedAnimation<Color>(
          Colors.purple[100],
        ),
      ),
    ),
  );
}
