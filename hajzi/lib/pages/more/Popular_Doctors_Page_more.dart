// ignore_for_file: file_names, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:hajzi/pages/Book/Booking_Page_doctor.dart';

class PopularDoctorsPage extends StatelessWidget {
  const PopularDoctorsPage({super.key});

  final List<Map<String, dynamic>> popularDoctors = const [
    {
      "name": "Dr. Alice",
      "specialty": "Cardiologist",
      "details": "Heart specialist at City Hospital.",
      "image": "assets/images/imagepopular2.png",
      "experience": 10,
      "rating": 4.5,
    },
    {
      "name": "Dr. Bob",
      "specialty": "Dentist",
      "details": "Expert in cosmetic dentistry. Works at Smile Clinic.",
      "image": "assets/images/imagepopular2.png",
      "experience": 8,
      "rating": 4.0,
    },
    {
      "name": "Dr. Carol",
      "specialty": "Neurologist",
      "details": "Brain disorder specialist. Central Neuro Center.",
      "image": "assets/images/imagepopular2.png",
      "experience": 12,
      "rating": 4.8,
    },
    {
      "name": "Dr. David",
      "specialty": "Pediatrician",
      "details": "Child care and vaccinations. Happy Kids Clinic.",
      "image": "assets/images/imagepopular2.png",
      "experience": 7,
      "rating": 4.2,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FA),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          title: const Text(
            'Popular Doctors',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 2,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(25)),
          ),
          iconTheme: const IconThemeData(color: Colors.black87),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        itemCount: popularDoctors.length,
        itemBuilder: (context, index) {
          final doctor = popularDoctors[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BookingPage(
                    imageUrl: doctor["image"],
                    nameDoctor: doctor["name"],
                    specialty: doctor["specialty"],
                  ),
                ),
              );
            },
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // صورة الطبيب في الأعلى
                  ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                    child: Image.asset(
                      doctor["image"],
                      height: 180,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          doctor["name"],
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          doctor["specialty"],
                          style: const TextStyle(
                            fontSize: 16,
                            fontStyle: FontStyle.italic,
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          "Experience: ${doctor["experience"]} years",
                          style: const TextStyle(fontSize: 14),
                        ),
                        const SizedBox(height: 5),
                        Row(
                          children: [
                            const Icon(
                              Icons.star,
                              color: Colors.yellow,
                              size: 16,
                            ),
                            const SizedBox(width: 5),
                            Text(
                              "${doctor["rating"]}",
                              style: const TextStyle(fontSize: 14),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        // زر الحجز
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => BookingPage(
                                    imageUrl: doctor["image"],
                                    nameDoctor: doctor["name"],
                                    specialty: doctor["specialty"],
                                  ),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color.fromARGB(
                                255,
                                11,
                                218,
                                121,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              padding: const EdgeInsets.symmetric(vertical: 12),
                            ),
                            child: const Text(
                              "Book Appointment",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
