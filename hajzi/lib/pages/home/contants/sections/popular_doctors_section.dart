import 'package:flutter/material.dart';
import 'package:hajzi/pages/home/widget/more_header.dart';
import 'package:hajzi/pages/more/Popular_Doctors_Page_more.dart';
import 'package:hajzi/pages/profile/DoctorDetailPage.dart';

class PopularDoctorsSection extends StatelessWidget {
  const PopularDoctorsSection({super.key});

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

  void navigateToDoctor(BuildContext context, Map<String, dynamic> doctor) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DoctorDetailPage(
          name: doctor['name'],
          specialty: doctor['specialty'],
          rating: doctor['rating'].toDouble(),
          image: doctor['image'],
          details: doctor['details'],
          experience: doctor['experience'],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          MoreHeader(
            title: "Popular Doctor",
            onMoreTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const PopularDoctorsPage(),
                ),
              );
            },
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 260,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: popularDoctors.length,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemBuilder: (context, index) {
                final doctor = popularDoctors[index];
                return GestureDetector(
                  onTap: () => navigateToDoctor(context, doctor),
                  child: Container(
                    width: 180,
                    margin: const EdgeInsets.only(right: 16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: LinearGradient(
                        colors: [
                          Colors.white,
                          Colors.tealAccent.shade100.withOpacity(0.3),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 10,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: const EdgeInsets.all(12),
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            image: DecorationImage(
                              image: AssetImage(doctor['image']),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Text(
                          doctor['name'],
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          doctor['specialty'],
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 12,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.star,
                              color: Colors.yellow,
                              size: 14,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              "${doctor['rating']}",
                              style: const TextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        ElevatedButton(
                          onPressed: () => navigateToDoctor(context, doctor),
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
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 6,
                            ),
                          ),
                          child: const Text(
                            "View",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
