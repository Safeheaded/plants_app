import 'dart:convert';

import 'package:am_project/models/open_library_model.dart';
import 'package:am_project/repositories/open_library_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:http/http.dart' as http;

@named
@Injectable(as: OpenLibraryService)
class OpenLibraryService implements OpenLibraryRepository {
  @override
  Future<List<BookDoc>> searchBooks(String bookTitle) async {
    final encodedQuery = Uri.encodeComponent(bookTitle);
    final response = await http.get(Uri.parse(
        'https://openlibrary.org/search.json?q=$encodedQuery&fields=title,cover_i&limit=10'));

    if (response.statusCode == 200) {
      final openLibraryModel =
          OpenLibraryModel.fromJson(jsonDecode(response.body));
      return openLibraryModel.docs;
    } else {
      throw Exception('Failed to load books');
    }
  }
}
