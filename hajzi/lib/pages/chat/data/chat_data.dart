class ChatData {
  static const List<Map<String, dynamic>> individualChats = [
    {
      "name": "Dr. Alice",
      "specialty": "Cardiologist",
      "image": "assets/images/imagepopular2.png",
      "lastMessage": "Hello! How can I help you?",
      "timestamp": "10:30 AM",
    },
    {
      "name": "Dr. Bob",
      "specialty": "Dentist",
      "image": "assets/images/imagepopular2.png",
      "lastMessage": "Your appointment is confirmed.",
      "timestamp": "Yesterday",
    },
  ];

  static const List<Map<String, dynamic>> groupChats = [
    {
      "groupName": "Cardiologists Group",
      "lastMessage": "New guidelines released today.",
      "timestamp": "09:00 AM",
    },
    {
      "groupName": "Dentists Group",
      "lastMessage": "Reminder: Seminar tomorrow.",
      "timestamp": "Yesterday",
    },
  ];
}
