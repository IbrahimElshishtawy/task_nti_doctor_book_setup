import '../data/books_data.dart';

class BooksLogic {
  // Get all categories
  static List<Map<String, dynamic>> getCategories() {
    return BooksData.categories;
  }

  // Get top rated books
  static List<Map<String, dynamic>> getTopRatedBooks() {
    return BooksData.topRatedBooks;
  }

  // Get new arrivals
  static List<Map<String, dynamic>> getNewBooks() {
    return BooksData.newBooks;
  }
}
