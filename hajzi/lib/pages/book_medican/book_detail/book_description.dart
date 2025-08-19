import 'package:flutter/material.dart';
import '../data/books_data.dart';

class BookDescription extends StatelessWidget {
  final Book book;

  const BookDescription({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Description",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Text(
          book.description,
          style: const TextStyle(
            fontSize: 16,
            height: 1.5,
            color: Colors.black87,
          ),
          textAlign: TextAlign.justify,
        ),
      ],
    );
  }
}
