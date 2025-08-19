import 'package:flutter/material.dart';
import '../data/books_data.dart';

class BookCardm extends StatelessWidget {
  final Book book;
  final VoidCallback onTap;

  const BookCardm({super.key, required this.book, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 4,
        child: Column(
          children: [
            Expanded(child: Image.asset(book.image, fit: BoxFit.cover)),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                book.title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ),
            Text("⭐ ${book.rating}", style: const TextStyle(fontSize: 12)),
          ],
        ),
      ),
    );
  }
}
