import 'package:flutter/material.dart';
import '../data/books_data.dart';

class BookDetailPage extends StatelessWidget {
  final Book book;

  const BookDetailPage({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(book.title)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.asset(book.image, height: 200),
            const SizedBox(height: 20),
            Text(
              book.title,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            Text(
              "By ${book.author}",
              style: const TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 10),
            Text("⭐ ${book.rating}", style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 10),
            Text(
              "Published: ${book.publishedDate}",
              style: const TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 20),
            Text(
              book.description,
              style: const TextStyle(fontSize: 16),
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ),
    );
  }
}
