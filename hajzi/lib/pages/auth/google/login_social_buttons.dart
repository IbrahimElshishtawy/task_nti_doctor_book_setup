import 'package:flutter/material.dart';

class LoginSocialButtons extends StatelessWidget {
  const LoginSocialButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton.icon(
          onPressed: () {
            // TODO: Google Sign-In
          },
          icon: const Icon(Icons.g_mobiledata),
          label: const Text("Google"),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
          ),
        ),
        const SizedBox(width: 10),
        ElevatedButton.icon(
          onPressed: () {
            // TODO: Facebook Sign-In
          },
          icon: const Icon(Icons.facebook),
          label: const Text("Facebook"),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
          ),
        ),
      ],
    );
  }
}
