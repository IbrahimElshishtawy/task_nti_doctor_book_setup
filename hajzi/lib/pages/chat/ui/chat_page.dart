import 'package:flutter/material.dart';
import 'package:hajzi/pages/chat/data/chat_data.dart';
import 'package:hajzi/pages/chat/design/chat_list_tile.dart';
import 'package:hajzi/pages/chat/design/chat_list_tile_home.dart';
import 'package:hajzi/pages/chat/widget/individual_chat_page.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  const Color.fromARGB(255, 38, 166, 83),
                  const Color.fromARGB(255, 128, 203, 144),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          centerTitle: true,
          title: const Text(
            'Chats',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          bottom: TabBar(
            indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Colors.white.withOpacity(0.3),
            ),
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white70,
            labelStyle: const TextStyle(fontWeight: FontWeight.bold),
            tabs: const [
              Tab(text: 'Groups'),
              Tab(text: 'Doctors'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: ChatData.groupChats.length,
              itemBuilder: (context, index) {
                final group = ChatData.groupChats[index];
                return ChatListTile(
                  title: group['groupName'],
                  subtitle: group['lastMessage'],
                  time: group['timestamp'],
                  image: 'assets/icons/image.png',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) =>
                            IndividualChatPage(chatName: group['groupName']),
                      ),
                    );
                  },
                );
              },
            ),
            ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: ChatData.individualChats.length,
              itemBuilder: (context, index) {
                final chat = ChatData.individualChats[index];
                return ChatListTileHome(
                  title: chat['name'],
                  subtitle: chat['lastMessage'],
                  time: chat['timestamp'],
                  image: chat['image'],
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) =>
                            IndividualChatPage(chatName: chat['name']),
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
