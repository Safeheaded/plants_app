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

  BooksProvider(@Named.from(BooksService) this._booksRepository);

  List<Book> get readingBooks => _readingBooks;

  Future<void> addReadingBook(ShallowBook shallowBook) async {
    Book book = await _booksRepository.addReadingBook(shallowBook);
    _readingBooks.add(book);
    notifyListeners();
  }
}
