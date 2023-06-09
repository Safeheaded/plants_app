import 'package:am_project/classes/shallow_book.dart';
import 'package:am_project/main.dart';
import 'package:am_project/models/book.dart';
import 'package:am_project/repositories/books_repository.dart';
import 'package:am_project/services/books_service.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@Singleton()
class BooksProvider extends ChangeNotifier {
  final BooksRepository _booksRepository;
  final List<Book> _readingBooks = [];
  final List<Book> _readBooks = [];
  final List<Book> _wantToReadBooks = [];

  BooksProvider(@Named.from(BooksService) this._booksRepository);

  List<Book> get readingBooks => _readingBooks;
  List<Book> get readBooks => _readBooks;
  List<Book> get wantToReadBooks => _wantToReadBooks;

  Future<Book> addBook(ShallowBook shallowBook) async {
    Book book = await _booksRepository.addBook(shallowBook);
    if (shallowBook.state == BookState.reading) {
      _readingBooks.add(book);
    } else if (shallowBook.state == BookState.read) {
      _readBooks.add(book);
    } else {
      _wantToReadBooks.add(book);
    }
    notifyListeners();
    return book;
  }

  Future<void> getReadingBooks() async {
    _readingBooks.clear();
    final books = await _booksRepository.getReadingBooks();
    _readingBooks.addAll(books);
    notifyListeners();
  }

  Future<void> getAllBooks() async {
    final responses = await Future.wait([
      _booksRepository.getWantToReadBooks(),
      _booksRepository.getReadingBooks(),
      _booksRepository.getReadBooks()
    ]);
    _wantToReadBooks.addAll(responses[0]);
    _readingBooks.addAll(responses[1]);
    _readBooks.addAll(responses[2]);
    notifyListeners();
  }

  Future<void> deleteBook(int bookId) async {
    await _booksRepository.deleteBook(bookId);
    _readingBooks.removeWhere((book) => book.id == bookId);
    _readBooks.removeWhere((book) => book.id == bookId);
    _wantToReadBooks.removeWhere((book) => book.id == bookId);
    notifyListeners();
  }

  Future<void> moveToReading(int bookId) async {
    final updatedBook =
        await _booksRepository.updateBookState(bookId, BookState.reading);
    _readingBooks.add(updatedBook);
    _wantToReadBooks.removeWhere((book) => book.id == bookId);
    notifyListeners();
  }

  Future<void> moveToRead(int bookId) async {
    final updatedBook =
        await _booksRepository.updateBookState(bookId, BookState.read);
    _readBooks.add(updatedBook);
    _readingBooks.removeWhere((book) => book.id == bookId);
    notifyListeners();
  }

  Future<String> uploadImage(int bookId, String bookTitle, XFile image) async {
    return await _booksRepository.uploadImage(bookId, bookTitle, image);
  }

  Future<Book> updateReadBook(int bookId,
      {String? image, double? latitude, double? longitude}) async {
    final updatedBook = await _booksRepository.updateBookState(
        bookId, BookState.read,
        image: image, latitude: latitude, longitude: longitude);

    _readingBooks.removeWhere((book) => book.id == bookId);
    _wantToReadBooks.removeWhere((book) => book.id == bookId);
    _readBooks.removeWhere((book) => book.id == bookId);
    _readBooks.add(updatedBook);

    notifyListeners();
    return updatedBook;
  }

  String? getImage(String? imageUrl) {
    if (imageUrl == null) {
      return null;
    }
    final tmp = imageUrl.split('/').last;
    return supabase.storage.from('places_images').getPublicUrl('public/$tmp');
  }

  void clearAll() {
    _readingBooks.clear();
    _readBooks.clear();
    _wantToReadBooks.clear();
    notifyListeners();
  }
}
