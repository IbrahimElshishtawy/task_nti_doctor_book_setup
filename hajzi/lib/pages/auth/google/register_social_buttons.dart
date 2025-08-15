import 'package:flutter/material.dart';

class RegisterSocialButtons extends StatelessWidget {
  const RegisterSocialButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.g_mobiledata),
          label: const Text("Google"),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            foregroundColor: const Color.fromARGB(255, 219, 34, 34),
          ),
        ),
        const SizedBox(width: 10),
        ElevatedButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.facebook),
          label: const Text("Facebook"),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            foregroundColor: const Color.fromARGB(255, 30, 9, 214),
          ),
        ),
      ],
    );
  }
}
