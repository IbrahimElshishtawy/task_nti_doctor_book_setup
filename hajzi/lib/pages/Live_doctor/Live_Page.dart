// ignore_for_file: deprecated_member_use, file_names

import 'package:flutter/material.dart';
import 'widgets/comment_item.dart';
import 'widgets/comment_input.dart';
import 'widgets/live_appbar.dart'; // استدعاء ملف AppBar

class LivePage extends StatefulWidget {
  const LivePage({super.key});

  @override
  State<LivePage> createState() => _LivePageState();
}

class _LivePageState extends State<LivePage> {
  final TextEditingController _commentController = TextEditingController();
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();

  final List<Map<String, String>> _comments = [
    {
      "name": "Alice",
      "text": "Great stream 👌",
      "avatar": "assets/images/feture2.png",
    },
    {
      "name": "Bob",
      "text": "Doctor explained very well ❤️",
      "avatar": "assets/images/feture2.png",
    },
    {
      "name": "Charlie",
      "text": "Thanks for sharing 🙏",
      "avatar": "assets/images/feture2.png",
    },
  ];

  final String defaultAvatar = "assets/images/feture2.png";
  final List<String> defaultNames = [
    "David",
    "Eva",
    "Frank",
    "Grace",
    "Hannah",
    "Ian",
    "Julia",
  ];

  void _addComment() {
    if (_commentController.text.trim().isNotEmpty) {
      final name = (defaultNames..shuffle()).first;
      final newComment = {
        "text": _commentController.text.trim(),
        "avatar": defaultAvatar,
        "name": name,
      };
      _comments.insert(0, newComment);
      _listKey.currentState?.insertItem(
        0,
        duration: const Duration(milliseconds: 300),
      );
      _commentController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: true,
      appBar: const LiveAppBar(), // استخدام AppBar الجديد
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/feture2.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(color: Colors.black.withOpacity(0.3)),
          Column(
            children: [
              Expanded(
                child: AnimatedList(
                  key: _listKey,
                  reverse: true,
                  padding: const EdgeInsets.all(12),
                  initialItemCount: _comments.length,
                  itemBuilder: (context, index, animation) {
                    return CommentItem(
                      comment: _comments[index],
                      animation: animation,
                    );
                  },
                ),
              ),
              CommentInput(controller: _commentController, onSend: _addComment),
            ],
          ),
        ],
      ),
    );
  }
}
