import 'package:flutter/material.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Map<String, dynamic>> _pages = [
    {
      "image": "assets/images/image1.png",
      "title": "Find Trusted Doctors",
      "desc":
          "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of over 2000 years old.",
      "width": 460.0,
      "height": 447.0,
      "top": -20.0,
      "left": -104.0,
    },
    {
      "image": "assets/images/image2.png",
      "title": "Choose Best Doctors",
      "desc":
          "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of over 2000 years old.",
      "width": 497.0,
      "height": 447.0,
      "top": -20.0,
      "left": -20.0,
    },
    {
      "image": "assets/images/image3.png",
      "title": "Easy Appointments",
      "desc":
          "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of over 2000 years old.",
      "width": 460.0,
      "height": 447.0,
      "top": -20.0,
      "left": -104.0,
    },
  ];

  void _nextPage() {
    if (_currentPage < _pages.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    } else {
      Navigator.pushReplacementNamed(context, '/login');
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: _pages.length,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                itemBuilder: (_, index) {
                  final page = _pages[index];
                  return Column(
                    children: [
                      // الجزء العلوي مع الخلفية الخضراء الكبيرة
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          // خلفية كبيرة بلون متدرج
                          Container(
                            height: 350,
                            width: double.infinity,
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Color.fromARGB(255, 197, 241, 233),
                                  Color(0xFF00E6B8),
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(100),
                                bottomRight: Radius.circular(100),
                              ),
                            ),
                          ),
                          // الصورة فوق الخلفية
                          Positioned(
                            top: page["top"],
                            left: page["left"],
                            child: ClipOval(
                              child: Image.asset(
                                page["image"],
                                width: page["width"],
                                height: page["height"],
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 40),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40),
                        child: Column(
                          children: [
                            Text(
                              page["title"],
                              style: theme.textTheme.headlineSmall?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 15),
                            Text(
                              page["desc"],
                              style: theme.textTheme.bodyMedium?.copyWith(
                                color: Colors.grey[600],
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                _pages.length,
                (index) => AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  height: 8,
                  width: _currentPage == index ? 24 : 8,
                  decoration: BoxDecoration(
                    color: _currentPage == index
                        ? theme.colorScheme.primary
                        : Colors.grey[400],
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: _nextPage,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF00C6A2),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    _currentPage == _pages.length - 1 ? "Get Started" : "Next",
                    style: const TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/login');
              },
              child: const Text("Skip", style: TextStyle(color: Colors.grey)),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
