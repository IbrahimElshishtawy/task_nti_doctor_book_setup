// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  final String message;
  final bool isMe;

  const MessageBubble({required this.message, required this.isMe, super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.7,
        ),
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          decoration: BoxDecoration(
            gradient: isMe
                ? LinearGradient(
                    colors: [Colors.tealAccent.shade400, Colors.teal.shade400],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  )
                : LinearGradient(
                    colors: [Colors.grey.shade300, Colors.grey.shade200],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(isMe ? 16 : 0),
              topRight: Radius.circular(isMe ? 0 : 16),
              bottomLeft: const Radius.circular(16),
              bottomRight: const Radius.circular(16),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 4,
                offset: const Offset(2, 2),
              ),
            ],
          ),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 4),
                child: Text(
                  message,
                  style: TextStyle(
                    color: isMe ? Colors.white : Colors.black87,
                    fontSize: 15,
                  ),
                ),
              ),
              // Tail
              Positioned(
                bottom: 0,
                left: isMe ? null : 0,
                right: isMe ? 0 : null,
                child: CustomPaint(
                  painter: BubbleTailPainter(isMe: isMe),
                  size: const Size(10, 10),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// رسم Tail صغير للفقاعة
class BubbleTailPainter extends CustomPainter {
  final bool isMe;

  BubbleTailPainter({required this.isMe});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = isMe ? Colors.tealAccent.shade400 : Colors.grey.shade300;

    final path = Path();
    if (isMe) {
      path.moveTo(0, 0);
      path.lineTo(size.width, size.height / 2);
      path.lineTo(0, size.height);
    } else {
      path.moveTo(size.width, 0);
      path.lineTo(0, size.height / 2);
      path.lineTo(size.width, size.height);
    }
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
