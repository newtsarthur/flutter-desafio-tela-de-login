import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = "http://localhost:8080/auth/login";

  Future<String> login(String email, String senha) async {
    final response = await http.post(
      Uri.parse(baseUrl),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"email": email, "senha": senha}),
    );
    
    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception("Credências inválidas!");
    }
  }
}