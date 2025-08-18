// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:hajzi/pages/profile/DoctorDetailPage.dart';

class PopularDoctorCard extends StatelessWidget {
  final Map<String, dynamic> doctor;

  const PopularDoctorCard({super.key, required this.doctor});

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
                  name: doctor['name'] ?? 'Unknown',
                  specialty: doctor['specialty'] ?? 'Specialist',
                  rating: doctor['rating']?.toDouble() ?? 0.0,
                  image: doctor['image'] ?? 'assets/images/default.png',
                  details: doctor['details'] ?? '',
                  experience: doctor['experience'] ?? 0,
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
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 3,
        child: ListTile(
          leading: CircleAvatar(
            backgroundImage: AssetImage(
              doctor['image'] ?? 'assets/images/default.png',
            ),
          ),
          title: Text(
            doctor['name'] ?? 'Unknown',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text(doctor['specialty'] ?? 'Specialist'),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.star, color: Colors.yellow),
              const SizedBox(width: 5),
              Text((doctor['rating']?.toString() ?? '0.0')),
            ],
          ),
        ),
      ),
    );
  }
}
