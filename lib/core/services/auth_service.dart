import 'dart:convert';
import 'package:http/http.dart' as http;

Future<bool> registerUser(String name, String email, String password) async {
  final url = Uri.parse('http://10.0.2.2:8000/register');
  try {
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'name': name,
        'email': email,
        'password': password,
      }),
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      // Registro exitoso
      return true;
    } else {
      // Manejo de error
      print('Error: ${response.body}');
      return false;
    }
  } catch (e) {
    print('Exception: $e');
    return false;
  }
}

Future<bool> loginUser(String email, String password) async {
  final url = Uri.parse('http://10.0.2.2:8000/login'); 
  try {
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'email': email,
        'password': password,
      }),
    );
    if (response.statusCode == 200) {
      return true;
    } else {
      print('Error: ${response.body}');
      return false;
    }
  } catch (e) {
    print('Exception: $e');
    return false;
  }
}