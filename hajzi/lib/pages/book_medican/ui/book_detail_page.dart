import 'package:flutter/material.dart';
import 'package:hajzi/pages/book_medican/book_detail/book_appbar.dart';
import 'package:hajzi/pages/book_medican/book_detail/book_description.dart';
import 'package:hajzi/pages/book_medican/book_detail/book_header.dart';
import 'package:hajzi/pages/book_medican/book_detail/read_button.dart';
import '../data/books_data.dart';

class BookDetailPage extends StatelessWidget {
  final Book book;

  const BookDetailPage({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: CustomScrollView(
        slivers: [
          BookAppBar(book: book),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BookHeader(book: book),
                  const SizedBox(height: 30),
                  BookDescription(book: book),
                  const SizedBox(height: 35),
                  const Center(child: ReadButton()),
                  const SizedBox(height: 25),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
