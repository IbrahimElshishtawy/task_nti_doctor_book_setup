import 'package:flutter/material.dart';
import '../data/favorite_doctors_data.dart';
import '../widgets/doctor_card.dart';
import '../logic/favorite_doctors_logic.dart';

class FavoriteDoctorsPage extends StatelessWidget {
  const FavoriteDoctorsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0F4F8),
      appBar: AppBar(
        title: const Text(
          'Favorite Doctors',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 2,
        iconTheme: const IconThemeData(color: Colors.black87),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(25)),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: GridView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: favoriteDoctors.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 0.65,
            ),
            itemBuilder: (context, index) {
              final doctor = favoriteDoctors[index];
              return DoctorCard(
                doctor: doctor,
                onTap: () => navigateToDoctor(context, doctor),
              );
            },
          ),
        ),
      ),
    );
  }
}
