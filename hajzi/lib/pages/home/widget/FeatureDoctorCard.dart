import 'package:flutter/material.dart';

class FeatureDoctorCard extends StatelessWidget {
  final String name, image;
  final double rating;
  const FeatureDoctorCard({
    super.key,
    required this.name,
    required this.rating,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
