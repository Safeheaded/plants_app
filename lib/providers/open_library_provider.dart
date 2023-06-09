import 'package:am_project/models/open_library_model.dart';
import 'package:am_project/repositories/open_library_repository.dart';
import 'package:am_project/services/open_library_service.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@Singleton()
class OpenLibraryProvider extends ChangeNotifier {
  final List<BookDoc> _books = [];

  List<BookDoc> get books => _books;

  Future<List<BookDoc>> searchBooks(String bookTitle) async {
    _books.clear();
    final books = await _openLibraryRepository.searchBooks(bookTitle);
    _books.addAll(books.where((book) => book.coverI != null).toList());
    notifyListeners();
    return _books;
  }

  final OpenLibraryRepository _openLibraryRepository;
  OpenLibraryProvider(
      @Named.from(OpenLibraryService) this._openLibraryRepository);
}
