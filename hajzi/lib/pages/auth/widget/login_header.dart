import 'package:flutter/material.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Text(
          "Welcome back",
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 10),
        Text(
          "Sign in to continue",
          style: TextStyle(fontSize: 14, color: Colors.white70),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
