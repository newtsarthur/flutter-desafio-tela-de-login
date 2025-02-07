import 'package:flutter/material.dart';
import '../services/api_service.dart'; // Importe o serviço de API

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();
  final ApiService _apiService = ApiService();
  bool _isLoading = false;

  void _login() async {
    setState(() {
      _isLoading = true;
    });

    try {
      String response = await _apiService.login(_emailController.text, _senhaController.text);
      
      // Se o login for bem-sucedido, exiba uma mensagem e vá para outra tela
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Login realizado com sucesso!"),
        backgroundColor: Colors.green,
      ));

      // Aqui você pode navegar para outra tela, ex:
      // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));

    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Erro: ${e.toString()}"),
        backgroundColor: Colors.red,
      ));
    }

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.network(
              'https://cdn-icons-png.flaticon.com/512/3706/3706711.png',
              width: 20,
              height: 200,
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: "Email"),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _senhaController,
              obscureText: true,
              decoration: const InputDecoration(labelText: "Senha"),
            ),
            const SizedBox(height: 24),
            _isLoading
                ? Center(child: CircularProgressIndicator())
                : ElevatedButton(
                    onPressed: _login,
                    child: const Text("Login"),
                  ),
          ],
        ),
      ),
    );
  }
}
