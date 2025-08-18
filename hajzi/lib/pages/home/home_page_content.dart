import 'package:flutter/material.dart';
import 'package:hajzi/models/user_model.dart';
import 'package:hajzi/pages/find_search/Find_Doctors_Page.dart';
import 'package:hajzi/pages/home/controls/Feature_Doctor.dart';
import 'package:hajzi/pages/home/controls/Live_Doctor.dart';
import 'package:hajzi/pages/home/controls/Popular_Doctor.dart';
import 'package:hajzi/pages/home/controls/future_btn.dart';
import 'package:hajzi/pages/home/controls/header_home_page.dart';
import 'package:hajzi/pages/home/widget/more_header.dart';
import 'package:hajzi/pages/more/Featured_Doctors_Page_more.dart';
import 'package:hajzi/pages/more/Live_Doctors_Page.dart';
import 'package:hajzi/pages/more/Popular_Doctors_Page_more.dart';
import 'package:hajzi/pages/profile/DoctorDetailPage.dart';

class HomePageContent extends StatelessWidget {
  final UserModel user;

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

  const HomePageContent({super.key, required this.user});

  void navigateToDoctor(BuildContext context, Map<String, dynamic> doctor) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DoctorDetailPage(
          name: doctor['name'],
          specialty: doctor['specialty'],
          rating: doctor['rating'],
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

        // Popular Doctors List
        SliverList(
          delegate: SliverChildBuilderDelegate((context, index) {
            final doctor = popularDoctors[index];
            return GestureDetector(
              onTap: () => navigateToDoctor(context, doctor),
              child: PopularDoctorCard(doctor: doctor),
            );
          }, childCount: popularDoctors.length),
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
