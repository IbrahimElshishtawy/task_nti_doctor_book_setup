// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:hajzi/pages/profile/DoctorDetailPage.dart';

class FeatureDoctorCard extends StatelessWidget {
  final String name, image;
  final double rating;
  final String specialty;
  final String details;
  final int experience;

  const FeatureDoctorCard({
    super.key,
    required this.name,
    required this.rating,
    required this.image,
    required this.specialty,
    required this.details,
    required this.experience,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          PageRouteBuilder(
            transitionDuration: const Duration(milliseconds: 500),
            pageBuilder: (context, animation, secondaryAnimation) =>
                DoctorDetailPage(
                  name: name,
                  specialty: specialty,
                  rating: rating,
                  image: image,
                  details: details,
                  experience: experience,
                ),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
                  var begin = const Offset(0, 1);
                  var end = Offset.zero;
                  var curve = Curves.ease;

                  var tween = Tween(
                    begin: begin,
                    end: end,
                  ).chain(CurveTween(curve: curve));

                  return SlideTransition(
                    position: animation.drive(tween),
                    child: child,
                  );
                },
          ),
        );
      },
      child: Container(
        width: 100,
        margin: const EdgeInsets.only(right: 12),
        child: Column(
          children: [
            CircleAvatar(backgroundImage: AssetImage(image), radius: 30),
            const SizedBox(height: 6),
            Text(
              name,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 12),
            ),
            Text(
              rating.toString(),
              style: const TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
