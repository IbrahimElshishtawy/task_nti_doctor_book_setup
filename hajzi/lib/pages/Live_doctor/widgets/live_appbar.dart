import 'package:flutter/material.dart';

class LiveAppBar extends StatelessWidget implements PreferredSizeWidget {
  const LiveAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent, // شفافية كاملة
      elevation: 0, // إزالة الظل
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: Colors.white),
        onPressed: () => Navigator.pop(context),
      ),
      actions: const [
        Padding(
          padding: EdgeInsets.only(right: 12),
          child: CircleAvatar(
            radius: 18,
            backgroundImage: AssetImage("assets/images/feture2.png"),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
