// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'dart:math' as math;

class BackgroundAnimation extends StatefulWidget {
  final Widget child;
  const BackgroundAnimation({Key? key, required this.child}) : super(key: key);

  @override
  State<BackgroundAnimation> createState() => _BackgroundAnimationState();
}

class _BackgroundAnimationState extends State<BackgroundAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 6),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Gradient background
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF00C6A2), Color(0xFF007C91)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return CustomPaint(
              size: MediaQuery.of(context).size,
              painter: _BackgroundPainter(_controller.value),
            );
          },
        ),
        widget.child,
      ],
    );
  }
}

class _BackgroundPainter extends CustomPainter {
  final double progress;
  _BackgroundPainter(this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Colors.white.withOpacity(0.1);
    final paint2 = Paint()..color = Colors.white.withOpacity(0.15);

    final radius = 150;
    final offset1 = Offset(
      size.width * 0.5 + math.sin(progress * 2 * math.pi) * 50,
      size.height * 0.2,
    );
    final offset2 = Offset(
      size.width * 0.5 + math.cos(progress * 2 * math.pi) * 50,
      size.height * 0.75,
    );

    canvas.drawCircle(offset1, radius.toDouble(), paint);
    canvas.drawCircle(offset2, radius.toDouble(), paint2);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
