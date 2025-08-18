import 'package:flutter/material.dart';
import 'package:hajzi/pages/more/Featured_Doctors_Page_more.dart';
import 'package:hajzi/pages/more/Live_Doctors_Page.dart';
import 'package:hajzi/pages/find_search/Find_Doctors_Page.dart';
import 'package:hajzi/pages/home/controls/Feature_Doctor.dart';
import 'package:hajzi/pages/home/controls/Live_Doctor.dart';
import 'package:hajzi/pages/home/controls/Popular_Doctor.dart';
import 'package:hajzi/pages/home/controls/future_btn.dart';
import 'package:hajzi/pages/home/controls/header_home_page.dart';
import 'package:hajzi/pages/home/widget/more_header.dart';
import 'package:hajzi/pages/more/Popular_Doctors_Page_more.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  void navigateToPage(BuildContext context, String pageName) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Scaffold(
          appBar: AppBar(title: Text(pageName)),
          body: Center(child: Text('صفحة $pageName')),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: CustomScrollView(
        slivers: [
          HeaderHomePage(
            onSearchTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FindDoctorsPage()),
              );
            },
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              const SizedBox(height: 0),

              // قسم Live Doctors مع إمكانية الضغط للذهاب للصفحة الكاملة
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
                child: const LiveDoctor(), // Widget يعرض لمحة عن Live Doctors
              ),

              const SizedBox(height: 20),
              const FutureBtn(),
              const SizedBox(height: 20),

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
              const PopularDoctor(),
              const SizedBox(height: 20),

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
              const SizedBox(height: 20),
            ]),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        backgroundColor: Colors.white,
        items: [
          _buildNavItem(Icons.home, "Home", 0),
          _buildNavItem(Icons.favorite, "Favorite", 1),
          _buildNavItem(Icons.book, "Book", 2),
          _buildNavItem(Icons.message, "Messages", 3),
        ],
      ),
    );
  }

  BottomNavigationBarItem _buildNavItem(
    IconData icon,
    String label,
    int index,
  ) {
    return BottomNavigationBarItem(
      icon: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: _currentIndex == index ? Colors.green : Colors.transparent,
        ),
        padding: const EdgeInsets.all(6),
        child: Icon(
          icon,
          color: _currentIndex == index
              ? Colors.white
              : const Color.fromARGB(255, 136, 136, 153),
        ),
      ),
      label: label,
    );
  }
}
