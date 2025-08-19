import '../data/books_data.dart';

class BooksLogic {
  List<Book> getTopRatedBooks() {
    return books.where((book) => book.rating > 4.7).toList();
  }

  List<Book> getNewBooks() {
    return books.where((book) => book.publishedDate == "2025").toList();
  }

  List<Book> getBooksByCategory(String category) {
    return books.where((book) => book.category == category).toList();
  }
}
