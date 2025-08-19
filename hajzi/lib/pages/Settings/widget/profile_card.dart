import 'package:flutter/material.dart';
import 'glass_card.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      child: ListTile(
        leading: const CircleAvatar(
          radius: 28,
          backgroundImage: AssetImage("assets/images/profile.png"),
        ),
        title: const Text(
          "Ibrahim Elsheshtawy",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        subtitle: const Text(
          "View profile",
          style: TextStyle(color: Colors.white70),
        ),
        trailing: const Icon(
          Icons.arrow_forward_ios,
          size: 18,
          color: Colors.white,
        ),
        onTap: () {},
      ),
    );
  }
}
