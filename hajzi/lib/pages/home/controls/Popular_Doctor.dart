import 'package:flutter/material.dart';
import 'package:hajzi/pages/home/home_page.dart';

class PopularDoctor extends StatelessWidget {
  const PopularDoctor({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        PopularDoctorCard(
          name: "Dr. Fillerup Grab",
          specialty: "Medicine Specialist",
          rating: 4.5,
          image: "assets/icons/image.png",
        ),
        PopularDoctorCard(
          name: "Dr. Blessing",
          specialty: "Dentist Specialist",
          rating: 4.8,
          image: "assets/icons/image.png",
        ),
      ],
    );
  }
}
