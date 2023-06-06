import 'package:am_project/classes/shallow_book.dart';
import 'package:am_project/main.dart';
import 'package:am_project/models/book.dart';
import 'package:am_project/repositories/books_repository.dart';
import 'package:injectable/injectable.dart';

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
        .maybeSingle();
    return Book.fromJson(response);
  }

  @override
  Future<List<Book>> getReadingBooks() async {
    final response = await supabase
        .from('books')
        .select()
        .eq('user_id', supabase.auth.currentUser!.id)
        .eq('state', 'reading');
    if (response == null) return [];
    List<Book> books;
    books = (response as List).map((data) => Book.fromJson(data)).toList();
    return books;
  }

  @override
  Future<List<Book>> getReadBook() async {
    final response = await supabase
        .from('books')
        .select()
        .eq('user_id', supabase.auth.currentUser!.id)
        .eq('state', 'read')
        .maybeSingle();
    if (response == null) return [];
    List<Book> books;
    books = (response as List).map((data) => Book.fromJson(data)).toList();
    return books;
  }

  @override
  Future<List<Book>> getWantToReadBooks() async {
    final response = await supabase
        .from('books')
        .select()
        .eq('user_id', supabase.auth.currentUser!.id)
        .eq('state', 'wantToRead')
        .maybeSingle();
    if (response == null) return [];
    List<Book> books;
    books = (response as List).map((data) => Book.fromJson(data)).toList();
    return books;
  }
}
