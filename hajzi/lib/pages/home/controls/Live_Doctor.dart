import 'package:flutter/material.dart';
import 'package:hajzi/pages/home/home_page.dart';

class LiveDoctor extends StatelessWidget {
  const LiveDoctor({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: const [
          LiveDoctorCard(image: "assets/icons/image.png"),
          LiveDoctorCard(image: "assets/icons/image.png"),
          LiveDoctorCard(image: "assets/icons/image.png"),
        ],
      ),
    );
  }
}
