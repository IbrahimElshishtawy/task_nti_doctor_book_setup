import 'package:flutter/material.dart';

class HomePageLogic extends ChangeNotifier {
  int currentIndex = 0;
  final PageController pageController = PageController();

  void onPageChanged(int index) {
    currentIndex = index;
    notifyListeners();
  }

  void onTabTapped(int index) {
    currentIndex = index;
    pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeOutCubic,
    );
    notifyListeners();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}
