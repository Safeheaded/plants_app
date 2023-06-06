import 'dart:convert';

import 'package:am_project/classes/shallow_book.dart';
import 'package:am_project/main.dart';
import 'package:am_project/models/book.dart';
import 'package:am_project/repositories/books_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

@named
@Injectable(as: BooksRepository)
class BooksService implements BooksRepository {
  @override
  Future<Book> addReadingBook(ShallowBook shallowBook) async {
    final response = await supabase
        .from('books')
        .insert({
          'title': shallowBook.title,
          'author': shallowBook.author,
          'cover_url': shallowBook.coverUrl,
          'state': 'reading',
          'user_id': supabase.auth.currentUser!.id,
        })
        .select()
        .single();
    return Book.fromJson(response);
  }

  @override
  Future<List<Book>> getBooks() {
    // TODO: implement getBooks
    throw UnimplementedError();
  }
}
