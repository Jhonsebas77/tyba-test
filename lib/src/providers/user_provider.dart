import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:tyba_test/config/userPreferences/user_preferences.dart';

class UserProvider {
  final String _firebaseToken = 'AIzaSyCuAXz-kyq5z5-NHzaI4jkbQHvwEZK58pc';
  final _prefs = new UserPreferences();
  Future loginUser(String email, String password) async {
    final authData = {
      'email': email,
      'password': password,
      'returnSecureToken': true,
    };
    final url =
        'https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=$_firebaseToken';
    final response = await http.post(
      url,
      body: json.encode(authData),
    );
    Map<String, dynamic> decodeResponse = json.decode(response.body);
    if (decodeResponse.containsKey('idToken')) {
      _prefs.token = decodeResponse['idToken'];
      return {'ok': true, 'token': decodeResponse['idToken']};
    } else {
      return {'ok': false, 'message': decodeResponse['error']['message']};
    }
  }

  Future<Map<String, dynamic>> newUser(String email, String password) async {
    final authData = {
      'email': email,
      'password': password,
      'returnSecureToken': true,
    };
    final url =
        'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=$_firebaseToken';
    final response = await http.post(
      url,
      body: json.encode(authData),
    );
    Map<String, dynamic> decodeResponse = json.decode(response.body);
    if (decodeResponse.containsKey('idToken')) {
      _prefs.token = decodeResponse['idToken'];
      return {'ok': true, 'token': decodeResponse['idToken']};
    } else {
      return {'ok': false, 'message': decodeResponse['error']['message']};
    }
  }

  void logOut() => _prefs.token = null;
}
