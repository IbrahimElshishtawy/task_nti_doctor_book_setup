// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hajzi/pages/auth/Register_page.dart';

// Cubits
import 'cubits/auth/auth_cubit.dart';

// Pages
import 'pages/auth/login.dart';
import 'pages/splash/splash_page.dart';
import 'pages/splash/onboarding_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    await Firebase.initializeApp();
  } catch (e) {
    debugPrint("Firebase init error: $e");
  }

  runApp(const HajziApp());
}

class HajziApp extends StatelessWidget {
  const HajziApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>(
          create: (_) =>
              AuthCubit(FirebaseAuth.instance, FirebaseFirestore.instance),
        ),
      ],
      child: MaterialApp(
        title: 'Medical App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF00C6A2)),
          useMaterial3: true,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => const SplashPage(),
          '/onboarding': (context) => const OnboardingPage(),
          '/login': (context) => LoginPage(),
          '/register': (context) => const RegisterPage(),
          // '/home': (context) => const HomePage(),
        },
      ),
    );
  }
}
