import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseCadastrarUrl = 'http://localhost:8080/usuarios';

  static const String baseUrl = 'http://localhost:8080/auth/login';

  Future<String> login(String email, String senha) async {
    final response = await http.post(
      Uri.parse(baseUrl),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"email": email, "senha": senha}),
    );
    
    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception("Essa conta não existe!");
    }
  }

    Future<String> cadastrarUsuario(String nome, String email, String senha) async {
    final response = await http.post(
      Uri.parse( baseCadastrarUrl),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "nome": nome,
        "email": email,
        "senha": senha
      }),
    );
    
    if (response.statusCode == 201) {
      return "Usuário cadastrado com sucesso!";
    } else {
      throw Exception("Erro ao cadastrar usuário: ${response.body}");
    }
  }
}