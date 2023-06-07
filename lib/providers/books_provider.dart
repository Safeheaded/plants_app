import 'package:am_project/classes/shallow_book.dart';
import 'package:am_project/models/book.dart';
import 'package:am_project/repositories/books_repository.dart';
import 'package:am_project/services/books_service.dart';
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

  Future<void> addReadingBook(ShallowBook shallowBook) async {
    Book book = await _booksRepository.addReadingBook(shallowBook);
    _readingBooks.add(book);
    notifyListeners();
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
      _booksRepository.getReadBook()
    ]);
    _wantToReadBooks.addAll(responses[0]);
    _readingBooks.addAll(responses[1]);
    _readBooks.addAll(responses[2]);
    notifyListeners();
  }
}
