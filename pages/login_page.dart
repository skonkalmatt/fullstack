import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueAccent,
        body: SafeArea(
            child: Column(
          children: [
            const SizedBox(height: 50),
            Icon(
              Icons.lock,
              size: 100,
            ),
            Text(
              "Welcome to FullStack",
              style: TextStyle(color: Colors.grey[800]),
            ),

            // Text

            // Username

            // Password

            // Sign in)
          ],
        )));
  }
}
