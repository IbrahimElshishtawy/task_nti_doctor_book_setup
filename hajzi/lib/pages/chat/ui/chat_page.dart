// ignore_for_file: unnecessary_import

import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:hajzi/pages/chat/widget/custom_appbar.dart';
import 'package:hajzi/pages/chat/widget/chat_tabs.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Color?> _color1;
  late Animation<Color?> _color2;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 8),
    )..repeat(reverse: true);

    _color1 = ColorTween(
      begin: const Color(0xFF26A65B),
      end: const Color(0xFF6A11CB),
    ).animate(_controller);

    _color2 = ColorTween(
      begin: const Color(0xFF38ef7d),
      end: const Color(0xFF2575FC),
    ).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: CustomAppBar(
          controller: _controller,
          color1: _color1,
          color2: _color2,
        ),
        body: const ChatTabs(),
      ),
    );
  }
}
