import 'package:flutter/material.dart';
import 'package:hajzi/pages/book_medican/widget/book_card.dart';
import 'package:hajzi/pages/book_medican/widget/category_card.dart';
import '../data/books_data.dart';
import '../logic/books_logic.dart';

import 'book_detail_page.dart';

class BooksPage extends StatelessWidget {
  const BooksPage({super.key});

  @override
  Widget build(BuildContext context) {
    final logic = BooksLogic();

    return Scaffold(
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
            // الفئات
            const Text(
              "Categories",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 80,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: categories
                    .map(
                      (cat) => Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: CategoryCardbook(
                          category: cat["name"], // ✅ الاسم
                          icon: cat["icon"], // ✅ الأيقون
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => BookDetailPage(
                                  book: logic
                                      .getBooksByCategory(cat["name"])
                                      .first,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
            const SizedBox(height: 20),

            // الكتب الأعلى تقييم
            const Text(
              "Top Rated",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 220,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: logic.getTopRatedBooks().take(3).map((book) {
                  // ✅ بس 3
                  return SizedBox(
                    width: 140,
                    child: BookCardm(
                      book: book,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => BookDetailPage(book: book),
                          ),
                        );
                      },
                    ),
                  );
                }).toList(),
              ),
            ),

            const SizedBox(height: 20),

            // الكتب الجديدة
            const Text(
              "New Releases",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 220,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: logic.getNewBooks().take(3).map((book) {
                  // ✅ بس 3
                  return SizedBox(
                    width: 140,
                    child: BookCardm(
                      book: book,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => BookDetailPage(book: book),
                          ),
                        );
                      },
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
