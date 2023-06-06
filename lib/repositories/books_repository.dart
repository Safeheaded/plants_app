import 'package:am_project/classes/shallow_book.dart';
import 'package:am_project/models/book.dart';

abstract class BooksRepository {
  Future<List<Book>> getBooks();
  Future<Book> addReadingBook(ShallowBook shallowBook);
}
