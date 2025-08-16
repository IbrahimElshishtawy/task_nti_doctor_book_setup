import 'package:flutter/material.dart';
import 'package:hajzi/pages/home/home_page.dart';

class FeatureDoctor extends StatelessWidget {
  const FeatureDoctor({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: const [
          FeatureDoctorCard(
            name: "Dr. Crick",
            rating: 3.7,
            image: "assets/icons/image.png",
          ),
          FeatureDoctorCard(
            name: "Dr. Strain",
            rating: 3.0,
            image: "assets/icons/image.png",
          ),
          FeatureDoctorCard(
            name: "Dr. Lachinet",
            rating: 2.9,
            image: "assets/icons/image.png",
          ),
        ],
      ),
    );
  }
}
