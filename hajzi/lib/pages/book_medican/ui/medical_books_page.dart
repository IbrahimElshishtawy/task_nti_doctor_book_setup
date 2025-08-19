import 'package:flutter/material.dart';
import 'package:hajzi/pages/book_medican/logic/books_logic.dart';
import '../design/book_widgets.dart';

class MedicalBooksPage extends StatelessWidget {
  const MedicalBooksPage({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = BooksLogic.getCategories();
    final topRatedBooks = BooksLogic.getTopRatedBooks();
    final newBooks = BooksLogic.getNewBooks();

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: const Text("Medical Books"),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 0, 150, 57),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Categories Row
            SizedBox(
              height: 90,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return CategoryCard(
                    name: categories[index]["name"],
                    icon: categories[index]["icon"],
                  );
                },
              ),
            ),

            const SizedBox(height: 20),

            // Top Rated Books
            const Text(
              "Top Rated Books",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 220,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: topRatedBooks.length,
                itemBuilder: (context, index) {
                  return BookCard(book: topRatedBooks[index]);
                },
              ),
            ),

            const SizedBox(height: 20),

            // New Arrivals
            const Text(
              "New Arrivals",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 220,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: newBooks.length,
                itemBuilder: (context, index) {
                  return BookCard(book: newBooks[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
