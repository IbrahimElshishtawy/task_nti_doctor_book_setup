import 'package:flutter/material.dart';
import 'package:hajzi/pages/chat/data/chat_data.dart';
import 'package:hajzi/pages/chat/design/chat_list_tile.dart';
import 'package:hajzi/pages/chat/design/chat_list_tile_home.dart';
import 'package:hajzi/pages/chat/widget/individual_chat_page.dart';

class ChatTabs extends StatelessWidget {
  const ChatTabs({super.key});

  @override
  Widget build(BuildContext context) {
    return TabBarView(
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
                    builder: (_) => IndividualChatPage(chatName: chat['name']),
                  ),
                );
              },
            );
          },
        ),
      ],
    );
  }
}
