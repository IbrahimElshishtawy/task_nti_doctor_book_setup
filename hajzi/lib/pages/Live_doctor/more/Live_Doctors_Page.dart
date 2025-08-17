import 'package:flutter/material.dart';
import 'package:hajzi/pages/Live_doctor/Live_Page.dart';
import 'package:hajzi/pages/Live_doctor/more/widget/doctor_card_live_more.dart';

class LiveDoctorsPage extends StatelessWidget {
  const LiveDoctorsPage({super.key});

  // أطباء مباشرين
  final List<Map<String, String>> liveDoctors = const [
    {"name": "Dr. Alice", "image": "assets/images/feture4.png"},
    {"name": "Dr. Bob", "image": "assets/images/feture4.png"},
    {"name": "Dr. Charlie", "image": "assets/images/feture4.png"},
    {"name": "Dr. David", "image": "assets/images/feture4.png"},
  ];

  // أطباء غير مباشرين
  final List<Map<String, String>> offlineDoctors = const [
    {"name": "Dr. Emma", "image": "assets/images/feture4.png"},
    {"name": "Dr. Frank", "image": "assets/images/feture4.png"},
    {"name": "Dr. Grace", "image": "assets/images/feture4.png"},
    {"name": "Dr. Henry", "image": "assets/images/feture4.png"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 2,
        title: const Text(
          "Doctors",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // أطباء مباشرين
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: liveDoctors.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 0.8,
                ),
                itemBuilder: (context, index) {
                  final doctor = liveDoctors[index];
                  return DoctorCardLiveMore(
                    doctor: doctor,
                    isLive: true,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LivePage(),
                        ),
                      );
                    },
                  );
                },
              ),
              const SizedBox(height: 20),

              // أطباء غير مباشرين
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: offlineDoctors.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 0.8,
                ),
                itemBuilder: (context, index) {
                  final doctor = offlineDoctors[index];
                  return DoctorCardLiveMore(
                    doctor: doctor,
                    isLive: false,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LivePage(),
                        ),
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
