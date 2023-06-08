import 'package:am_project/models/book.dart';
import 'package:equatable/equatable.dart';

class ShallowBook extends Equatable {
  final String title;
  final String author;
  final String coverUrl;
  final BookState state;

  const ShallowBook(this.title, this.author, this.coverUrl, this.state);

  @override
  List<Object?> get props => [title, author, coverUrl];
}
