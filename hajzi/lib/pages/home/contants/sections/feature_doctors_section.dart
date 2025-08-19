import 'package:flutter/material.dart';
import 'package:hajzi/pages/home/widget/more_header.dart';
import 'package:hajzi/pages/home/controls/Feature_Doctor.dart';
import 'package:hajzi/pages/more/Featured_Doctors_Page_more.dart';

class FeatureDoctorsSection extends StatelessWidget {
  const FeatureDoctorsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          MoreHeader(
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
          const SizedBox(height: 10),
          const FeatureDoctor(),
        ],
      ),
    );
  }
}
