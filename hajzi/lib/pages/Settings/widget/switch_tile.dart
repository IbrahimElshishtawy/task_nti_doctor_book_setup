import 'package:flutter/material.dart';

class SwitchTile extends StatelessWidget {
  final String title;
  final bool value;
  final IconData icon;
  final Color iconColor;
  final Function(bool) onChanged;

  const SwitchTile({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
    required this.iconColor,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      value: value,
      onChanged: onChanged,
      title: Text(title, style: const TextStyle(color: Colors.white)),
      secondary: Icon(icon, color: iconColor),
    );
  }
}
