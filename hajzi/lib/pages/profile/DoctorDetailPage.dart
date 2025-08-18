// ignore_for_file: file_names, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:hajzi/pages/Book/Booking_Page_doctor.dart';

class DoctorDetailPage extends StatelessWidget {
  final String name;
  final String specialty;
  final double rating;
  final String image;
  final String details;
  final int experience;

  const DoctorDetailPage({
    super.key,
    required this.name,
    required this.specialty,
    required this.rating,
    required this.image,
    required this.details,
    required this.experience,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FA),
      appBar: AppBar(
        title: Text(
          "Doctor Details",
          style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 1,
        iconTheme: const IconThemeData(color: Colors.black87), // زر الرجوع أسود
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // صورة الطبيب مع تأثير الظل
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 15,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: CircleAvatar(
                radius: 70,
                backgroundImage: AssetImage(image),
              ),
            ),
            const SizedBox(height: 20),
            // الاسم والتخصص
            Text(
              name,
              style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            Text(
              specialty,
              style: const TextStyle(
                fontSize: 20,
                color: Colors.grey,
                fontStyle: FontStyle.italic,
              ),
            ),
            const SizedBox(height: 10),
            // التقييم مع نجوم
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.star, color: Colors.yellow, size: 22),
                const SizedBox(width: 5),
                Text(
                  rating.toString(),
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 25),
            // معلومات الطبيب في بطاقات
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: ListTile(
                leading: const Icon(
                  Icons.info_outline,
                  color: Color(0xFF38C172),
                ),
                title: const Text(
                  "Details",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                subtitle: Text(
                  details,
                  style: const TextStyle(fontSize: 14, height: 1.5),
                ),
              ),
            ),
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: ListTile(
                leading: const Icon(
                  Icons.work_outline,
                  color: Color(0xFF38C172),
                ),
                title: const Text(
                  "Experience",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                subtitle: Text(
                  "$experience years",
                  style: const TextStyle(fontSize: 14),
                ),
              ),
            ),
            const SizedBox(height: 30),
            // زر الحجز
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BookingPage(
                        imageUrl: image,
                        nameDoctor: name,
                        specialty: specialty,
                      ),
                    ),
                  );
                },
                icon: const Icon(Icons.calendar_today, size: 22),
                label: const Text(
                  "Book Appointment",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF38C172),
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  elevation: 5,
                  shadowColor: Colors.black54,
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
