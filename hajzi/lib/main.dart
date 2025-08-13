// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'pages/splash/splash_page.dart';
import 'pages/splash/onboarding_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const hajzi());
}

class hajzi extends StatelessWidget {
  const hajzi({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Medical App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashPage(),
        '/onboarding': (context) => const OnboardingPage(),
        // '/login': (context) => const LoginPage(),
        // '/register': (context) => const RegisterPage(),
        //  '/home': (context) => const HomePage(),
      },
    );
  }
}
