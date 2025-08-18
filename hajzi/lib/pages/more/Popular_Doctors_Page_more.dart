// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:hajzi/pages/more/widget/popular_doctor_card.dart';

class PopularDoctorsPage extends StatelessWidget {
  const PopularDoctorsPage({super.key});

  final List<Map<String, dynamic>> popularDoctors = const [
    {
      "name": "Dr. Alice",
      "specialty": "Cardiologist",
      "details": "Heart specialist at City Hospital.",
      "image": "assets/images/imagepopular2.png",
      "experience": 10,
      "rating": 4.5,
    },
    {
      "name": "Dr. Bob",
      "specialty": "Dentist",
      "details": "Expert in cosmetic dentistry. Works at Smile Clinic.",
      "image": "assets/images/imagepopular2.png",
      "experience": 8,
      "rating": 4.0,
    },
    {
      "name": "Dr. Carol",
      "specialty": "Neurologist",
      "details": "Brain disorder specialist. Central Neuro Center.",
      "image": "assets/images/imagepopular2.png",
      "experience": 12,
      "rating": 4.8,
    },
    {
      "name": "Dr. David",
      "specialty": "Pediatrician",
      "details": "Child care and vaccinations. Happy Kids Clinic.",
      "image": "assets/images/imagepopular2.png",
      "experience": 7,
      "rating": 4.2,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.teal.shade700, Colors.tealAccent.shade400],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          title: const Text(
            'Popular Doctors',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.5,
            ),
          ),
          centerTitle: true,
          elevation: 6,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
        child: ListView.builder(
          itemCount: popularDoctors.length,
          itemBuilder: (context, index) {
            final doctor = popularDoctors[index];
            return PopularDoctorCardmore(doctor: doctor, index: index);
          },
        ),
      ),
    );
  }
}
