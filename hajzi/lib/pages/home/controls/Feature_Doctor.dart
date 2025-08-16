import 'package:flutter/material.dart';

import 'package:hajzi/pages/home/widget/FeatureDoctorCard.dart';

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
            image: "assets/images/feture2.png",
          ),
          FeatureDoctorCard(
            name: "Dr. Strain",
            rating: 3.0,
            image: "assets/images/feture3.png",
          ),
          FeatureDoctorCard(
            name: "Dr. Lachinet",
            rating: 2.9,
            image: "assets/images/feture4.png",
          ),
        ],
      ),
    );
  }
}
