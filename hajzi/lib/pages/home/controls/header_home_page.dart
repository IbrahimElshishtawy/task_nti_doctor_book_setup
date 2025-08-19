// ignore_for_file: deprecated_member_use

import 'dart:ui'; // 👈 مهم للـ BackdropFilter
import 'package:flutter/material.dart';
import 'package:hajzi/pages/Settings/Settings_Page.dart';
import 'package:hajzi/pages/profile/Profile_Page.dart';
import 'package:hajzi/models/user_model.dart';

class HeaderHomePage extends StatefulWidget {
  final VoidCallback onSearchTap;
  final UserModel user;

  const HeaderHomePage({
    super.key,
    required this.onSearchTap,
    required this.user,
  });

  @override
  State<HeaderHomePage> createState() => _HeaderHomePageState();
}

class _HeaderHomePageState extends State<HeaderHomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Color?> _color1;
  late Animation<Color?> _color2;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat(reverse: true);

    _color1 = ColorTween(
      begin: const Color.fromARGB(255, 15, 107, 53),
      end: const Color.fromRGBO(17, 149, 72, 1),
    ).animate(_controller);
    _color2 = ColorTween(
      begin: const Color(0xFF27AE60),
      end: const Color.fromARGB(255, 22, 108, 58),
    ).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      expandedHeight: 120,
      pinned: true,
      elevation: 6,
      backgroundColor: Colors.transparent,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(25)),
      ),

      title: Row(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ProfilePage(user: widget.user),
                ),
              );
            },
            child: CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage(widget.user.imagePath),
            ),
          ),
          const SizedBox(width: 10),
          Text(
            "Hi, ${widget.user.name}",
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          const Spacer(),
          Container(
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              shape: BoxShape.circle,
            ),
            child: IconButton(
              icon: const Icon(Icons.settings, color: Colors.white),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => SettingsPage()),
                );
              },
            ),
          ),
        ],
      ),

      flexibleSpace: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  _color1.value ?? Colors.green,
                  _color2.value ?? Colors.greenAccent,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: const BorderRadius.vertical(
                bottom: Radius.circular(25),
              ),
            ),
            child: Stack(
              children: [
                // Search Box
                Positioned(
                  left: 16,
                  right: 16,
                  bottom: 5,
                  child: GestureDetector(
                    onTap: widget.onSearchTap,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8), // زجاج
                        child: Container(
                          height: 50,
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.25), // 👈 شفاف
                            borderRadius: BorderRadius.circular(25),
                            border: Border.all(
                              color: Colors.white.withOpacity(0.3),
                              width: 1.2,
                            ),
                          ),
                          child: Row(
                            children: const [
                              Icon(Icons.search, color: Colors.white70),
                              SizedBox(width: 10),
                              Expanded(
                                child: Text(
                                  "Search doctor or health issue",
                                  style: TextStyle(
                                    color: Colors.white70,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
