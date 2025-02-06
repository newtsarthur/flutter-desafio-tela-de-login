import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: const Text("Location Changer")),
      body: Container(
        color: CupertinoColors.destructiveRed,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
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
            ),
            TextField(
              decoration: const InputDecoration(
                labelText: "Email",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              obscureText: true,
              decoration: const InputDecoration(
                labelText: "Password",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {

              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 25),
              ), child: const Text("Login",
                style: TextStyle(
                  fontSize: 20,
                  color: CupertinoColors.destructiveRed,
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
