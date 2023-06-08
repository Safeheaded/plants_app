import 'package:am_project/classes/shallow_book.dart';
import 'package:am_project/main.dart';
import 'package:am_project/models/book.dart';
import 'package:am_project/repositories/books_repository.dart';
import 'package:injectable/injectable.dart';

@named
@Injectable(as: BooksRepository)
class BooksService implements BooksRepository {
  @override
  Future<Book> addBook(ShallowBook shallowBook) async {
    final response = await supabase
        .from('books')
        .insert({
          'title': shallowBook.title,
          'author': shallowBook.author,
          'cover_url': shallowBook.coverUrl,
          'state': shallowBook.state.toString().split('.').last,
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
        .eq('state', 'wantToRead');
    if (response == null) return [];
    List<Book> books;
    books = (response as List).map((data) => Book.fromJson(data)).toList();
    return books;
  }

  @override
  Future<void> deleteBook(int bookId) async {
    await supabase.from('books').delete().eq('id', bookId);
  }

  @override
  Future<Book> updateBookState(int bookId, BookState bookState) async {
    String state = 'reading';
    if (bookState == BookState.read) {
      state = 'read';
    } else if (bookState == BookState.wantToRead) {
      state = 'wantToRead';
    }
    final response = await supabase
        .from('books')
        .update({'state': state})
        .eq('id', bookId)
        .select()
        .maybeSingle();
    return Book.fromJson(response);
  }
}
