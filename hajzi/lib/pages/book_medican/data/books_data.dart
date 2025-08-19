import 'package:flutter/material.dart';

class Book {
  final String title;
  final String author;
  final String image;
  final String description;
  final double rating;
  final String category;
  final String publishedDate;

  Book({
    required this.title,
    required this.author,
    required this.image,
    required this.description,
    required this.rating,
    required this.category,
    required this.publishedDate,
  });
}

final List<Map<String, dynamic>> categories = [
  {"name": "Cardiology", "icon": Icons.favorite},
  {"name": "Neurology", "icon": Icons.psychology},
  {"name": "Pediatrics", "icon": Icons.child_care},
  {"name": "Surgery", "icon": Icons.local_hospital},
];

final List<Book> books = [
  Book(
    title: "Advanced Cardiology",
    author: "Dr. Alice",
    image: "assets/images/cardiologyimagebppk.jpeg",
    description: "A comprehensive guide to advanced heart diseases.",
    rating: 4.8,
    category: "Cardiology",
    publishedDate: "2024",
  ),
  Book(
    title: "Brain and Nerves",
    author: "Dr. Bob",
    image: "assets/images/brainmindbook.jpeg",
    description: "Deep insights into neurology and brain science.",
    rating: 4.5,
    category: "Neurology",
    publishedDate: "2023",
  ),
  Book(
    title: "Pediatric Care Essentials",
    author: "Dr. Clara",
    image: "assets/images/Child_Care_Essentials.jpeg",
    description: "Latest research and practices in pediatrics.",
    rating: 4.9,
    category: "Pediatrics",
    publishedDate: "2025",
  ),
  Book(
    title: "Modern Surgery Techniques",
    author: "Dr. David",
    image: "assets/images/dern_Surgery.jpeg",
    description: "Innovative surgical techniques and practices.",
    rating: 4.6,
    category: "Surgery",
    publishedDate: "2022",
  ),
];
