import 'package:flutter/material.dart';
import 'package:hajzi/pages/Settings/widget/glass_card.dart';
import 'package:hajzi/pages/Settings/widget/list_tile_item.dart';
import 'dart:ui';

import 'package:hajzi/pages/Settings/widget/profile_card.dart';
import 'package:hajzi/pages/Settings/widget/section_title.dart';
import 'package:hajzi/pages/Settings/widget/switch_tile.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool isDarkMode = false;
  bool notifications = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text(
          "Settings",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Stack(
        children: [
          // خلفية متدرجة
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF11998e), Color(0xFF38ef7d)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),

          // المحتوى
          ListView(
            padding: const EdgeInsets.fromLTRB(16, 100, 16, 16),
            children: [
              const ProfileCard(),
              const SizedBox(height: 25),

              const SectionTitle("General"),
              GlassCard(
                child: Column(
                  children: [
                    SwitchTile(
                      title: "Dark Mode",
                      value: isDarkMode,
                      icon: Icons.dark_mode,
                      iconColor: Colors.indigoAccent,
                      onChanged: (val) => setState(() => isDarkMode = val),
                    ),
                    const Divider(color: Colors.white24, height: 0),
                    SwitchTile(
                      title: "Notifications",
                      value: notifications,
                      icon: Icons.notifications,
                      iconColor: Colors.deepOrangeAccent,
                      onChanged: (val) => setState(() => notifications = val),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 25),

              const SectionTitle("Privacy"),
              GlassCard(
                child: Column(
                  children: [
                    ListTileItem(
                      title: "Change Password",
                      icon: Icons.lock,
                      color: Colors.blue,
                      onTap: () {},
                    ),
                    const Divider(color: Colors.white24, height: 0),
                    ListTileItem(
                      title: "Privacy Policy",
                      icon: Icons.privacy_tip,
                      color: Colors.greenAccent,
                      onTap: () {},
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 25),

              const SectionTitle("About"),
              GlassCard(
                child: ListTileItem(
                  title: "About this App",
                  icon: Icons.info,
                  color: Colors.purpleAccent,
                  onTap: () {
                    showAboutDialog(
                      context: context,
                      applicationName: "My Awesome App",
                      applicationVersion: "1.0.0",
                      applicationIcon: const Icon(
                        Icons.flutter_dash,
                        size: 40,
                        color: Colors.green,
                      ),
                      children: const [
                        Text(
                          "This app was developed to provide "
                          "a smooth chat experience with modern UI design.",
                        ),
                      ],
                    );
                  },
                ),
              ),
              const SizedBox(height: 40),

              // زر تسجيل الخروج
              Center(
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.redAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 14,
                    ),
                  ),
                  icon: const Icon(Icons.logout, color: Colors.white),
                  label: const Text(
                    "Logout",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
