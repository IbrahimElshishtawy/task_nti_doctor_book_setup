// ignore_for_file: file_names, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:hajzi/pages/find_search/widget/doctor_card.dart';

class FindDoctorsPage extends StatelessWidget {
  const FindDoctorsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F6FF),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,

        // 🔙 زرار أبيض مستطيل في البار
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            borderRadius: BorderRadius.circular(12),
            onTap: () => Navigator.pop(context),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 6,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: const Icon(
                Icons.arrow_back,
                color: Colors.black87,
                size: 22,
              ),
            ),
          ),
        ),

        // 📝 عنوان البار
        title: const Text(
          "Find Doctors",
          style: TextStyle(
            color: Colors.black87,
            fontSize: 22,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.5,
          ),
        ),
      ),

      // 📌 البودي
      body: Column(
        children: [
          // 🔍 Search box
          Container(
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.white, Colors.blue.shade50],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.06),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: const TextField(
              decoration: InputDecoration(
                hintText: "Search for a doctor...",
                hintStyle: TextStyle(color: Colors.black54),
                border: InputBorder.none,
                icon: Icon(Icons.search, color: Colors.blueAccent),
                suffixIcon: Icon(Icons.close, color: Colors.grey),
              ),
            ),
          ),

          // 👩‍⚕️ Doctors List
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              children: const [
                DoctorCard(
                  image: "assets/images/feture2.png",
                  name: "Dr. Shruti Kedia",
                  specialty: "Tooths Dentist",
                  experience: "7 Years experience",
                  rating: "87%",
                  reviews: "69 Patient Stories",
                  nextAvailable: "10:00 AM tomorrow",
                  isFavorite: true,
                ),
                SizedBox(height: 16),
                DoctorCard(
                  image: "assets/images/feture2.png",
                  name: "Dr. Watamaniuk",
                  specialty: "Tooths Dentist",
                  experience: "9 Years experience",
                  rating: "74%",
                  reviews: "78 Patient Stories",
                  nextAvailable: "12:00 AM tomorrow",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
