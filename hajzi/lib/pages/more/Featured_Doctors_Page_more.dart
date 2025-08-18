// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:hajzi/pages/more/widget/doctor_card_featured.dart';

class FeaturedDoctorsPage extends StatelessWidget {
  const FeaturedDoctorsPage({super.key});

  final List<Map<String, dynamic>> featuredDoctors = const [
    {
      "name": "Dr. Emily",
      "specialty": "Cardiologist",
      "details": "Heart specialist at Central Hospital.",
      "image": "assets/images/feture4.png",
      "experience": 1,
      "rating": 3.5,
      "level": "Beginner",
    },
    {
      "name": "Dr. John",
      "specialty": "Dentist",
      "details": "Expert in cosmetic dentistry. Smile Clinic.",
      "image": "assets/images/feture4.png",
      "experience": 2,
      "rating": 4.0,
      "level": "Intermediate",
    },
    {
      "name": "Dr. Sophia",
      "specialty": "Neurologist",
      "details": "Specialist in brain disorders. Neuro Center.",
      "image": "assets/images/feture4.png",
      "experience": 3,
      "rating": 4.5,
      "level": "Intermediate",
    },
    {
      "name": "Dr. Michael",
      "specialty": "Pediatrician",
      "details": "Child care and vaccinations. Happy Kids Clinic.",
      "image": "assets/images/feture4.png",
      "experience": 0,
      "rating": 3.0,
      "level": "Beginner",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 37, 133, 64),
                  Color.fromARGB(255, 0, 255, 72),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          title: const Text(
            'Featured Doctors',
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
          itemCount: featuredDoctors.length,
          itemBuilder: (context, index) {
            final doctor = featuredDoctors[index];
            return DoctorCardFeatured(doctor: doctor, index: index);
          },
        ),
      ),
    );
  }
}
