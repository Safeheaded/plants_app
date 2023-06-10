import 'package:am_project/classes/shallow_book.dart';
import 'package:am_project/models/book.dart';
import 'package:camera/camera.dart';

abstract class BooksRepository {
  Future<List<Book>> getReadingBooks();
  Future<List<Book>> getReadBook();
  Future<List<Book>> getWantToReadBooks();
  Future<Book> addBook(ShallowBook shallowBook);
  Future<void> deleteBook(int bookId);
  Future<Book> updateBookState(int bookId, BookState bookState,
      {String? image, double? latitude, double? longitude});
  Future<String> uploadImage(int bookId, String bookTitle, XFile image);
}
