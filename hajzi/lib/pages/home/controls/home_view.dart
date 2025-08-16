// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:hajzi/pages/home/Detiles_doctor.dart';
import 'package:hajzi/pages/home/controls/header_home_page.dart';

// ================== الصفحة الرئيسية ==================
class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: CustomScrollView(
        slivers: [
          HeaderHomePage(), // ✅ هنا التعديل
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildCategories(),
                  const SizedBox(height: 30),

                  _buildSectionTitle("Live Doctors"),
                  const SizedBox(height: 15),
                  SizedBox(
                    height: 110,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        _buildLiveDoctor(
                          context,
                          "assets/images/imageLive1.png",
                          "Dr. Sarah",
                        ),
                        _buildLiveDoctor(
                          context,
                          "assets/images/imageLive2.png",
                          "Dr. John",
                        ),
                        _buildLiveDoctor(
                          context,
                          "assets/images/imageLive3.png",
                          "Dr. Emily",
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 30),
                  _buildSectionTitle("Popular Doctors"),
                  const SizedBox(height: 15),
                  SizedBox(
                    height: 180,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        _buildDoctorCard(
                          context,
                          "assets/images/feture4.png",
                          "Dr. Sarah",
                          "Cardiologist",
                        ),
                        _buildDoctorCard(
                          context,
                          "assets/images/feture2.png",
                          "Dr. John",
                          "Dermatologist",
                        ),
                        _buildDoctorCard(
                          context,
                          "assets/images/feture3.png",
                          "Dr. Emily",
                          "Pediatrician",
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        selectedItemColor: const Color(0xFF2F802B),
        unselectedItemColor: Colors.grey,
        onTap: (index) {},
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: "Home"),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble_outline),
            label: "Chat",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: "Appointments",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: "Profile",
          ),
        ],
      ),
    );
  }

  // ================== الأقسام ==================
  Widget _buildCategories() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildCategory(Icons.local_hospital, "Hospital", Colors.blue),
        _buildCategory(Icons.people, "Doctor", Colors.purple),
        _buildCategory(Icons.medical_services, "Medicine", Colors.orange),
        _buildCategory(Icons.emergency, "Ambulance", Colors.red),
      ],
    );
  }

  Widget _buildCategory(IconData icon, String title, Color color) {
    return Column(
      children: [
        CircleAvatar(
          radius: 28,
          backgroundColor: color.withOpacity(0.15),
          child: Icon(icon, size: 28, color: color),
        ),
        const SizedBox(height: 6),
        Text(
          title,
          style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }

  // ================== العناوين ==================
  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    );
  }

  // ================== دكتور لايف ==================
  Widget _buildLiveDoctor(BuildContext context, String image, String name) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          PageRouteBuilder(
            transitionDuration: const Duration(milliseconds: 600),
            pageBuilder: (_, __, ___) => DoctorDetailsView(
              image: image,
              name: name,
              specialty: "General",
            ),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(right: 15),
        child: Column(
          children: [
            Hero(
              tag: image,
              child: CircleAvatar(
                radius: 35,
                backgroundImage: AssetImage(image),
              ),
            ),
            const SizedBox(height: 6),
            Text(
              name,
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }

  // ================== كارت دكتور ==================
  Widget _buildDoctorCard(
    BuildContext context,
    String image,
    String name,
    String specialty,
  ) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          PageRouteBuilder(
            transitionDuration: const Duration(milliseconds: 600),
            pageBuilder: (_, __, ___) => DoctorDetailsView(
              image: image,
              name: name,
              specialty: specialty,
            ),
          ),
        );
      },
      child: Container(
        width: 140,
        margin: const EdgeInsets.only(right: 15),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 8),
          ],
        ),
        child: Column(
          children: [
            Hero(
              tag: image,
              child: CircleAvatar(
                radius: 35,
                backgroundImage: AssetImage(image),
              ),
            ),
            const SizedBox(height: 10),
            Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            Text(
              specialty,
              style: const TextStyle(color: Colors.grey, fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}
