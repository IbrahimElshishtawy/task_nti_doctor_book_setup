// ignore_for_file: file_names

import 'package:flutter/material.dart';

class DoctorDetailsView extends StatelessWidget {
  final String image;
  final String name;
  final String specialty;

  const DoctorDetailsView({
    super.key,
    required this.image,
    required this.name,
    required this.specialty,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF2F802B),
        title: Text(name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Hero(
              tag: image,
              child: CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage(image),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              name,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            Text(
              specialty,
              style: const TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 20),
            Text(
              "Dr. $name is one of the best in their field with years of experience and hundreds of happy patients.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, color: Colors.black87),
            ),
          ],
        ),
      ),
    );
  }
}
