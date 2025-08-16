import 'package:flutter/material.dart';

import 'package:hajzi/pages/home/widget/LiveDoctorCard.dart';

class LiveDoctor extends StatelessWidget {
  const LiveDoctor({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: const [
          LiveDoctorCard(image: "assets/images/imageLive1.png"),
          LiveDoctorCard(image: "assets/images/imageLive2.png"),
          LiveDoctorCard(image: "assets/images/imageLive3.png"),
        ],
      ),
    );
  }
}
