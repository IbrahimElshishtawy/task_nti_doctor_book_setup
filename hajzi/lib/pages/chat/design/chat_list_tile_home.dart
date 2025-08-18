import 'package:flutter/material.dart';

class ChatListTileHome extends StatelessWidget {
  final String title;
  final String subtitle;
  final String time;
  final String image;
  final VoidCallback onTap;

  const ChatListTileHome({
    required this.title,
    required this.subtitle,
    required this.time,
    required this.image,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        elevation: 2,
        margin: const EdgeInsets.symmetric(vertical: 6),
        child: ListTile(
          leading: CircleAvatar(backgroundImage: AssetImage(image), radius: 26),
          title: Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text(subtitle),
          trailing: Text(
            time,
            style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
          ),
        ),
      ),
    );
  }
}
