import 'package:flutter/material.dart';
import 'package:hajzi/pages/home/widget/more_header.dart';
import 'package:hajzi/pages/home/controls/Live_Doctor.dart';
import 'package:hajzi/pages/more/Live_Doctors_Page.dart';

class LiveDoctorsSection extends StatelessWidget {
  const LiveDoctorsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          MoreHeader(
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
          const SizedBox(height: 10),
          GestureDetector(
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
        ],
      ),
    );
  }
}
