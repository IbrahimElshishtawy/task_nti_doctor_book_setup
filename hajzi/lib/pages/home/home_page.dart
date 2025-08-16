import 'package:flutter/material.dart';
import 'package:hajzi/pages/home/controls/Feature_Doctor.dart';
import 'package:hajzi/pages/home/controls/Live_Doctor.dart';
import 'package:hajzi/pages/home/controls/Popular_Doctor.dart';
import 'package:hajzi/pages/home/controls/custom_btn.dart';
import 'package:hajzi/pages/home/controls/header_home_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: CustomScrollView(
        slivers: [
          // هنا HeaderHomePage مباشرة لأنه SliverAppBar
          HeaderHomePage(),

          // باقي المحتوى
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Live Doctors",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  LiveDoctor(),
                  const SizedBox(height: 10),
                  buttom(),

                  const SizedBox(height: 20),
                  const Text(
                    "Popular Doctor",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  PopularDoctor(),
                  const SizedBox(height: 20),
                  const Text(
                    "Feature Doctor",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  FeatureDoctor(),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: "Favorite",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.book), label: "Book"),
          BottomNavigationBarItem(icon: Icon(Icons.message), label: "Messages"),
        ],
      ),
    );
  }
}

// تعريف الكروت

class LiveDoctorCard extends StatelessWidget {
  final String image;
  const LiveDoctorCard({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      margin: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
      ),
      child: Align(
        alignment: Alignment.topRight,
        child: Container(
          margin: const EdgeInsets.all(8),
          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(6),
          ),
          child: const Text(
            "Live",
            style: TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

class PopularDoctorCard extends StatelessWidget {
  final String name, specialty, image;
  final double rating;
  const PopularDoctorCard({
    super.key,
    required this.name,
    required this.specialty,
    required this.rating,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: ListTile(
        leading: CircleAvatar(backgroundImage: AssetImage(image), radius: 28),
        title: Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(specialty),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.star, color: Colors.amber, size: 18),
            Text(
              rating.toString(),
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

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
