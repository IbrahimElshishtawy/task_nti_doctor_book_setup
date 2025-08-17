import 'package:flutter/material.dart';

class CommentItem extends StatelessWidget {
  final Map<String, String> comment;
  final Animation<double> animation;

  const CommentItem({
    super.key,
    required this.comment,
    required this.animation,
  });

  @override
  Widget build(BuildContext context) {
    return SizeTransition(
      sizeFactor: animation,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 2),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // صورة المستخدم
            CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage(comment["avatar"]!),
              backgroundColor: Colors.transparent, // الخلفية شفافة تمامًا
            ),
            const SizedBox(width: 8),
            // عمود الاسم والتعليق
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // اسم المستخدم
                  Text(
                    comment["name"] ?? "",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      shadows: [
                        Shadow(
                          blurRadius: 2,
                          color: Colors.black87,
                          offset: Offset(0.5, 0.5),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 3),
                  // التعليق
                  Text(
                    comment["text"]!,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      shadows: [
                        Shadow(
                          blurRadius: 2,
                          color: Colors.black87,
                          offset: Offset(0.5, 0.5),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
