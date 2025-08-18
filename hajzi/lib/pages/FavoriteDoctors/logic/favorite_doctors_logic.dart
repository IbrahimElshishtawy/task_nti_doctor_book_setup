import 'package:flutter/material.dart';
import 'package:hajzi/pages/profile/DoctorDetailPage.dart';

void navigateToDoctor(BuildContext context, Map<String, dynamic> doctor) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => DoctorDetailPage(
        name: doctor['name'],
        specialty: doctor['specialty'],
        rating: doctor['rating'].toDouble(),
        image: doctor['image'],
        details: '',
        experience: 0,
      ),
    ),
  );
}
