// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class DoctorCardLiveMore extends StatelessWidget {
  final Map<String, String> doctor;
  final bool isLive;
  final VoidCallback onTap;

  const DoctorCardLiveMore({
    super.key,
    required this.doctor,
    required this.isLive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Stack(
          children: [
            // صورة الطبيب
            Positioned.fill(
              child: Image.asset(doctor["image"]!, fit: BoxFit.cover),
            ),
            // تراكب شفاف
            Positioned.fill(
              child: Container(
                color: Colors.black.withOpacity(isLive ? 0.2 : 0.1),
              ),
            ),
            // كلمة LIVE للأطباء المباشرين
            if (isLive)
              Positioned(
                top: 12,
                left: 12,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(6),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black45,
                        offset: Offset(1, 2),
                        blurRadius: 4,
                      ),
                    ],
                  ),
                  child: const Text(
                    "LIVE",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            // أيقونة التشغيل
            Center(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white70,
                  shape: BoxShape.circle,
                ),
                padding: const EdgeInsets.all(12),
                child: Icon(
                  Icons.play_arrow,
                  color: isLive ? Colors.red : Colors.blueAccent,
                  size: 32,
                ),
              ),
            ),
            // اسم الطبيب أسفل البطاقة
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.all(8),
                color: Colors.white70,
                child: Text(
                  doctor["name"]!,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
