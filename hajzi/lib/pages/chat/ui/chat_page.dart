import 'package:flutter/material.dart';
import 'package:hajzi/pages/chat/data/chat_data.dart';
import 'package:hajzi/pages/chat/design/chat_list_tile.dart';
import 'package:hajzi/pages/chat/design/message_bubble.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Chats'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Groups'),
              Tab(text: 'Doctors'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            // جروبات التخصصات
            ListView.builder(
              itemCount: ChatData.groupChats.length,
              itemBuilder: (context, index) {
                final group = ChatData.groupChats[index];
                return ChatListTile(
                  title: group['groupName'],
                  subtitle: group['lastMessage'],
                  time: group['timestamp'],
                  image: 'assets/images/group_icon.png',
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
              itemCount: ChatData.individualChats.length,
              itemBuilder: (context, index) {
                final chat = ChatData.individualChats[index];
                return ChatListTile(
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

class IndividualChatPage extends StatelessWidget {
  final String chatName;

  const IndividualChatPage({required this.chatName, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(chatName)),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(8),
              children: const [
                MessageBubble(message: "Hello!", isMe: false),
                MessageBubble(message: "Hi, how are you?", isMe: true),
                MessageBubble(message: "I'm good, thanks!", isMe: false),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: const InputDecoration(
                      hintText: "Type a message",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton(onPressed: () {}, child: const Icon(Icons.send)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
