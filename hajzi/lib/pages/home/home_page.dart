import 'package:flutter/material.dart';
import 'package:hajzi/pages/home/controls/Feature_Doctor.dart';
import 'package:hajzi/pages/home/controls/Live_Doctor.dart';
import 'package:hajzi/pages/home/controls/Popular_Doctor.dart';
import 'package:hajzi/pages/home/controls/future_btn.dart';
import 'package:hajzi/pages/home/controls/header_home_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: CustomScrollView(
        slivers: [
          // هنا HeaderHomePage مباشرة لأنه SliverAppBar
          HeaderHomePage(),

          // باقي المحتوى
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Live Doctors",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  LiveDoctor(),
                  const SizedBox(height: 10),
                  FutureBtn(),
                  const SizedBox(height: 20),
                  const Text(
                    "Popular Doctor",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  PopularDoctor(),
                  const SizedBox(height: 20),
                  const Text(
                    "Feature Doctor",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  FeatureDoctor(),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Color.fromARGB(255, 136, 136, 153)),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite,
              color: Color.fromARGB(255, 136, 136, 153),
            ),
            label: "Favorite",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book, color: Color.fromARGB(255, 136, 136, 153)),
            label: "Book",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.message,
              color: Color.fromARGB(255, 136, 136, 153),
            ),
            label: "Messages",
          ),
        ],
      ),
    );
  }
}

// تعريف الكروت
