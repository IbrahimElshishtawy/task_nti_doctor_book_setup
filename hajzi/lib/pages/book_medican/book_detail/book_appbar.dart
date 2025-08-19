import 'package:flutter/material.dart';
import '../data/books_data.dart';

class BookAppBar extends StatelessWidget {
  final Book book;

  const BookAppBar({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 320,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        title: Text(
          book.title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            shadows: [Shadow(blurRadius: 4, color: Colors.black54)],
          ),
        ),
        background: Hero(
          tag: book.image,
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(25),
              bottomRight: Radius.circular(25),
            ),
            child: Image.asset(book.image, fit: BoxFit.cover),
          ),
        ),
      ),
    );
  }
}
