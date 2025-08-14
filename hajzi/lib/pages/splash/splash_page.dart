import 'dart:async';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    // إعداد أنيميشن الوميض (Pulse)
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);

    _scaleAnimation = Tween<double>(
      begin: 0.95,
      end: 1.05,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    // الانتقال بعد 3 ثواني
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, '/onboarding');
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: Colors.white, // الخلفية بيضاء
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // صورة بوميض بدون أي خلفية
            ScaleTransition(
              scale: _scaleAnimation,
              child: Image.asset(
                'assets/icons/image.png', // مسار اللوجو
                width: 270,
                height: 270,
                fit: BoxFit.contain,
              ),
            ),

            const SizedBox(height: 1),

            // نص اسم التطبيق
            Text(
              "MediCare App",
              style: theme.textTheme.headlineSmall?.copyWith(
                color: Colors.black87,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            // النص الفرعي
            Text(
              "Your health, our priority",
              style: theme.textTheme.bodyMedium?.copyWith(
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
