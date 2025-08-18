// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:hajzi/pages/home/widget/FeatureDoctorCard.dart';

class FeatureDoctor extends StatelessWidget {
  const FeatureDoctor({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: const [
          FeatureDoctorCard(
            name: "Dr. Crick",
            rating: 3.7,
            image: "assets/images/feture2.png",
            specialty: "Cardiologist",
            details: "Heart specialist at City Hospital.",
            experience: 10,
          ),
          FeatureDoctorCard(
            name: "Dr. Strain",
            rating: 3.0,
            image: "assets/images/ferure3.png",
            specialty: "Dentist",
            details: "Expert in cosmetic dentistry. Works at Smile Clinic.",
            experience: 8,
          ),
          FeatureDoctorCard(
            name: "Dr. Lachinet",
            rating: 2.9,
            image: "assets/images/feture4.png",
            specialty: "Neurologist",
            details: "Brain disorder specialist. Central Neuro Center.",
            experience: 12,
          ),
        ],
      ),
    );
  }
}
