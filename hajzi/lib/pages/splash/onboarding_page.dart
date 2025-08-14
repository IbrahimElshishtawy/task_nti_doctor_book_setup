import 'package:flutter/material.dart';
import 'package:hajzi/pages/splash/controls/onboarding_controller.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final controller = OnboardingController();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: controller.pageController,
                itemCount: controller.pages.length,
                onPageChanged: (index) =>
                    controller.onPageChanged(index, () => setState(() {})),
                itemBuilder: (_, index) {
                  final page = controller.pages[index];
                  return Column(
                    children: [
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Container(
                            height: 400,
                            width: double.infinity,
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                colors: [Color(0xFFA5F5E1), Color(0xFF00E6B8)],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(90),
                                bottomRight: Radius.circular(90),
                              ),
                            ),
                          ),
                          Positioned(
                            top: 30,
                            left: 20,
                            right: 35,
                            child: Center(
                              child: Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.15),
                                      blurRadius: 20,
                                      offset: const Offset(0, 8),
                                    ),
                                  ],
                                ),
                                child: ClipOval(
                                  child: Image.asset(
                                    page["image"],
                                    width: 350,
                                    height: 350,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 50),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40),
                        child: Column(
                          children: [
                            Text(
                              page["title"],
                              style: theme.textTheme.headlineSmall?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 15),
                            Text(
                              page["desc"],
                              style: theme.textTheme.bodyMedium?.copyWith(
                                color: Colors.grey[700],
                                height: 1.5,
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
                controller.pages.length,
                (index) => AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  height: 10,
                  width: controller.currentPage == index ? 26 : 10,
                  decoration: BoxDecoration(
                    color: controller.currentPage == index
                        ? const Color(0xFF00C6A2)
                        : Colors.grey[300],
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  onPressed: () =>
                      controller.nextPage(context, () => setState(() {})),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF00C6A2),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  child: Text(
                    controller.currentPage == controller.pages.length - 1
                        ? "Get Started"
                        : "Next",
                    style: const TextStyle(fontSize: 17, color: Colors.white),
                  ),
                ),
              ),
            ),
            TextButton(
              onPressed: () => controller.skip(context),
              child: const Text(
                "Skip",
                style: TextStyle(color: Colors.grey, fontSize: 15),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
