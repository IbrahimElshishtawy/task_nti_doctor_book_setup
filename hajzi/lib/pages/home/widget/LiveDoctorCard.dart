import 'package:flutter/material.dart';

class LiveDoctorCard extends StatelessWidget {
  final String image;
  const LiveDoctorCard({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,
      margin: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
      ),
      child: Stack(
        children: [
          // كلمة Live أعلى اليمين
          Align(
            alignment: Alignment.topRight,
            child: Container(
              margin: const EdgeInsets.all(8),
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(6),
              ),
              child: const Text(
                "Live",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          // أيقونة التشغيل في منتصف الصورة
          Center(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black45,
                shape: BoxShape.circle,
              ),
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(Icons.play_arrow, color: Colors.white, size: 30),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
