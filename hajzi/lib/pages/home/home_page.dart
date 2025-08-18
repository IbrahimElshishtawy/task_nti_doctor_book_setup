import 'package:flutter/material.dart';
import 'package:hajzi/models/user_model.dart';
import 'package:hajzi/pages/FavoriteDoctors/FavoriteDoctorsPage.dart';
import 'package:hajzi/pages/home/home_page_content.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  final PageController _pageController = PageController();

  // تعريف المستخدم الحالي
  final UserModel currentUser = UserModel(
    name: "Ahmed Ali",
    email: "ahmed.ali@gmail.com",
    phone: "+20 123 456 789",
    address: "123 Street, Cairo, Egypt",
    about: "Passionate doctor with 5 years expe rience in healthcare.",
    imageUrl: "assets/images/feture2.png",
    rating: 4.5,
    id: '2',
    role: 'patient',
  );

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        children: [
          // الصفحة الرئيسية مع تمرير المستخدم الحالي
          HomePageContent(user: currentUser),

          // صفحة المفضلة
          SingleChildScrollView(child: FavoriteDoctorsPage()),

          // صفحة الكتب
          SingleChildScrollView(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: List.generate(
                    15,
                    (index) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        "Book Item ${index + 1}",
                        style: const TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),

          // صفحة الرسائل
          SingleChildScrollView(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: List.generate(
                    10,
                    (index) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        "Message ${index + 1}",
                        style: const TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() => _currentIndex = index);
          _pageController.animateToPage(
            index,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
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
