import 'package:flutter/material.dart';
import 'package:hajzi/models/user_model.dart';
import 'package:hajzi/pages/profile/Profile_Page.dart';
import 'glass_card.dart';

class ProfileCard extends StatelessWidget {
  final UserModel user;

  const ProfileCard({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      child: ListTile(
        leading: CircleAvatar(
          radius: 28,
          backgroundImage: AssetImage(user.imageUrl),
        ),
        title: Text(
          user.name,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
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
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => ProfilePage(user: user)),
          );
        },
      ),
    );
  }
}
