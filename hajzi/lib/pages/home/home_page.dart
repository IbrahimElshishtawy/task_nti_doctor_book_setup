import 'package:flutter/material.dart';
import 'package:hajzi/pages/home/controls/Feature_Doctor.dart';
import 'package:hajzi/pages/home/controls/Live_Doctor.dart';
import 'package:hajzi/pages/home/controls/Popular_Doctor.dart';
import 'package:hajzi/pages/home/controls/future_btn.dart';
import 'package:hajzi/pages/home/controls/header_home_page.dart';

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

  Widget sectionHeader(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          InkWell(
            onTap: () => navigateToPage(context, title),
            child: const Text(
              "More",
              style: TextStyle(
                fontSize: 14,
                color: Colors.blueAccent,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
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
                MaterialPageRoute(
                  builder: (context) => Scaffold(
                    appBar: AppBar(title: const Text('Search Page')),
                  ),
                ),
              );
            },
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              const SizedBox(height: 10),
              sectionHeader(context, "Live Doctors"),
              const SizedBox(height: 10),
              const LiveDoctor(),
              const SizedBox(height: 10),
              const FutureBtn(),
              const SizedBox(height: 20),
              sectionHeader(context, "Popular Doctor"),
              const SizedBox(height: 10),
              const PopularDoctor(),
              const SizedBox(height: 20),
              sectionHeader(context, "Feature Doctor"),
              const SizedBox(height: 10),
              const FeatureDoctor(),
              const SizedBox(height: 20),
            ]),
          ),
        ],
      ),

      // Bottom Navigation Bar مع دائرة خضراء حول الأيقونة المحددة
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
