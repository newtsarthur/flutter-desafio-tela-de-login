import 'package:flutter/material.dart';
import '../services/api_service.dart';
import 'package:flutter/cupertino.dart';

class CadastroPage extends StatefulWidget {
  const CadastroPage({super.key});

  @override
  _CadastroPageState createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();
  final ApiService _apiService = ApiService();
  bool _isLoading = false;

  void _cadastrarUsuario() async {
    setState(() {
      _isLoading = true;
    });

    try {
      String response = await _apiService.cadastrarUsuario(_nomeController.text, _emailController.text, _senhaController.text);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Cadastro realizado com sucesso!"),
          backgroundColor: Colors.green,
        ),
      );
      
      // Aqui você pode adicionar navegação para outra tela após Cadastro
      // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Erro: ${e.toString()}"),
          backgroundColor: Colors.red,
        ),
      );
    }

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: CupertinoColors.destructiveRed,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.network('https://cdn-icons-png.flaticon.com/512/3706/3706711.png',
            width: 20,
            height: 200,
            ),
            const Text("Location Changer",
            style: TextStyle(
              fontSize: 24,
              height: 3,
              color: CupertinoColors.lightBackgroundGray,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,),
            const Text("Plugin for Tinder",
            style: TextStyle(
              fontSize: 15,
              height: 3,
              color: CupertinoColors.lightBackgroundGray,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
            ),            const SizedBox(height: 20),
            TextField(
              controller: _nomeController,
              decoration: const InputDecoration(
                labelText: "Nome",
                labelStyle: TextStyle(
                  color: CupertinoColors.extraLightBackgroundGray,
                ),
                border: OutlineInputBorder(),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: CupertinoColors.inactiveGray,
                  )
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: CupertinoColors.opaqueSeparator,
                  ),
                ),
              ),
              style: TextStyle(
                color: CupertinoColors.extraLightBackgroundGray,
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: "Email",
                labelStyle: TextStyle(
                  color: CupertinoColors.extraLightBackgroundGray,
                ),
                border: OutlineInputBorder(),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: CupertinoColors.inactiveGray,
                  )
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: CupertinoColors.opaqueSeparator,
                  ),
                ),
              ),
              style: TextStyle(
                color: CupertinoColors.extraLightBackgroundGray,
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _senhaController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: "Senha",
                labelStyle: TextStyle(
                  color: CupertinoColors.extraLightBackgroundGray,
                ),
                border: OutlineInputBorder(),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: CupertinoColors.inactiveGray,
                  ),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: CupertinoColors.opaqueSeparator,
                  ),
                ),
              ),
              style: const TextStyle(
                color: CupertinoColors.extraLightBackgroundGray,
              ),
            ),
            const SizedBox(height: 24),
            _isLoading
                ? const Center(child: CircularProgressIndicator())
                : ElevatedButton(
                    onPressed: _cadastrarUsuario,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    child: const Text(
                      "Cadastrar",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.redAccent,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}