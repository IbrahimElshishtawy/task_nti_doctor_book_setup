import 'package:flutter/material.dart';
import 'package:hajzi/models/user_model.dart';
import 'package:hajzi/pages/find_search/Find_Doctors_Page.dart';
import 'package:hajzi/pages/home/controls/future_btn.dart';
import 'package:hajzi/pages/home/controls/header_home_page.dart';

import 'sections/live_doctors_section.dart';
import 'sections/popular_doctors_section.dart';
import 'sections/feature_doctors_section.dart';

class HomePageContent extends StatelessWidget {
  final UserModel user;

  const HomePageContent({super.key, required this.user});

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

        // Live Doctors
        SliverToBoxAdapter(child: verticalSpace(10)),
        const LiveDoctorsSection(),

        // Future Button
        SliverToBoxAdapter(child: verticalSpace(20)),
        SliverToBoxAdapter(child: const FutureBtn()),

        // Popular Doctors
        SliverToBoxAdapter(child: verticalSpace(20)),
        const PopularDoctorsSection(),

        // Feature Doctors
        SliverToBoxAdapter(child: verticalSpace(20)),
        const FeatureDoctorsSection(),
      ],
    );
  }
}
