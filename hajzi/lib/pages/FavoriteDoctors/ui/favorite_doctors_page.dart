import 'package:flutter/material.dart';
import '../data/favorite_doctors_data.dart';
import '../widgets/doctor_card.dart';
import '../logic/favorite_doctors_logic.dart';

class FavoriteDoctorsPage extends StatelessWidget {
  const FavoriteDoctorsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEFFFEF), // خلفية فاتحة
      appBar: AppBar(
        title: const Text(
          'Favorite Doctors',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.white, // لون النص أبيض يبان على الأخضر
          ),
        ),
        centerTitle: true,
        elevation: 6,
        backgroundColor: Colors.green[600],
        iconTheme: const IconThemeData(color: Colors.white),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(25)),
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFF2ECC71), // أخضر فاتح
                Color(0xFF27AE60), // أخضر أغمق
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(25)),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 6,
                offset: Offset(0, 3),
              ),
            ],
          ),
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
