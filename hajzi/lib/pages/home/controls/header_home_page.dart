import 'package:flutter/material.dart';

class HeaderHomePage extends StatelessWidget {
  const HeaderHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      expandedHeight: 280,
      pinned: true,
      backgroundColor: Colors.transparent,
      flexibleSpace: LayoutBuilder(
        builder: (context, constraints) {
          double top = constraints.biggest.height;

          return FlexibleSpaceBar(
            background: ClipPath(
              clipper: HeaderClipper(),
              child: Container(
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xFF4ED97A),
                      Color(0xFF38C172),
                      Color(0xFF2FA031),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.15),
                      blurRadius: 12,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Stack(
                  children: [
                    // صورة واسم المستخدم + إشعارات
                    Positioned(
                      left: 20,
                      top: 50,
                      right: 20,
                      child: AnimatedOpacity(
                        duration: const Duration(milliseconds: 400),
                        opacity: top < 120 ? 0 : 1,
                        child: Row(
                          children: [
                            const CircleAvatar(
                              radius: 28,
                              backgroundImage: AssetImage(
                                "assets/images/feture2.png",
                              ),
                            ),
                            const SizedBox(width: 14),
                            const Text(
                              "Hi, Ahmed",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                shadows: [
                                  Shadow(
                                    color: Colors.black26,
                                    blurRadius: 4,
                                    offset: Offset(0, 2),
                                  ),
                                ],
                              ),
                            ),
                            const Spacer(),
                            AnimatedScale(
                              scale: top < 130 ? 0.8 : 1.0,
                              duration: const Duration(milliseconds: 300),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.2),
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black26,
                                      blurRadius: 4,
                                      offset: Offset(0, 2),
                                    ),
                                  ],
                                ),
                                child: IconButton(
                                  icon: const Icon(
                                    Icons.notifications_outlined,
                                    color: Colors.white,
                                  ),
                                  onPressed: () {},
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    // صندوق البحث
                    Positioned(
                      left: 20,
                      right: 20,
                      bottom: 20,
                      child: Container(
                        height: 50,
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.08),
                              blurRadius: 6,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Row(
                          children: const [
                            Icon(Icons.search, color: Colors.grey),
                            SizedBox(width: 12),
                            Text(
                              "Search doctor or health issue",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class HeaderClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - 80);

    path.quadraticBezierTo(
      size.width * 0.2,
      size.height,
      size.width * 0.5,
      size.height - 60,
    );

    path.quadraticBezierTo(
      size.width * 0.8,
      size.height - 120,
      size.width,
      size.height - 60,
    );

    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
