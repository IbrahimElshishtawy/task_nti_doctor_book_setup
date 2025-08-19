import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BooksData {
  static const List<Map<String, dynamic>> categories = [
    {"name": "Cardiology", "icon": FontAwesomeIcons.heartPulse},
    {"name": "Neurology", "icon": FontAwesomeIcons.brain},
    {"name": "Surgery", "icon": FontAwesomeIcons.userDoctor},
    {"name": "Pediatrics", "icon": FontAwesomeIcons.baby},
    {"name": "Dermatology", "icon": FontAwesomeIcons.handDots},
  ];

  static const List<Map<String, dynamic>> topRatedBooks = [
    {
      "title": "Cardiology Made Easy",
      "author": "Dr. Smith",
      "rating": 4.8,
      "image": "assets/images/cardiologyimagebppk.jpeg",
    },
    {
      "title": "Brain & Mind",
      "author": "Dr. Allen",
      "rating": 4.7,
      "image": "assets/images/brainmindbook.jpeg",
    },
  ];

  static const List<Map<String, dynamic>> newBooks = [
    {
      "title": "Modern Surgery",
      "author": "Dr. Brown",
      "rating": 4.5,
      "image": "assets/images/dern_Surgery.jpeg",
    },
    {
      "title": "Child Care Essentials",
      "author": "Dr. Emily",
      "rating": 4.3,
      "image": "assets/images/Child_Care_Essentials.jpeg",
    },
  ];
}
