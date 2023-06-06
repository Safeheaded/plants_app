import 'dart:convert';
import 'package:am_project/models/open_library_model.dart';
import 'package:am_project/repositories/open_library_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:http/http.dart' as http;

@named
@Injectable(as: OpenLibraryRepository)
class OpenLibraryService implements OpenLibraryRepository {
  @override
  Future<List<BookDoc>> searchBooks(String bookTitle) async {
    final encodedQuery = Uri.encodeComponent(bookTitle);
    final uri = Uri.parse(
        'https://openlibrary.org/search.json?q=$encodedQuery&fields=title,cover_i,author_name&limit=10');
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final openLibraryModel = OpenLibraryModel.fromJson(data);
      return openLibraryModel.docs;
    } else {
      throw Exception('Failed to load books');
    }
  }
}
