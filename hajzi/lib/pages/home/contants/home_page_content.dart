import 'package:flutter/material.dart';
import 'package:hajzi/models/user_model.dart';
import 'package:hajzi/pages/find_search/Find_Doctors_Page.dart';
import 'package:hajzi/pages/home/controls/Feature_Doctor.dart';
import 'package:hajzi/pages/home/controls/Live_Doctor.dart';
import 'package:hajzi/pages/home/controls/future_btn.dart';
import 'package:hajzi/pages/home/controls/header_home_page.dart';
import 'package:hajzi/pages/home/widget/more_header.dart';
import 'package:hajzi/pages/more/Featured_Doctors_Page_more.dart';
import 'package:hajzi/pages/more/Live_Doctors_Page.dart';
import 'package:hajzi/pages/more/Popular_Doctors_Page_more.dart';
import 'package:hajzi/pages/profile/DoctorDetailPage.dart';

class HomePageContent extends StatelessWidget {
  final UserModel user;

  const HomePageContent({super.key, required this.user});

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

  Widget verticalSpace(double height) => SizedBox(height: height);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        // Header
        HeaderHomePage(
          user: user,
          onSearchTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => FindDoctorsPage()),
            );
          },
        ),

        // Live Doctors Section
        SliverToBoxAdapter(child: verticalSpace(10)),
        SliverToBoxAdapter(
          child: MoreHeader(
            title: "Live Doctors",
            onMoreTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const LiveDoctorsPage(),
                ),
              );
            },
          ),
        ),
        SliverToBoxAdapter(child: verticalSpace(10)),
        SliverToBoxAdapter(
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const LiveDoctorsPage(),
                ),
              );
            },
            child: const LiveDoctor(),
          ),
        ),
        SliverToBoxAdapter(child: verticalSpace(20)),

        // Future Button
        SliverToBoxAdapter(child: const FutureBtn()),
        SliverToBoxAdapter(child: verticalSpace(20)),

        // Popular Doctors Section Header
        SliverToBoxAdapter(
          child: MoreHeader(
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
        ),
        SliverToBoxAdapter(child: verticalSpace(10)),

        // Popular Doctors List Horizontal
        SliverToBoxAdapter(
          child: SizedBox(
            height: 260, // ارتفاع ثابت لكل بطاقة
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
        ),

        // Feature Doctors Section
        SliverToBoxAdapter(child: verticalSpace(20)),
        SliverToBoxAdapter(
          child: MoreHeader(
            title: "Feature Doctor",
            onMoreTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const FeaturedDoctorsPage(),
                ),
              );
            },
          ),
        ),
        SliverToBoxAdapter(child: verticalSpace(10)),
        SliverToBoxAdapter(child: const FeatureDoctor()),
        SliverToBoxAdapter(child: verticalSpace(20)),
      ],
    );
  }
}
