import '../models/open_library_model.dart';

abstract class OpenLibraryRepository {
  Future<List<BookDoc>> searchBooks(String bookTitle);
}