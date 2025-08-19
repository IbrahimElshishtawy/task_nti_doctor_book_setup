import 'package:flutter/material.dart';
import 'package:hajzi/pages/home/contants/home_page_content.dart';
import 'package:provider/provider.dart';
import 'package:hajzi/pages/FavoriteDoctors/ui/favorite_doctors_page.dart';
import 'package:hajzi/pages/book_medican/ui/medical_books_page.dart';
import 'package:hajzi/pages/chat/ui/chat_page.dart';
import '../logic/home_page_cubit.dart';
import '../data/current_user.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => HomePageLogic(),
      child: Consumer<HomePageLogic>(
        builder: (context, logic, _) {
          return Scaffold(
            backgroundColor: Colors.grey[100],
            body: PageView(
              controller: logic.pageController,
              physics: const BouncingScrollPhysics(),
              onPageChanged: logic.onPageChanged,
              children: [
                HomePageContent(user: currentUser),
                const FavoriteDoctorsPage(),
                const BooksPage(),
                const ChatPage(),
              ],
            ),
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              currentIndex: logic.currentIndex,
              onTap: logic.onTabTapped,
              backgroundColor: Colors.white,
              selectedFontSize: 13,
              unselectedFontSize: 12,
              items: [
                _buildNavItem(Icons.home, "Home", logic.currentIndex, 0),
                _buildNavItem(
                  Icons.favorite,
                  "Favorite",
                  logic.currentIndex,
                  1,
                ),
                _buildNavItem(Icons.book, "Books", logic.currentIndex, 2),
                _buildNavItem(Icons.message, "Messages", logic.currentIndex, 3),
              ],
            ),
          );
        },
      ),
    );
  }

  BottomNavigationBarItem _buildNavItem(
    IconData icon,
    String label,
    int currentIndex,
    int index,
  ) {
    return BottomNavigationBarItem(
      icon: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: currentIndex == index ? Colors.green : Colors.transparent,
        ),
        padding: const EdgeInsets.all(6),
        child: Icon(
          icon,
          color: currentIndex == index
              ? Colors.white
              : const Color.fromARGB(255, 136, 136, 153),
        ),
      ),
      label: label,
    );
  }
}
