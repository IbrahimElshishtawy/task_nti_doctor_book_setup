import 'package:flutter/material.dart';

class OnboardingController {
  final PageController pageController = PageController();
  int currentPage = 0;

  final List<Map<String, dynamic>> pages = [
    {
      "image": "assets/images/image1.png",
      "title": "Find Trusted Doctors",
      "desc":
          "Get access to top-rated doctors around you with just a few taps on your phone.",
    },
    {
      "image": "assets/images/image2.png",
      "title": "Choose Best Doctors",
      "desc":
          "Select from a wide range of specialists who best suit your needs.",
    },
    {
      "image": "assets/images/image3.png",
      "title": "Easy Appointments",
      "desc": "Book your appointments quickly and easily at your convenience.",
    },
  ];

  void onPageChanged(int index, VoidCallback updateUI) {
    currentPage = index;
    updateUI();
  }

  void nextPage(BuildContext context, VoidCallback updateUI) {
    if (currentPage < pages.length - 1) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    } else {
      Navigator.pushReplacementNamed(context, '/login');
    }
  }

  void skip(BuildContext context) {
    Navigator.pushReplacementNamed(context, '/login');
  }
}
